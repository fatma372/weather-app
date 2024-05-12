import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mobilecomputing/view/Settings.dart';
import 'package:mobilecomputing/models/WeatherModel.dart';
import '../widgets/dtails-card.dart';
import 'SearchPage.dart';
import 'details_page.dart';
class SearchedCity extends StatefulWidget {
final WeatherModel weather;
  late String imageUrl;
SearchedCity({super.key,
     
     required this.weather,

   });

  @override
  State<SearchedCity> createState() => _SearchedCityState();
}

class _SearchedCityState extends State<SearchedCity> {
  @override
  Widget build(BuildContext context) {
 


//Date: 2024-05-12 14:30:00

    String timeCondition='${widget.weather?.date}';
    int hour = int.parse(timeCondition.split(" ")[1].split(":")[0]);
    if (hour >= 18||hour<=5) {
      widget.imageUrl = "assets/im1.png"; 
    }else{
      widget.imageUrl = "assets/sunny.png";
      //print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${hour}");
    }
    //****************************extract date from api date without time
    String timeString='${widget.weather.date}';
    DateTime dateTime = DateTime.parse(timeString);
    String formattedDate = "${dateTime.day}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year.toString().padLeft(2, '0')}";
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.${formattedDate}"); // Output: 2024-04-25
    //*********************************************************************

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [ SizedBox(height: MediaQuery.of(context).size.height*.04,),
            Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) =>const SearchPage(),
                  ));},
                    icon:Icon(Icons.arrow_back_ios_new,size: 27,)),
                SizedBox(width: MediaQuery.of(context).size.width*.7,),
                IconButton( onPressed: (){

                   Navigator.push(context,MaterialPageRoute(
                     builder: (context) => Settings(),
                   ));
                  },
                    icon:Icon(Icons.settings,size: 30,)),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.03,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width*.05,),
                Column(
                  children: [
                    Text("${widget.weather.city},",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
                    Text("${widget.weather.country}",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
                    SizedBox(height: MediaQuery.of(context).size.height*.02,),
                    Text("${formattedDate}"??'---',style: TextStyle(fontSize: 16),)
                  ],
                ),
                //SizedBox(width: MediaQuery.of(context).size.width*.25,),
                Spacer(),
                Image.asset("assets/im2.png")
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.02,),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: Container(
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Image.asset("assets/im4.png",width: 130,height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${widget.weather.condition}",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                          Text("${widget.weather.Temperature}°C",style: TextStyle(fontSize: 20,color: Colors.white)),
                          // SizedBox(height: MediaQuery.of(context).size.height*.02,),
                        ],),
                    )   ], ),      ),),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DetailsCard(imagePath: 'assets/im6.png', text: '${widget.weather.rain}%',),
                DetailsCard(imagePath: 'assets/im5.png', text: '${widget.weather.wind}km/h',),
                DetailsCard(imagePath: 'assets/im7.png', text: '${widget.weather.clouds}%',),  ],
            ) ,
            SizedBox(height: MediaQuery.of(context).size.height*.12,),

            Container(
              width: 200,
              height: 60,
              child: ElevatedButton( onPressed: (){

                Navigator.push(context,MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    city: '${widget.weather.city}',
                    uv: widget.weather.uv,
                    humidity: widget.weather.humidity,
                    wind: widget.weather.wind,
                    pressure: widget.weather.pressure,
                    clouds: widget.weather.clouds,
                    Temperature:widget.weather.Temperature,
                    visibility: widget.weather.visibility,
                    condition: '${widget.weather.condition}',
                    sunrise:'${widget.weather.sunrise}',
                    sunset: '${widget.weather.sunset}',


                  ),
                ));
                },

                child: Text("More Details",style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                    fontWeight: FontWeight.bold
                ),)
                ,style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                    backgroundColor: Colors.amber
                ),
              ),
            )  ], ),
      ), );  }
}