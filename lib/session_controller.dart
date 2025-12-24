import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lawyer/provider/api_provider.dart';
import 'package:provider/provider.dart';

class SessionController {
  SessionController._internal();
  static final SessionController _instance = SessionController._internal();
  static SessionController get instance => _instance;

  String? userId;
  String? token;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Save session
  Future<void> setSession(String userId, String token) async {
    this.userId = userId;
    this.token = token;

    await _storage.write(key: "userId", value: userId);
    await _storage.write(key: "token", value: token);
  }

  // Load session
  Future<void> loadSession() async {
    userId = await _storage.read(key: "userId");
    token = await _storage.read(key: "token");
  }

  // Clear session
  Future<void> clearSession() async {
    userId = null;
    token = null;
    await _storage.deleteAll();
  }

  // Restore session & set token to ApiProvider
  Future<void> restoreSession(BuildContext context) async {
    if (token != null && token!.isNotEmpty) {
      Provider.of<ApiProvider>(context, listen: false)
          .setAccessToken(token!); // profile fetch trigger hoga
    }
  }

  bool get isLoggedIn => token != null && token!.isNotEmpty;
}
