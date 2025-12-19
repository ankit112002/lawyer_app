import 'package:flutter/material.dart';

class CustomBriefCard extends StatelessWidget {
  final String text;
  final String iconPath;

  const CustomBriefCard({
    super.key,
    required this.text,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5), // border thickness
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF655F2E),
            Color(0xFFD3A62A),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 55,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              iconPath,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
