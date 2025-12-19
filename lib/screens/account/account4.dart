import 'package:flutter/material.dart';

class Account4 extends StatefulWidget {
  final Function(bool) onTermsChanged;

  const Account4({super.key, required this.onTermsChanged});

  @override
  State<Account4> createState() => _Account4State();
}

class _Account4State extends State<Account4> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 60),

            /// LOGO
            Image.asset(
              "assets/images/AI avacato logo.png",
              height: 120,
            ),

            const SizedBox(height: 80),

            /// TITLE
            const Text(
              "Welcome John",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              "Start your journey with Adel, your AI legal assistant.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 40),

            /// TERMS
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                    widget.onTermsChanged(isChecked);
                  },
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Accept the terms and conditions",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "By using the Adel platform, you agree to the terms and conditions.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 120), // Space for FAB
          ],
        ),
      ),
    );
  }
}
