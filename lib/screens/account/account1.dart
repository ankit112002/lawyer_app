import 'package:flutter/material.dart';

class Account1 extends StatefulWidget {
  const Account1({super.key});

  @override
  State<Account1> createState() => _Account1State();
}

class _Account1State extends State<Account1> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            SizedBox(height: height * 0.11),

            /// 🔙 Back Button Row
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, size: 24),
                ),
                const SizedBox(width: 6),
                const Text(
                  "Back",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: height * 0.04),

            /// 🔵 Heading Text
            SizedBox(
              width: width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Account type",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "To begin your journey, choose the type of account you would like to create.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.04),

            /// 🟩 Account Option Container (Responsive)
            Container(
              width: width * 0.9,
              padding: EdgeInsets.all(width * 0.04),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  /// Expanded text section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Individual",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "This account is for personal use and can only be used by one person.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),

                  /// Image section
                  SizedBox(
                    width: width * 0.18,
                    child: Image(
                      image: AssetImage(
                          "assets/icons/profile-circle_svgrepo.com.png"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
