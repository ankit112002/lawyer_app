import 'package:flutter/material.dart';
import 'package:lawyer/screens/others/car_sale.dart';
import 'package:lawyer/setting/profile_page.dart';
import 'package:lawyer/screens/subcription/subcription_page.dart';
import 'package:lawyer/setting/support_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double textScale = (w / 390).clamp(0.8, 1.4);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 120 * (h / 800),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 20 * (h / 800)),
          child: Text(
            "Settings",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25 * textScale,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(16 * (w / 390)),
        child: Column(
          children: [
            SizedBox(height: 10 * (h / 800)),

            menuItem(
              title: "Profile",
              icon: Icons.person,
              textScale: textScale,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
              },
            ),

            menuItem(
              title: "Car Sale",
              icon: Icons.subscriptions,
              textScale: textScale,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CarSale(),));
              },
            ),

            menuItem(
              title: "Support",
              icon: Icons.support_agent,
              textScale: textScale,
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (_) => const SupportPage()));
              },
            ),

            menuItem(
              title: "Terms of Use",
              icon: Icons.description,
              textScale: textScale,
              onTap: () {},
            ),

            menuItem(
              title: "Privacy Policy",
              icon: Icons.privacy_tip,
              textScale: textScale,
              onTap: () {},
            ),

            const Spacer(),

            SizedBox(
              width: w * 0.65,
              height: 55 * (h / 800),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0XFFEB4335)),
                    borderRadius: BorderRadius.circular(12 * (w / 390)),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.exit_to_app, color: Colors.red, size: 20),
                    SizedBox(width: 8 * (w / 390)),
                    Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20 * textScale,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30 * (h / 800)),
          ],
        ),
      ),
    );
  }

  Widget menuItem({
    required String title,
    required IconData icon,
    required double textScale,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15 * textScale),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18 * textScale, fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 10 * textScale),
                Icon(icon, color: Colors.black, size: 22 * textScale),
              ],
            ),
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}