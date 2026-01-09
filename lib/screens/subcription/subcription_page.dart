import 'package:flutter/material.dart';
import 'package:lawyer/screens/subcription/monthly_subcription.dart';
import 'package:lawyer/screens/subcription/weekly_subcription.dart';

class SubcriptionPage extends StatefulWidget {
  const SubcriptionPage({super.key});

  @override
  State<SubcriptionPage> createState() => _SubcriptionPageState();
}

class _SubcriptionPageState extends State<SubcriptionPage> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MonthlySubcription()),
      );
    });
  }


  int currentPage = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              /// 🔙 Back Row
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

              /// 🔵 Heading
              Text(
                "Free trial",
                style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: height * 0.015),

              Text(
                "This package provides access to Ask AI Avocato and the legal search engine, ensuring easy and efficient access to legal information.",
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: height * 0.06),

              /// 🔘 Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  /// Monthly
                  _gradientButton(
                    width: width * 0.42,
                    title: "Monthly",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => MonthlySubcription()),
                      );
                    },
                  ),

                  /// Weekly
                  SizedBox(
                    width: width * 0.42,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0XFFEB4335),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => WeeklySubcription()),
                        );
                      },
                      child: const Text(
                        "Weekly",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      /// 🔻 Bottom Button
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onPressed: () {},
            label: const Text(
              "Continue",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 🔵 Reusable Gradient Button
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
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
