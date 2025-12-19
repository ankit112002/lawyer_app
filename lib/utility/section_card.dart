import 'package:flutter/material.dart';

import 'gradient_border_chip.dart';

class SectionCard extends StatelessWidget {
  final String category;
  final String title;
  final String description;
  final List<String> chips;

  const SectionCard({
    super.key,
    required this.category,
    required this.title,
    required this.description,
    required this.chips,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: Color(0xFFF7F1DE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GradientBorderChip(text: category),

          SizedBox(height: 15),

          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 12),

          if (description.isNotEmpty)
            Text(
              description,
              style: TextStyle(height: 1.4, fontSize: 16),
            ),

          SizedBox(height: 15),

          Wrap(
            spacing: 10,
            children: chips
                .map((chip) => GradientBorderChip(text: chip))
                .toList(),
          ),
        ],
      ),
    );
  }
}
