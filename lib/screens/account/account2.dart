import 'package:flutter/material.dart';

class Account2 extends StatefulWidget {
  const Account2({super.key});

  @override
  State<Account2> createState() => _Account2State();
}

class _Account2State extends State<Account2> {
  TextEditingController textController = TextEditingController();

  List<String> typeList = [
    'Individual',
    'Trainee Lawyer',
    'Licensed Lawyer',
    'Student',
    'Legal Advisor',
    'Academic',
    'Human Resources Officer',
    'Other'
  ];

  String selectedType = 'Individual';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.11),

            /// 🔙 Back Button
            Row(
              children: const [
                Icon(Icons.arrow_back, size: 24),
                SizedBox(width: 6),
                Text(
                  "Back",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: height * 0.05),

            /// 🟦 Title & Subtitle
            Center(
              child: SizedBox(
                width: width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "User type",
                      style:
                      TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Choose the title below that best describes your classification.",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: height * 0.05),

            /// 🔽 Dropdown (Responsive)
            DropdownButtonFormField(
              value: selectedType,
              items: typeList.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Center(
                    child: Text(
                      item,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedType = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: height * 0.018,
                  horizontal: width * 0.03,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
