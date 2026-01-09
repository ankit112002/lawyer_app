import 'package:flutter/material.dart';
import 'package:lawyer/auth/login_page.dart';
import 'package:lawyer/pdf/agreement_list.dart';
import 'package:lawyer/pdf/car_sale.dart';
import 'package:lawyer/pdf/movable_lease.dart';
import 'package:lawyer/screens/subcription/monthly_subcription.dart';
import 'package:lawyer/session_controller.dart';
import 'package:lawyer/setting/profile_page.dart';
import 'package:lawyer/screens/subcription/subcription_page.dart';
import 'package:lawyer/setting/support_page.dart';
import 'package:provider/provider.dart';

import '../provider/api_provider.dart';
import '../pdf/property_sale.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Future<bool?> showLogoutDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to logout?"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Logout",style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }

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
              title: "Agreements",
              icon: Icons.car_rental,
              textScale: textScale,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AgreementPage(),));
              },
            ),
            // menuItem(
            //   title: "Property Sale",
            //   icon: Icons.house_siding_sharp,
            //   textScale: textScale,
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => PropertySale(),));
            //   },
            // ),
            // menuItem(
            //   title: "Movable Lease Agreement",
            //   icon: Icons.bedroom_parent_sharp,
            //   textScale: textScale,
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => MovableLease(),));
            //   },
            // ),
            menuItem(
              title: "Subscription",
              icon: Icons.person_pin_circle,
              textScale: textScale,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MonthlySubcription(),));
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

        Consumer<ApiProvider>(
          builder: (context, provider, _) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0XFFEB4335)),
                  borderRadius: BorderRadius.circular(12 * (w / 390)),
                ),
              ),

              onPressed: provider.isLoggingOut
                  ? null
                  : () async {
                final confirm = await showLogoutDialog(context);

                if (confirm == true) {
                  await provider.logout(context);
                }
              },

              child: provider.isLoggingOut
                  ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.red,
                ),
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.exit_to_app,
                      color: Colors.red, size: 20),
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
            );
          },
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