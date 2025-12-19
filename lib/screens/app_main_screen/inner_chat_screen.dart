import 'package:flutter/material.dart';

class InnerChatScreen extends StatefulWidget {
  const InnerChatScreen({super.key});

  @override
  State<InnerChatScreen> createState() => _InnerChatScreenState();
}

class _InnerChatScreenState extends State<InnerChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF655F2E),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back, size: 20,color: Colors.white ,),
                  SizedBox(width: 5),
                  Text(
                    "Back",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),

            Text(
              "Ask a lawyer",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:  Colors.white
              ),
            ),

            IconButton(onPressed: (){}, icon: Icon(Icons.list_outlined,size: 30,color:  Colors.white,))
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Image.asset("assets/images/Frame 427320870.png"),
            SizedBox(height: 30,),
            Image.asset("assets/images/Frame 427320871.png"),
            SizedBox(height: 350,),
            Image.asset("assets/images/Frame 427320846.png"),
          ],
        ),
      ),
    );
  }
}
