import 'package:flutter/material.dart';
import 'package:lawyer/pdf/article_of_association.dart';
import 'package:lawyer/pdf/car_sale.dart';
import 'package:lawyer/pdf/property_sale.dart';
import 'package:lawyer/pdf/movable_lease.dart';

class AgreementPage extends StatelessWidget {
  const AgreementPage({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Agreements"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16 * (w / 390)),
        child: Column(
          children: [
            agreementItem(
              context,
              title: "Car Sale Agreement",
              icon: Icons.car_rental,
              page: CarSale(),
            ),
            agreementItem(
              context,
              title: "Property Sale Agreement",
              icon: Icons.house,
              page: PropertySale(),
            ),
            agreementItem(
              context,
              title: "Movable Lease Agreement",
              icon: Icons.bedroom_parent,
              page: MovableLease(),
            ),
            agreementItem(
              context,
              title: "Article of Association",
              icon: Icons.article_outlined,
              page: ArticleOfAssociation(),
            ),
          ],
        ),
      ),
    );
  }

  Widget agreementItem(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Widget page,
      }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 22),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
