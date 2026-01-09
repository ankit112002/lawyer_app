import 'package:flutter/material.dart';

import '../app_main_screen/app_main_screen.dart';
import 'account4.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Account4(
          onTermsChanged: (value) {
            setState(() {
              isTermsAccepted = value;
            });
          },
        ),
      ),

      /// BUTTON
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 58,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [Color(0xFF655F2E), Color(0xFFD3A62A)],
            ),
          ),
          child: FloatingActionButton.extended(
            elevation: 0,
            backgroundColor: Colors.transparent,

            /// 🔐 Disable until terms accepted
            onPressed: isTermsAccepted
                ? () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const AppMainScreen(),
                ),
              );
            }
                : null,

            label: const Text(
              "Begin",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
