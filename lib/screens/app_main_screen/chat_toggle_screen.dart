import 'package:flutter/material.dart';

class ChatToggleScreen extends StatefulWidget {
  const ChatToggleScreen({super.key});

  @override
  State<ChatToggleScreen> createState() => _ChatToggleScreenState();
}

class _ChatToggleScreenState extends State<ChatToggleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
       title:  Padding(
         padding: const EdgeInsets.only(top: 30),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.black,fontWeight: FontWeight.bold,)),
             Image.asset(
               "assets/images/AI avacato logo.png",height: 60,
             ),
           ],
         ),
       ),
      ),
      body: Column(
        children: [
          //Image.asset("assets/images/Frame 427320848.png",height: 500,width: 600,),
          Text("Ask Avocato",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),
          Row(

            children: [

          ],)
        ],
      )
    );
  }
}
