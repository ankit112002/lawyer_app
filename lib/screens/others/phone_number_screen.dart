import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:lawyer/auth/login_screen.dart';
import 'package:lawyer/screens/account/create_account_screen.dart';
import 'package:lawyer/services/auth_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool showOtp = true; // OTP CLEAR FIX

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Phone Number Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  label: Text(
                    "Mobile Number",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  hintText: "############",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: 400,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () async {
                    final client = AuthService.client();
                    await client.auth.signInWithOtp(
                      phone: phoneController.text,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("OTP Sent")),
                    );
                  },
                  child: const Text(
                    "Send OTP",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ********** OTP FIELD WITH AUTO-CLEAR **********
              showOtp
                  ? OtpTextField(
                numberOfFields: 6,
                showFieldAsBox: true,
                borderColor: Colors.black,
                onSubmit: (String verificationCode) async {
                  final client = AuthService.client();

                  final res = await client.auth.verifyOTP(
                    type: OtpType.sms,
                    phone: phoneController.text,
                    token: verificationCode,
                  );

                  if (res.user != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                          Text("Account Created Successfully!")),
                    );

                    // ******** CLEAR OTP ********
                    setState(() {
                      showOtp = false; // remove widget
                    });
                    Future.delayed(const Duration(milliseconds: 100), () {
                      setState(() {
                        showOtp = true; // rebuild widget => OTP cleared
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountScreen(),));
                      });
                    });

                    // ******** CLEAR PHONE NUMBER ********
                    phoneController.clear();
                  }
                },
              )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
