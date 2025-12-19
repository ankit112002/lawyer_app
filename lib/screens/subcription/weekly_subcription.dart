import 'package:flutter/material.dart';

class WeeklySubcription extends StatefulWidget {
  const WeeklySubcription({super.key});

  @override
  State<WeeklySubcription> createState() => _WeeklySubcriptionState();
}

class _WeeklySubcriptionState extends State<WeeklySubcription> {
  int currentPage=0;
  PageController pageController=PageController();
  List<Widget>pages=[
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80,left: 20),
            child: Row(
              children: [
                InkWell(
                    onTap: (){Navigator.pop(context);},
                    child: Icon(Icons.arrow_back,size: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                Text(" Back",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)


              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 40),
            child: Image.asset("assets/images/Frame 99 (4).png"),
          ),
          SizedBox(height: 50,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF655F2E), Color(0xFFD3A62A)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SizedBox(
                        height: 54,width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Monthly",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20, // adjust for small height
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 54,width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Color(0XFFEB4335),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => WeeklySubcription(),));
                        }, child: Text("Weekly",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))),
                  ),


                ],),
              SizedBox(height: 30,),
              Center(
                child: Image.asset("assets/images/Frame 427320841 (1).png"),
              ),
              
            ],
          ),
        ],
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 60,

          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF655F2E), // black
                  Color(0xFFD3A62A), // grey-black
                ],

              ),
            ),

            child: FloatingActionButton.extended(
              backgroundColor: Colors.transparent,  // IMPORTANT
              elevation: 0,                          // No shadow over gradient
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              onPressed: () {
                if (currentPage < pages.length - 1) {
                  pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }else{
                }
              },

              label: Text(
                currentPage == pages.length - 1 ? "Begin" : "Subscribe now",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
    );
  }
}
