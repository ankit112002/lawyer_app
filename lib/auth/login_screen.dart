import 'package:flutter/material.dart';
import 'package:lawyer/auth/signup_screen.dart';
import 'package:provider/provider.dart';

import '../provider/api_provider.dart';
import '../screens/account/create_account_screen.dart';
import '../screens/app_main_screen/app_main_screen.dart';
import '../services/auth_services.dart';
import '../utility/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
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

  bool _obscurePassword = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ApiProvider>(context, listen: false).resetLoginState();
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final api = Provider.of<ApiProvider>(context);


    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final h = constraints.maxHeight;

            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                w * 0.05,
                h * 0.04,
                w * 0.05,
                h * 0.16, // 👈 space for FAB
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Welcome again",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: w * 0.065,
                          ),
                        ),
                        // SizedBox(height: h * 0.01),
                        // Text(
                        //   "Log in with your phone number or via",
                        //   style: TextStyle(fontSize: w * 0.04),
                        // ),
                        // Text(
                        //   "your Google account",
                        //   style: TextStyle(fontSize: w * 0.04),
                        // ),
                      ],
                    ),
                  ),

                  // SizedBox(height: h * 0.05),
                  Text(
                    "Email Address",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.05,
                    ),
                  ),

                  SizedBox(height: h * 0.01),


                  /// Email
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

                  /// Password
                  TextField(
                    controller: passController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),


                  SizedBox(height: h * 0.03),

                  /// API Message
                  // if (api.loginMessage.isNotEmpty)
                  //   Text(
                  //     api.loginMessage,
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color:
                  //       api.loginSuccess ? Colors.green : Colors.red,
                  //       fontSize: w * 0.04,
                  //     ),
                  //   ),

                  SizedBox(height: h * 0.02),

                  /// Login Button
                  SizedBox(
                    width: double.infinity,
                    height: h * 0.065,
                    child: ElevatedButton(
                      onPressed: api.isLoading
                          ? null
                          : () async {
                        if (emailController.text.isEmpty ||
                            passController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                              Text("All fields are required"),
                            ),
                          );
                          return;
                        }

                        await api.loginData(
                          context,
                          emailController.text,
                          passController.text,
                        );

                        if (!mounted) return;

                        if (api.loginMessage.isNotEmpty) {
                          if (api.loginMessage.isNotEmpty) {
                            showTopMessage(
                              context,
                              api.loginMessage,
                              success: api.loginSuccess,
                            );
                          }

                        }

                        if (api.loginSuccess) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AppMainScreen(),
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
                          gradient: api.isLoading
                              ? const LinearGradient(
                            colors: [Colors.grey, Colors.grey],
                          )
                              : const LinearGradient(
                            colors: [
                              Color(0xFF655F2E),
                              Color(0xFFD3A62A),
                            ],
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
                            "Login",
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
                  Image.asset(
                    "assets/images/Frame 102.png",
                    width: w * 0.7,
                  ),

                  SizedBox(height: h * 0.05),

                  /// Google Login
                  socialButton(
                    context,
                    icon: "assets/icons/google.png",
                    text: "Continue With Google Account",
                    onTap: () async {
                      final res = await AuthService.googleSignIn();
                      if (res.user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CreateAccountScreen(),
                          ),
                        );
                      }
                    },
                  ),

                  SizedBox(height: h * 0.02),

                  /// Apple Login
                  socialButton(
                    context,
                    iconWidget: Icon(Icons.apple, size: w * 0.08),
                    text: "Continue With Apple Account",
                  ),

                  SizedBox(height: h * 0.02),

                  /// Register
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
                          "Don't have an account? ",
                          style: TextStyle(fontSize: w * 0.04,fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SignupScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Register now.",
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
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Image.asset(icon, height: 24)
            else
              iconWidget!,
            SizedBox(width: w * 0.03),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: w * 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
