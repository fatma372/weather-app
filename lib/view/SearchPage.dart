import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobilecomputing/Serivces/WeatherServices.dart';
import 'package:mobilecomputing/models/WeatherModel.dart';
import 'package:mobilecomputing/view/OnBoarding.dart';
import '../widgets/city_card.dart';
import 'package:mobilecomputing/view/searched_city.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController? _searchController;
  late WeatherModel weather;
  final List<String> cities = [
    'Fayoum',
    'Brazil',
    'Alex',
    'Cairo',
    'Zagazig',
    'Beni-Suef',
    'Australia',
    'Moscow',
    'Menia',
    'Luxor',
    'Hurghada',
    'Giza',
    'Aswan',
    'Port Said',
    'Kafr el-Sheikh',
    'Suez',
    'Sohag',
    'Qena',
    'Helwan',
    'Banha',
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  Future<void> fetchWeather(String city) async {
    try {
      WeatherModel fetchedWeather =
      await WeatherServices(Dio()).GetWeather(city: city);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchedCity(weather: fetchedWeather),
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Weather data not available. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _searchController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OnBoarding(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          iconSize: 22,
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Weather",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search for a city",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    await fetchWeather(_searchController!.text);
                  },
                  icon: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
              child: ListView.builder(
                itemCount: cities.length,
                itemBuilder: (context, index) {
                  return CityCard(
                    currentCity: cities[index],
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}