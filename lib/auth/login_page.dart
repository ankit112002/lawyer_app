import 'package:flutter/material.dart';
import 'package:lawyer/auth/signup_page.dart';
import 'package:lawyer/screens/account/create_account_screen.dart';
import 'package:provider/provider.dart';

import '../provider/api_provider.dart';
import '../screens/others/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final api = Provider.of<ApiProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Column(
          children: [
            SizedBox(height: height * 0.10),

            Text(
              "Welcome Back!",
              style: TextStyle(
                fontSize: width * 0.07,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: height * 0.03),

            // EMAIL FIELD
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: height * 0.02),

            // PASSWORD FIELD
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

            SizedBox(height: height * 0.03),

            // API MESSAGE
            if (api.loginMessage.isNotEmpty)
              Text(
                api.loginMessage,
                style: TextStyle(
                  color: api.loginSuccess ? Colors.green : Colors.red,
                  fontSize: width * 0.04,
                ),
                textAlign: TextAlign.center,
              ),

            SizedBox(height: height * 0.02),

            // LOGIN BUTTON
            SizedBox(
              width: width,
              height: height * 0.065,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: api.isLoading
                    ? null
                    : () async {
                  if (emailController.text.isEmpty ||
                      passController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("All fields are required"),
                      ),
                    );
                    return;
                  }

                  await api.loginData(
                    context,
                    emailController.text,
                    passController.text,
                  );

                  // only navigate if login success
                  if (api.loginSuccess) {
                    if (context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => CreateAccountScreen()),
                      );
                    }

                  }
                },
                child: api.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Login",style: TextStyle(color: Colors.white),),
              ),
            ),

            SizedBox(height: height * 0.03),

            // REGISTER NAVIGATION
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupPage()),
                    );
                  },
                  child: const Text(
                    " Register now",
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
