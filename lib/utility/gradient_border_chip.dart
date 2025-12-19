import 'package:flutter/material.dart';

class GradientBorderChip extends StatelessWidget {
  final String text;

  const GradientBorderChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.3), // border thickness
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
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF655F2E),
          ),
        ),
      ),
    );
  }
}
