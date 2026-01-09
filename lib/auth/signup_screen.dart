import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/api_provider.dart';
import '../screens/account/create_account_screen.dart';
import '../services/auth_services.dart';
import '../utility/custom_button.dart';
import 'email_otp.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController emailController = TextEditingController();


  @override
  void initState() {
    super.initState();

    // Run after first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final api = Provider.of<ApiProvider>(context, listen: false);
      api.clearEmailMessage(); // safe now
    });
  }


  @override
  void dispose() {
    emailController.dispose(); // ✅ Dispose only here
    super.dispose();
  }
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
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
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

    Future.delayed(const Duration(seconds: 2), () {
      entry.remove();
    });
  }





  @override
  Widget build(BuildContext context) {
    final api = Provider.of<ApiProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final h = constraints.maxHeight;

            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                w * 0.05,
                h * 0.03,
                w * 0.05,
                h * 0.15, // 👈 space for FAB
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: h * 0.05),

                  /// Heading
                  SizedBox(
                    width: w * 0.85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Create a new account",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: w * 0.065,
                          ),
                        ),
                        SizedBox(height: h * 0.01),
                        Text(
                          "Join us by registering your phone number or through your Google account.",
                          style: TextStyle(fontSize: w * 0.04),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: h * 0.04),

                  /// Email
                  Text(
                    "Email Address",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.05,
                    ),
                  ),

                  SizedBox(height: h * 0.01),

                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Example123@gmail.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  SizedBox(height: h * 0.02),

                  // if (api.emailMessage.isNotEmpty)
                  //   Text(
                  //     api.emailMessage,
                  //     style: TextStyle(
                  //       color: api.emailSuccess ? Colors.green : Colors.red,
                  //       fontSize: w * 0.04,
                  //     ),
                  //   ),

                  SizedBox(height: h * 0.02),

                  /// Send OTP Button
                  SizedBox(
                    width: double.infinity,
                    height: h * 0.065,
                    child: ElevatedButton(
                      onPressed: api.isLoading
                          ? null
                          : () async {
                              if (!emailController.text.contains("@")) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Enter valid email"),
                                  ),
                                );
                                return;
                              }

                              final pref =
                                  await SharedPreferences.getInstance();
                              await pref.setString(
                                "email",
                                emailController.text,
                              );

                              // 🔹 API CALL
                              await api.getEmaildata(emailController.text);

                              if (!context.mounted) return;

                              // 🔹 MESSAGE SHOW
                              if (api.emailSuccess) {
                                showTopMessage(
                                  context,
                                  "OTP sent on your email",
                                  success: true,
                                );
                              } else {
                                showTopMessage(
                                  context,
                                  api.emailMessage,
                                  success: false,
                                );
                              }


                              // 🔹 NAVIGATION
                              if (api.emailSuccess) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const EmailOtp(),
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
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: api.isLoading
                                ? [Colors.grey, Colors.grey]
                                : const [Color(0xFF655F2E), Color(0xFFD3A62A)],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: api.isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                )
                              : const Text(
                                  "Send OTP",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: h * 0.05),

                  /// Illustration
                  Center(
                    child: Image.asset(
                      "assets/images/Frame 102.png",
                      width: w * 0.7,
                    ),
                  ),

                  SizedBox(height: h * 0.05),

                  /// Google Button
                  socialButton(
                    context,
                    icon: "assets/icons/google.png",
                    text: "Continue With Google Account",
                    onTap: () async {
                      // final res = await AuthService.googleSignIn();
                      // if (res.user != null) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (_) => CreateAccountScreen(),
                      //     ),
                      //   );
                      // }
                    },
                  ),

                  SizedBox(height: h * 0.02),

                  /// Apple Button
                  socialButton(
                    context,
                    iconWidget: Icon(Icons.apple, size: w * 0.08),
                    text: "Continue With Apple Account",
                  ),

                  SizedBox(height: h * 0.02),

                  /// Login
                  Container(
                    height: 56,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Do you have an account? ",
                          style: TextStyle(fontSize: w * 0.04,fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => LoginScreen()),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: w * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: h * 0.03),

                  // CustomGradientButton(
                  //   text: "Register a new account",
                  //   height: 56,
                  //   width: double.infinity,
                  //   onPressed: () {},
                  // ),
                  //
                  // SizedBox(height: h * 0.03),
                ],
              ),
            );
          },
        ),
      ),

      /// Floating Button
      // floatingActionButtonLocation:
      // FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: CustomGradientButton(
      //   text: "Register a new account",
      //   height: 56,
      //   width: MediaQuery.of(context).size.width * 0.9,
      //   onPressed: () {},
      // ),
    );
  }

  /// Reusable Social Button
  Widget socialButton(
    BuildContext context, {
    String? icon,
    Widget? iconWidget,
    required String text,
    VoidCallback? onTap,
  }) {
    final w = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Image.asset(icon, height: 24) else iconWidget!,
            SizedBox(width: w * 0.03),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * 0.04),
            ),
          ],
        ),
      ),
    );
  }
}
