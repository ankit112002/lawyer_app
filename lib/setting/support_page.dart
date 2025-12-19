import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    double w(double value) => width * (value / 390);
    double h(double value) => height * (value / 844);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h(70)),

              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      size: w(22),
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: w(8)),
                  Text(
                    "Back",
                    style: TextStyle(fontSize: w(20), fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: h(20)),

              Center(
                child: Text(
                  "Create a new account",
                  style: TextStyle(fontSize: w(24), fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: h(40)),

              Text(
                "Phone Number",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: w(18),
                    color: Colors.black),
              ),
              SizedBox(height: h(8)),

              TextField(
                decoration: InputDecoration(
                  label: Text(
                    "123456789",
                    style: TextStyle(
                        fontSize: w(16), color: Color(0XFFB3BBC0)),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFDADEE0))),
                ),
              ),

              SizedBox(height: h(16)),

              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  label: Text(
                    "Enter the message...",
                    style: TextStyle(
                        fontSize: w(16), color: Color(0XFFB3BBC0)),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFDADEE0))),
                ),
              ),

              SizedBox(height: h(30)),

              Center(
                child: Image.asset(
                  "assets/images/Frame 3.png",
                  width: w(300),
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: h(150)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: h(54),
                    width: w(150),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0XFFEB4335)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: w(18),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF655F2E), Color(0xFFD3A62A)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SizedBox(
                      height: h(54),
                      width: w(150),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(horizontal: w(20)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: w(18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: h(40)),
            ],
          ),
        ),
      ),
    );
  }
}