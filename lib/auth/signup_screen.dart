import 'package:flutter/material.dart';
import 'package:lawyer/screens/account/create_account_screen.dart';
import 'package:lawyer/auth/login_screen.dart';
import 'package:lawyer/screens/others/phone_number_screen.dart';
import 'package:lawyer/services/auth_services.dart';
import '../utility/custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,

      body: LayoutBuilder(
        builder: (context, constraints) {
          double w = constraints.maxWidth;
          double h = constraints.maxHeight;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.04,
              vertical: h * 0.02,
            ),
            child: Column(
              children: [
                SizedBox(height: h * 0.08),

                // Heading
                Padding(
                  padding: EdgeInsets.only(left: w * 0.1),
                  child: SizedBox(
                    width: w * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          "Join us by registering your phone\nnumber or through your Google account.",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: w * 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: h * 0.04),

                // Mobile number label
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Mobile number",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.05,
                    ),
                  ),
                ),

                SizedBox(height: h * 0.015),

                // Button to go to phone screen
                SizedBox(
                  width: w,
                  height: h * 0.06,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      alignment: Alignment.centerLeft,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(width: 1),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PhoneNumberScreen()),
                      );
                    },
                    child: Text(
                      "123456789",
                      style: TextStyle(
                        fontSize: w * 0.04,
                        color: const Color(0XFFB3BBC0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: h * 0.05),

                // Center Image
                Image.asset(
                  "assets/images/Frame 102.png",
                  width: w * 0.7,
                ),

                SizedBox(height: h * 0.05),

                // Google Sign In
                InkWell(
                  onTap: () async {
                    final res = await AuthService.googleSignIn();
                    if (res.user != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Account Created..!")),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAccountScreen()),
                      );
                    }
                  },
                  child: Container(
                    height: h * 0.065,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/google.png",
                            height: h * 0.04),
                        SizedBox(width: w * 0.03),
                        Text(
                          "Continue With Google Account",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: w * 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: h * 0.02),

                // Apple Sign In
                Container(
                  height: h * 0.065,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.apple, size: w * 0.10),
                      SizedBox(width: w * 0.03),
                      Text(
                        "Continue With Apple Account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: w * 0.04,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: h * 0.05),

                // Login Redirect
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do you have an account? ",
                      style: TextStyle(fontSize: w * 0.04),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
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

                SizedBox(height: h * 0.10),
              ],
            ),
          );
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: CustomGradientButton(
        text: "Register a new account",
        height: height * 0.07,
        width: width * 0.9,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => CreateAccountScreen()));
        },
      ),
    );
  }
}
