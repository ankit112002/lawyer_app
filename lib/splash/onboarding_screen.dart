import 'package:flutter/material.dart';
import 'package:lawyer/auth/email_verification.dart';
import 'package:lawyer/models/onboarding_model.dart';
import 'package:lawyer/auth/signup_screen.dart';
import 'package:lawyer/screens/account/create_account_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: const Color(0XFFD9D9D9),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.75,
                width: double.infinity,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: data.length,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.12,
                          child: Image.asset(data[index]['image']!),
                        ),
                        Text(
                          "${data[index]['title']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: height * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: height * 0.005),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                          child: Text(
                            "${data[index]['subtitle']}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: height * 0.022,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.05),

                        SizedBox(
                          height: height * 0.15,
                          child: Image.asset(data[index]['image2']!),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: width * 0.9,
        height: height * 0.07,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF655F2E),
                Color(0xFFD3A62A),
              ],
            ),
          ),

          child: FloatingActionButton.extended(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onPressed: () {
              if (currentPage < data.length - 1) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EmailVerification()),
                );
              }
            },

            label: Text(
              currentPage == data.length - 1 ? "Start exploring" : "Next",
              style: TextStyle(
                fontSize: height * 0.025,
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
