import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lawyer/screens/app_main_screen/search_screen.dart';
import 'package:lawyer/setting/setting_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late double width;
  late double height;

  double w(double value) => width * (value / 390);
  double h(double value) => height * (value / 844);

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingPage()),
            ),
            icon: Icon(Icons.settings, size: w(32), color: const Color(0XFF655F2E)),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w(16)),
          child: Column(
            children: [
              SizedBox(height: h(10)),

              _promotionCard(),
              SizedBox(height: h(20)),

              _updateBanner(),
              SizedBox(height: h(20)),

              _askAvocatoBox(),
              SizedBox(height: h(25)),

              Image.asset(
                "assets/images/Frame 427320884.png",
                height: h(220),
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔶 Promotion Card
  Widget _promotionCard() {
    return Container(
      height: h(155),
      width: width,
      decoration: BoxDecoration(
        color: const Color(0XFFF1E3BD),
        borderRadius: BorderRadius.circular(w(10)),
      ),
      child: Row(
        children: [
          SizedBox(width: w(12)),
          _gradientButton("Promotion", w(80), h(27), 12),
          SizedBox(width: w(20)),
          Expanded(
            child: Image.asset(
              "assets/images/Frame 427320849.png",
              fit: BoxFit.contain,
              height: h(130),
            ),
          )
        ],
      ),
    );
  }

  // 🔶 Update Banner
  Widget _updateBanner() {
    return Container(
      height: h(55),
      width: width,
      decoration: BoxDecoration(
        color: const Color(0XFFFBF6EA),
        borderRadius: BorderRadius.circular(w(10)),
      ),
      child: Row(
        children: [
          SizedBox(width: w(12)),
          _gradientButton("Update", w(80), h(27), 12),
          SizedBox(width: w(40)),
          Expanded(
            child: Text(
              "Update mobile number",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: w(16)),
            ),
          )
        ],
      ),
    );
  }

  // 🔶 Ask Avocato Box
  Widget _askAvocatoBox() {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: h(16)),
      decoration: BoxDecoration(
        color: const Color(0XFFFBF6EA),
        borderRadius: BorderRadius.circular(w(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: w(16)),
            child: Text(
              "Ask Avocato",
              style: TextStyle(fontSize: w(18), fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: h(20)),
          Center(child: _questionBox("What are the traffic regulations?", w(250), h(34), 12)),
          SizedBox(height: h(10)),
          Center(child: _questionBox("What is commercial law?", w(200), h(34), 12)),
        ],
      ),
    );
  }

  // 🔸 Gradient Button
  Widget _gradientButton(String text, double width, double height, double fontSize) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF655F2E), Color(0xFFD3A62A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {},
          child: Text(text, style: TextStyle(color: Colors.white, fontSize: fontSize)),
        ),
      ),
    );
  }

  // 🔸 Question Box
  Widget _questionBox(String text, double width, double height, double fontSize) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.3),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text(text, style: TextStyle(fontSize: fontSize)),
    );
  }
}