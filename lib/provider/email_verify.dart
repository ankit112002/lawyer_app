import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../services/api_services.dart';

class EmailVerifyProvider extends ChangeNotifier {
  bool _isLoading = false;
  ApiResponse? _response;

  bool get isLoading => _isLoading;
  ApiResponse? get response => _response;

  Future<void> verifyEmail(String email, String otp) async {
    _isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse(
        "https://yehia-api-nest.vkapsprojects.com/verifications/verify-otp", // ✅ use verify endpoint
      );

      final res = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "otp": otp, // ✅ check backend expects "otpCode" or "otp"
        }),
      ).timeout(const Duration(seconds: 15));

      dynamic body;
      try {
        body = jsonDecode(res.body);
      } catch (_) {
        body = null;
      }

      final isSuccess = (res.statusCode == 200 || res.statusCode == 201)
          && (body?["success"] ?? false); // ✅ check backend success flag

      if (isSuccess) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("email", email);
      }

      _response = ApiResponse(
        success: isSuccess,
        data: body,
        message: body?["message"]?.toString() ?? "Something went wrong",
        statusCode: res.statusCode,
      );
    } catch (e) {
      _response = ApiResponse(
        success: false,
        data: null,
        message: "Network Error: $e",
        statusCode: 0,
      );
    }

    _isLoading = false;
    notifyListeners();
  }

  void reset() {
    _response = null;
    notifyListeners();
  }
}
