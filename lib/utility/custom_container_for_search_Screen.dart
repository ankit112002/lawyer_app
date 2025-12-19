import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final double height;
  final double width;
  final List<Color> gradientColors;
  final double borderRadius;
  final Border? border;

  const CustomBox({
    super.key,
    required this.height,
    required this.width,
    required this.gradientColors,
    this.borderRadius = 12,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradientColors),
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
      ),
    );
  }
}
