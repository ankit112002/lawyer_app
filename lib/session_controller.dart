import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionController {
  SessionController._internal();
  static final SessionController _instance = SessionController._internal();
  static SessionController get instance => _instance;

  String? userId;
  String? token;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> setSession(String userId, String token) async {
    this.userId = userId;
    this.token = token;

    await _storage.write(key: "userId", value: userId);
    await _storage.write(key: "token", value: token);
  }

  Future<void> loadSession() async {
    userId = await _storage.read(key: "userId");
    token = await _storage.read(key: "token");
  }

  Future<void> clearSession() async {
    userId = null;
    token = null;

    await _storage.deleteAll();
  }

  bool get isLoggedIn => token != null;
}
