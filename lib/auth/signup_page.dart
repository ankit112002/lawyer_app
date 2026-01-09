import 'package:flutter/material.dart';
import 'package:lawyer/auth/email_otp.dart';
import 'package:lawyer/screens/account/create_account_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/api_provider.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool _obscurePassword = true;


  List<String> typeList = [
    'Individual',
    'Trainee Lawyer',
    'Licensed Lawyer',
    'Student',
    'Legal Advisor',
    'Academic',
    'Human Resources Officer',
    'Other'
  ];

  String selectedType = 'Individual';



  @override
  Widget build(BuildContext context) {
    final api = Provider.of<ApiProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () async {
          // Prevent back navigation
          // Or navigate to LoginPage if needed
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const EmailOtp()),
          );
          return false; // Prevent default back
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0XFF655F2E),
            iconTheme: const IconThemeData(
              color: Colors.white, // Back button color
            ),
            centerTitle: true,
            title: const Text("Sign Up", style: TextStyle(color: Colors.white)),
          ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Column(
          children: [
            SizedBox(height: height * 0.03),

            Text(
              "Create Your Account",
              style: TextStyle(
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: height * 0.03),

            // FIRST NAME
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                labelText: "First Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: height * 0.02),

            // LAST NAME
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                labelText: "Last Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: height * 0.02),

            // PASSWORD
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


            SizedBox(height: height * 0.02),

            // OTP
            // TextField(
            //   controller: otpController,
            //   decoration: InputDecoration(
            //     labelText: "OTP",
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //   ),
            // ),

            SizedBox(height: height * 0.02),

            // USER TYPE DROPDOWN
            DropdownButtonFormField(
              value: selectedType,
              items: typeList.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item, style: const TextStyle(fontSize: 16)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedType = value!;
                });
              },
              decoration: InputDecoration(
                labelText: "Select User Type",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: height * 0.02),

            // API MESSAGE
            if (api.signupMessage.isNotEmpty)
              Text(
                api.signupMessage,
                style: TextStyle(
                  color: api.signupSuccess ? Colors.green : Colors.red,
                  fontSize: width * 0.04,
                ),
                textAlign: TextAlign.center,
              ),

            SizedBox(height: height * 0.02),

            // SIGNUP BUTTON
            SizedBox(
              width: width,
              height: height * 0.065,
              child: ElevatedButton(
                onPressed: api.isLoading
                    ? null
                    : () async {
                  final pref = await SharedPreferences.getInstance();
                  // final otp = pref.getString("email_otp");

                  if (firstNameController.text.isEmpty ||
                      lastNameController.text.isEmpty ||
                      passController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("All fields are required")),
                    );
                    return;
                  }

                  final email = pref.getString("email");

                  await api.signUpData(
                    firstNameController.text,
                    lastNameController.text,
                    email.toString(),
                    passController.text,
                    selectedType,
                  );

                  if (!mounted) return;

                  if (api.signupSuccess) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CreateAccountScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
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
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: api.isLoading
                        ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                        : const Text(
                      "Sign Up",
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

            SizedBox(height: height * 0.02),

            // LOGIN TEXT
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text("Already have an account?",
            //         style: TextStyle(fontSize: 16)),
            //     GestureDetector(
            //       onTap: () {
            //         Navigator.pushReplacement(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (_) => const LoginPage()));
            //       },
            //       child: const Text(
            //         " Login",
            //         style: TextStyle(
            //           fontSize: 16,
            //           color: Colors.blue,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            SizedBox(height: height * 0.03),
          ],
        ),
      ),
    ));

  }
}
