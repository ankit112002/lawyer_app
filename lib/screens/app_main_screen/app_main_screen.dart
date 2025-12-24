import 'package:flutter/material.dart';
import 'package:lawyer/models/my_model.dart';
import 'package:lawyer/provider/api_provider.dart';
import 'package:lawyer/screens/app_main_screen/chat_screen.dart';
import 'package:lawyer/screens/app_main_screen/main_screen.dart';
import 'package:lawyer/screens/app_main_screen/search_screen.dart';
import 'package:lawyer/screens/subcription/subcription_page.dart';
import 'package:lawyer/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int currentIndex = 0;
  bool isLoading = false;


  final List<Widget> _pages = [
    SearchScreen(),
    MainScreen(),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showSubscriptionPopup();
    });
  }

  // POPUP FUNCTION
  void showSubscriptionPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: 300,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFFFBF6EA),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close, size: 25),
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "You don't have a subscription!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 25),

                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF6A6A2E),
                        Color(0xFFD6B85A),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SubcriptionPage(),));
                    },
                    child: Text(
                      "Subscribe",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Close",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Future<void> _onAiTap() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    try {
      final pref = await SharedPreferences.getInstance();
      final email = pref.getString("email");

      if (email == null || email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email not found. Please login again.")),
        );
        return;
      }

      final apiProvider = Provider.of<ApiProvider>(context, listen: false);
      await apiProvider.getdata(context, email);

      if (apiProvider.model == null || apiProvider.model!.chatId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to create chat. Try again.")),
        );
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ChatScreen(chat_id: apiProvider.model!.chatId.toString()),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Something went wrong")),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: _pages[currentIndex],

          bottomNavigationBar: Container(
            height: 90,
            decoration: const BoxDecoration(
              color: Color(0XFF655F2E),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildNavItems(Icons.search, "Search", 0),
                    const SizedBox(width: 70),
                    buildNavItems(Icons.home, "Home", 1),
                  ],
                ),

                Positioned(
                  top: -50,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      height: 110,
                      width: 110,
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: const Color(0XFFFBF6EA),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0XFFFBF6EA),
                          child: InkWell(
                            onTap: _onAiTap, // 👈 UPDATED
                            child: Image.asset(
                              "assets/images/AI avacato logo.png",
                              height: 100,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // 🔥 FULL SCREEN LOADER
        if (isLoading)
          Container(
            color: Colors.black.withOpacity(0.4),
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 4,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }


  Widget buildNavItems(IconData icon, String label, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30,
              color: currentIndex == index ? Colors.white : Colors.grey),
          Text(
            label,
            style: TextStyle(
              color: currentIndex == index ? Colors.white : Colors.grey,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
