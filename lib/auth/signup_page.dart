import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sign Up"),
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
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: height * 0.02),

            // OTP
            TextField(
              controller: otpController,
              decoration: InputDecoration(
                labelText: "OTP",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

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
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green),
                onPressed: api.isLoading
                    ? null
                    : () async {
                  // Validation
                  if (firstNameController.text.isEmpty ||
                      lastNameController.text.isEmpty ||
                      passController.text.isEmpty ||
                      otpController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("All fields are required"),
                      ),
                    );
                    return;
                  }

                  var pref = await SharedPreferences.getInstance();
                  var email = pref.getString("email");

                  await api.signUpData(
                    firstNameController.text,
                    lastNameController.text,
                    email.toString(),
                    passController.text,
                    selectedType,
                    otpController.text,
                  );

                  if (api.signupSuccess) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateAccountScreen()),
                    );
                  }
                },
                child: api.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Sign Up"),
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
    );
  }
}
