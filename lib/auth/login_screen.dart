import 'package:flutter/material.dart';
import 'package:lawyer/screens/account/create_account_screen.dart';
import 'package:lawyer/auth/signup_screen.dart';
import '../services/auth_services.dart';
import '../utility/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0XFFD9D9D9),

      body: LayoutBuilder(
        builder: (context, constraints) {
          double h = constraints.maxHeight;
          double w = constraints.maxWidth;

          return SingleChildScrollView(
            padding: EdgeInsets.all(w * 0.04),
            child: Column(
              children: [
                SizedBox(height: h * 0.08),

                // Welcome Text Section
                Container(
                  width: w * 0.8,
                  padding: EdgeInsets.only(left: w * 0.07),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Welcome again",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: w * 0.065,
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.005),
                      Text(
                        "Log in with your phone number or via",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: w * 0.04,
                        ),
                      ),
                      Text(
                        "your Google account",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: w * 0.04,
                        ),
                      ),
                    ],
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

                SizedBox(height: h * 0.01),

                // TextField
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    label: Text(
                      "123456789",
                      style: TextStyle(
                        fontSize: w * 0.04,
                        color: const Color(0XFFB3BBC0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFDADEE0)),
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

                // Google Login Button
                InkWell(
                  onTap: () async {
                    final res = await AuthService.googleSignIn();
                    if (res.user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateAccountScreen()),
                      );
                    }
                  },
                  child: Container(
                    height: h * 0.065,
                    width: w,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/google.png", height: h * 0.04),
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

                // Apple Login Button
                Container(
                  height: h * 0.065,
                  width: w,
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

                SizedBox(height: h * 0.06),

                // Register Now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: w * 0.04),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupScreen()),
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

                SizedBox(height: h * 0.12),
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
        onPressed: () {},
      ),
    );
  }
}
