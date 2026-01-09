import 'package:flutter/material.dart';

// Single-file example that converts your previous SearchScreen into
// reusable widgets: GradientChip, InfoCard, LargeInfoCard.
// Drop this file into your lib/ folder and import where needed.

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSearchBar(context),
                const SizedBox(height: 20),

                // Header (right aligned similar to your original design)
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Avacato',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),

                const SizedBox(height: 12),

                // Chips - responsive using Wrap
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: const [
                    GradientChip(label: 'Supporting models'),
                    GradientChip(label: 'Regulation systems'),
                    GradientChip(label: 'Decisions'),
                    GradientChip(label: 'Orders and circulars'),
                    GradientChip(label: 'Secondary Sources'),
                  ],
                ),

                const SizedBox(height: 30),

                // Small info card
                InfoCard(
                  label: 'Supporting models',
                  title: 'Civil transactions system',
                  tags: const ['valid', 'System', '+4'],
                ),

                const SizedBox(height: 30),

                // Large info card with description
                LargeInfoCard(
                  label: 'Regulation systems',
                  title: 'Work system',
                  description:
                  'Royal Decree No. M/51 addresses the labor system in the Kingdom of Saudi Arabia, having been approved based on several articles of the basic regulations. The system includes fundamental definitions related to work, workers, and employers, as well as...',
                  tags: const ['sari', 'System', '+4'],
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        hintText: 'Search...',
        hintStyle: const TextStyle(
          color: Color(0XFFB3BBC0),
          fontSize: 16,
        ),
        prefixIcon: const Icon(Icons.search, size: 20, color: Color(0XFFB3BBC0)),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0XFFDADEE0)),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0XFFDADEE0)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

/// ------------------------- Reusable Widgets -------------------------

/// GradientChip: gradient border with white inner background (matches your design)
class GradientChip extends StatelessWidget {
  final String label;
  final EdgeInsets padding;
  final double borderRadius;
  const GradientChip({super.key, required this.label, this.padding = const EdgeInsets.symmetric(vertical: 6, horizontal: 12), this.borderRadius = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.3),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF655F2E), Color(0xFFD3A62A)],
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius - 1),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF655F2E),
          ),
        ),
      ),
    );
  }
}

/// InfoCard: smaller card with label (gradient), title, and tags
class InfoCard extends StatelessWidget {
  final String label;
  final String title;
  final List<String> tags;
  const InfoCard({super.key, required this.label, required this.title, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0XffFBF6EA),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // label aligned to the right
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0Xff655F2E), Color(0xffD3A62A)]),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 8,
            children: tags
                .map((t) => Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              decoration: BoxDecoration(border: Border.all(width: 1), borderRadius: BorderRadius.circular(8), color: Colors.transparent),
              child: Text(t, style: const TextStyle(fontSize: 14)),
            ))
                .toList(),
          )
        ],
      ),
    );
  }
}

/// LargeInfoCard: same as InfoCard but with a description block
class LargeInfoCard extends StatelessWidget {
  final String label;
  final String title;
  final String description;
  final List<String> tags;

  const LargeInfoCard({super.key, required this.label, required this.title, required this.description, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0XffFBF6EA),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0Xff655F2E), Color(0xffD3A62A)]),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
            ),
          ),

          const SizedBox(height: 8),

          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.right),

          const SizedBox(height: 8),

          Text(description, style: const TextStyle(fontSize: 14), textAlign: TextAlign.right),

          const SizedBox(height: 12),

          Wrap(
            spacing: 8,
            children: tags
                .map((t) => Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              decoration: BoxDecoration(border: Border.all(width: 1), borderRadius: BorderRadius.circular(8)),
              child: Text(t, style: const TextStyle(fontSize: 14)),
            ))
                .toList(),
          )
        ],
      ),
    );
  }
}
