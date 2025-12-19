import 'package:flutter/material.dart';

class Account3 extends StatefulWidget {
  const Account3({super.key});

  @override
  State<Account3> createState() => _Account3State();
}

class _Account3State extends State<Account3> {
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.11),

              /// 🔙 Back Button
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, size: 24),
                  ),
                  SizedBox(width: width * 0.02),
                  const Text(
                    "Back",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: height * 0.04),

              /// 🔵 Title & Subtitle
              Center(
                child: SizedBox(
                  width: width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Work/Study Information",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.065,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.015),
                      Text(
                        "Tell us how you would describe your current job title or position.",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.04,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: height * 0.03),

              /// 🔹 Example Text
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Example: lawyer",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.045,
                  ),
                ),
              ),

              SizedBox(height: height * 0.015),

              /// 🔹 TextField
              SizedBox(
                width: width,
                child: TextField(
                  controller: jobController,
                  decoration: InputDecoration(
                    hintText: "Job title/specialization",
                    hintStyle: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: height * 0.02,
                      horizontal: width * 0.04,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0XFFDADEE0)),
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
