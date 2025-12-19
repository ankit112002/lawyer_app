import 'package:flutter/material.dart';
import 'package:lawyer/screens/account/account1.dart';
import 'package:lawyer/screens/account/account2.dart';
import 'package:lawyer/screens/account/account3.dart';
import 'package:lawyer/screens/account/account4.dart';
import 'package:lawyer/screens/app_main_screen/app_main_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  int currentPage = 0;
  final PageController pageController = PageController();

  /// Track terms acceptance from Account4
  bool isTermsAccepted = false;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    pages = [
      const Account1(),
      const Account2(),
      const Account3(),
      Account4(
        onTermsChanged: (value) {
          setState(() {
            isTermsAccepted = value;
          });
        },
      ),
    ];
  }

  @override
  void dispose() {
    pageController.dispose(); // ✅ FIX MEMORY LEAK
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Stack(
          children: [

            /// PAGE VIEW
            PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
              itemBuilder: (_, index) => pages[index],
            ),

            /// TOP INDICATORS
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Row(
                children: List.generate(pages.length, (index) {
                  final isActive = index == currentPage;

                  return Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: isActive
                              ? const [Color(0xFF655F2E), Color(0xFFD3A62A)]
                              : const [Color(0xFFE0E0E0), Color(0xFFE0E0E0)],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),

      /// FLOATING BUTTON
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

            /// 🔐 Disable on last page if terms not accepted
            onPressed: (currentPage == pages.length - 1 && !isTermsAccepted)
                ? null
                : () {
              if (currentPage < pages.length - 1) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AppMainScreen(),
                  ),
                );
              }
            },

            label: Text(
              currentPage == pages.length - 1 ? "Begin" : "Continue",
              style: const TextStyle(
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
