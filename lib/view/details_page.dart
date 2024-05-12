import 'package:flutter/material.dart';
import 'package:mobilecomputing/view/SearchPage.dart';

import '../widgets/more_details_card.dart';

class DetailsPage extends StatefulWidget {
  final String city;
  final double Temperature;
  final String condition;
  final double wind;
  final int clouds;
  final num uv;
  final num humidity;
  final double visibility;
  final double pressure;
  final String sunrise;
  final String sunset;

   DetailsPage({Key? key,
    required this.city,
    required this.condition,
    required this.wind,
    required this.clouds,
    required this.uv,
    required this.humidity,
    required this.visibility,
    required this.pressure,
    required this.Temperature,
     required this.sunrise,
     required this.sunset,
   });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
           onPressed: (){
                Navigator.push(context,MaterialPageRoute(
                builder: (context) =>SearchPage(),
              ));
        },)),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.09),
          Center(
            child: Container(
              width: 250,
              height: 45,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 241, 241),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(child: Text("Today",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),)),
                  ),
                   Container(
                    width: 110,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(child: Text("${widget.city}",style: TextStyle(fontSize: 18,color: Colors.grey[700],fontWeight: FontWeight.bold),)),
                  )]))   )

                    ,SizedBox(height: MediaQuery.of(context).size.height * 0.05)
        ,Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              MoreDetailsCard(imagePath: "assets/im8.png", text1:"UV", text2: "${widget.uv} Low",imageWidth: 50,imageHeight: 60,),
              MoreDetailsCard(imagePath: "assets/im4.png", text1:"Feels like", text2: "${widget.Temperature}",imageWidth: 80,imageHeight: 60),
              MoreDetailsCard(imagePath: "assets/im5.png", text1:"Wind", text2: "${widget.wind} Km",imageWidth: 100,imageHeight: 60)
          ],
        ),

        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              MoreDetailsCard(imagePath: "assets/im9.png", text1:"Humidity", text2: "${widget.humidity}%",imageWidth: 120,imageHeight: 60),
              MoreDetailsCard(imagePath: "assets/im10.png", text1:"Air pressure", text2: "${widget.pressure}",imageWidth: 50,imageHeight: 60),
              MoreDetailsCard(imagePath: "assets/im11.png", text1:"visibility", text2: "${widget.visibility} Km",imageWidth: 50,imageHeight: 60)
          ],
        ),
         SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Container(
          width:380,
          height: 120,
          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(left:2.0),
              child: Column(
                children: [
                  Image.asset("assets/im12.png",width: 50,
                height: 60,
                fit: BoxFit.fill,
                ),
                  Text("Sunrise",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                ],
              ),
            ),
          ),
          //SizedBox(width: MediaQuery.of(context).size.width * 0.0),
             Padding(
               padding: const EdgeInsets.only(top:25,left: 8),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("${widget.sunrise}",style: TextStyle(color: Colors.amber[700],fontSize: 15,fontWeight: FontWeight.bold),

                   ),
                     SizedBox(width: MediaQuery.of(context).size.width * 0.11),
             Text("${widget.sunset}",style: TextStyle(color: Colors.amber[700],fontSize: 15,fontWeight: FontWeight.bold),),
         //    SizedBox(width: MediaQuery.of(context).size.width * 0.0),
                 ],
               ),
             ),

              Column(
                          children: [
              Image.asset("assets/im13.png",width: 110,
                          height: 70, fit: BoxFit.fill,),
               //SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text("Sunset",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                          ],
                        ),
          //SizedBox(width: MediaQuery.of(context).size.width * 0.0),

        ],

      ),

        ),
      ],
    ),);}
}
