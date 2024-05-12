import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobilecomputing/Serivces/WeatherServices.dart';
import '../models/WeatherModel.dart';
import '../view/searched_city.dart';

class CityCard extends StatefulWidget {
  final String currentCity;
  late String imageUrl;
  CityCard({
    Key? key,
    required this.currentCity,
  }) : super(key: key);

  @override
  _CityCardState createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  late WeatherModel weather;
  late num show=0;
  @override
  void initState() {
    super.initState();
    // Call the WeatherService to fetch weather data
    Future.delayed(Duration.zero).then((value) async => {
      await fetchWeather()
    });

  }

  Future<void> fetchWeather() async {
    try {
      WeatherModel fetchedWeather = await WeatherServices(Dio()).GetWeather(
        city: widget.currentCity,
      );
      setState(() {
        weather = fetchedWeather;
        show=1;
        //print('weather');
      });
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }


  @override
  Widget build(BuildContext context) {


    if (show == 0) {
      return Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }


//Date: 2024-05-12 14:30:00

    String timeCondition='${weather?.date}';
    int hour = int.parse(timeCondition.split(" ")[1].split(":")[0]);
    if (hour >= 18||hour<=5) {
      widget.imageUrl = "assets/im1.png"; 
    }else{
      widget.imageUrl = "assets/sunny.png";
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${hour}");
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SearchedCity(weather: weather),
            ));
        },
        child: Container(
          width: 390,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 3,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 11,),
                    child: Text(
                      "${weather?.city ?? '-'}",
                      style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top:10,right:20.0),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * .02),
                        Text(
                          "${weather?.Temperature ?? '-'}°C",
                          style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * .01),
                        Text(
                          "${weather?.condition ?? '-'}",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
