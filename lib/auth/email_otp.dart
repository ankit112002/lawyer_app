import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:lawyer/auth/signup_page.dart';
import 'package:lawyer/auth/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/api_provider.dart';
import '../provider/email_verify.dart';

class EmailOtp extends StatefulWidget {
  const EmailOtp({super.key});

  @override
  State<EmailOtp> createState() => _EmailOtpState();
}

class _EmailOtpState extends State<EmailOtp> {
  final TextEditingController emailController = TextEditingController();

  String otpCode = "";

  void showTopMessage(
      BuildContext context,
      String message, {
        bool success = false,
      }) {
    final overlay = Overlay.of(context);

    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 12,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: success ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);
    Future.delayed(const Duration(seconds: 2), entry.remove);
  }

  Future<String?> _getSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<EmailVerifyProvider>();
    final api = Provider.of<ApiProvider>(context);


    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SignupScreen()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0XFF655F2E),
          centerTitle: true,
          title: const Text("Verify OTP", style: TextStyle(color: Colors.white)),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Enter 6-digit OTP sent to your email",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),

              /// OTP Field
              OtpTextField(
                numberOfFields: 6,
                showFieldAsBox: true,
                fieldWidth: 45,
                borderRadius: BorderRadius.circular(8),
                onSubmit: (otp) => setState(() => otpCode = otp),
              ),


              const SizedBox(height: 40),

              /// Verify Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: provider.isLoading
                      ? null
                      : () async {
                    if (otpCode.length != 6) {
                      showTopMessage(
                        context,
                        "Please enter complete OTP",
                      );
                      return;
                    }

                    final email = await _getSavedEmail();
                    if (email == null) {
                      showTopMessage(
                        context,
                        "Email not found. Please signup again.",
                      );
                      return;
                    }

                    await provider.verifyEmail(email, otpCode);

                    final res = provider.response;
                    if (res == null) return;

                    showTopMessage(
                      context,
                      res.message,
                      success: res.success,
                    );

                    if (res.success) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString("email_otp", otpCode);
                      await Future.delayed(
                        const Duration(milliseconds: 600),
                      );

                      if (!mounted) return;

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignupPage(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF655F2E),
                          Color(0xFFD3A62A),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Center(
                      child: provider.isLoading
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : const Text(
                        "Verify OTP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: api.isLoading
                    ? null
                    : () async {
                  final prefs = await SharedPreferences.getInstance();
                  final email = prefs.getString("email");

                  if (email == null || !email.contains("@")) {
                    showTopMessage(
                      context,
                      "Email not found. Please signup again.",
                    );
                    return;
                  }

                  // 🔹 API CALL (Resend OTP)
                  await api.getEmaildata(email);

                  if (!mounted) return;

                  // 🔹 SHOW MESSAGE
                  if (api.emailSuccess) {
                    showTopMessage(
                      context,
                      "OTP resent to your email",
                      success: true,
                    );
                  } else {
                    showTopMessage(
                      context,
                      api.emailMessage,
                    );
                  }
                },
                child: api.isLoading
                    ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                    : const Text(
                  "Resend OTP",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF655F2E),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
