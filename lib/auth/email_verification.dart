import 'package:flutter/material.dart';
import 'package:lawyer/auth/signup_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/api_provider.dart';
import 'login_page.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final api = Provider.of<ApiProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF655F2E),
        centerTitle: true,
        title: const Text("Email Verification"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.07),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height * 0.02),

                // Title
                Text(
                  "Verify Your Email",
                  style: TextStyle(
                    fontSize: width * 0.065,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: height * 0.03),

                // Email field
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.02),

                // Show message from API (Success / Error)
                if (api.emailMessage.isNotEmpty)
                  Text(
                    api.emailMessage,
                    style: TextStyle(
                      color: api.emailSuccess ? Colors.green : Colors.red,
                      fontSize: width * 0.04,
                    ),
                    textAlign: TextAlign.center,
                  ),

                SizedBox(height: height * 0.02),

                // Button
                SizedBox(
                  width: width,
                  height: height * 0.06,
                  child: ElevatedButton(
                    onPressed: api.isLoading
                        ? null
                        : () async {
                      if (emailController.text.isEmpty ||
                          !emailController.text.contains("@")) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter a valid email."),
                          ),
                        );
                        return;
                      }

                      // Save email locally
                      var pref = await SharedPreferences.getInstance();
                      pref.setString("email", emailController.text);

                      // Call API
                      await api.getEmaildata(emailController.text);

                      // If success → next screen
                      if (api.emailSuccess) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SignupPage()),
                        );
                      }
                    },
                    child: api.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Send OTP"),
                  ),
                ),

                SizedBox(height: height * 0.02),

                // LOGIN TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",
                        style: TextStyle(fontSize: 16)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginPage()));
                      },
                      child: const Text(
                        " Login",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
