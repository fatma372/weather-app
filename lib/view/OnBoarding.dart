import 'package:flutter/material.dart';
import 'package:mobilecomputing/view/SearchPage.dart';


class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Center(child: Text("SkyLine",style: TextStyle(fontSize: 25,color: Colors.blue,
            fontWeight: FontWeight.bold,),)),
         Padding(
           padding: const EdgeInsets.fromLTRB(0, 100, 80, 30),
           child: Container(
            width: 270,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/im14.png"),
              )
            ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.only(top: 100),
           child: Text("Take care of your day by checking \n the weather forecast..",
             style: TextStyle(fontSize: 20,),
            textAlign: TextAlign.center,
           ),
         ),
         
         Padding(
           padding: const EdgeInsets.only(top: 160),
           child: Container(
                          width: 200,
                          height: 50,
                           child: ElevatedButton( onPressed: (){
               
                            Navigator.push(context,MaterialPageRoute(
                           builder: (context) =>  SearchPage(),
                            ));},
                            child: Text("Get Started",style: TextStyle(
                              color: Colors.white,
                            fontSize: 18
                           ),)
                           ,style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                           ),
                           backgroundColor: Colors.amber
                           ),
                           ),
                         ),
         )
        ],
      ),
    );
  }
}