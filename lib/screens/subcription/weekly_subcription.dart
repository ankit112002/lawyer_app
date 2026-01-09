import 'package:flutter/material.dart';

import 'monthly_subcription.dart';

class WeeklySubcription extends StatefulWidget {
  const WeeklySubcription({super.key});

  @override
  State<WeeklySubcription> createState() => _WeeklySubcriptionState();
}

class _WeeklySubcriptionState extends State<WeeklySubcription> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// 🔙 Back
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, size: 24),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Back",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: height * 0.04),

              /// 🔵 Title
              Text(
                "Weekly package",
                style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: height * 0.015),

              /// 🔤 Description
              Text(
                "Avocato's plans provide access to the Ask Avocato feature and the legal search engine, ensuring easy and efficient access to legal information.",
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: height * 0.05),

              /// 🔘 Monthly / Weekly Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.42,
                    height: 52,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0XFFEB4335)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => MonthlySubcription()),
                        );

                      },
                      child: const Text(
                        "Monthly",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  _gradientButton(
                    width: width * 0.42,
                    title: "Weekly",
                    onTap: () {},
                  ),
                ],
              ),

              SizedBox(height: height * 0.05),

              /// 📦 Subscription Card
              LayoutBuilder(
                builder: (context, constraints) {
                  return _subscriptionCard(
                    constraints: constraints,
                    title: "Weekly Package",
                    badge: "Best Value",
                    price: "₹999",
                  );
                },
              ),

              SizedBox(height: height * 0.12),
            ],
          ),
        ),
      ),

      /// 🔻 Bottom CTA
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: width * 0.9,
        height: 58,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [Color(0xFF655F2E), Color(0xFFD3A62A)],
            ),
          ),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {},
            label: const Text(
              "Subscribe now",
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

  /// 🔹 Responsive Subscription Card
  Widget _subscriptionCard({
    required BoxConstraints constraints,
    required String title,
    required String price,
    String? badge,
    String? description,
  }) {
    final width = constraints.maxWidth;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff655F2E), Color(0xffD3A62A)],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xffFBF6EA),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (badge != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xff655F2E), Color(0xffD3A62A)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      badge,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                Text(
                  price,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            if (description != null) ...[
              const SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(
                  fontSize: width * 0.038,
                  color: Colors.black87,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// 🔹 Gradient Button
  Widget _gradientButton({
    required double width,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      width: width,
      height: 52,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF655F2E), Color(0xFFD3A62A)],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
