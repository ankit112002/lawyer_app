import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lawyer/auth/login_page.dart';
import 'package:lawyer/screens/account/create_account_screen.dart';
import 'package:lawyer/screens/app_main_screen/app_main_screen.dart';
import 'package:lawyer/session_controller.dart';
import 'package:lawyer/splash/onboarding_screen.dart';
import 'package:provider/provider.dart';

import '../provider/api_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _handleNavigation();

  }

  Future<void> _handleNavigation() async {
    // Load saved session (token + userId)
    await SessionController.instance.loadSession();

    final token = SessionController.instance.token ?? "";

    if (token.isNotEmpty) {
      // ✅ Token restore -> ApiProvider me set -> Profile auto fetch
      final provider = Provider.of<ApiProvider>(context, listen: false);
      provider.setAccessToken(token);
    }

    // Wait for 3 seconds splash
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      if (SessionController.instance.isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const AppMainScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const OnboardingScreen(),
          ),
        );
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    // UI same rahega
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double textScale = (w / 390).clamp(0.8, 1.4);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0XFFF1E3BD),
              Color(0XFFF0EFEA),
              Color(0XFFF0EFEA),
              Color(0XFFF1E3BD),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/AI avacato logo.png",
                width: w * 0.55,
                height: h * 0.28,
                fit: BoxFit.contain,
              ),
              SizedBox(height: h * 0.03),
              Text(
                "The lawyer",
                style: TextStyle(
                  fontSize: 50 * textScale,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff0A2433),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
