
import 'dart:developer';
// import 'package:tuko/models/WeatherModel.dart';

import 'package:dio/dio.dart';

import '../models/WeatherModel.dart';
class WeatherServices{
  final Dio dio ;
  final String baseUrl="https://api.weatherapi.com";
  final String apiKey="de9ddf182f2a4fdd9db213029241005";
  WeatherServices(this.dio);

  Future<WeatherModel> GetWeather({required String city})async{

    try{
   Response response=await dio.get("$baseUrl/v1/forecast.json?key=$apiKey&q=$city&days=1");
 WeatherModel weatherModel=WeatherModel.fromJson(response.data);
 return weatherModel;
 }
 on DioException catch(e){
  final String error=e.response?.data['error']['message'] ?? "Sorry There is an error";
  throw Exception(error);
 }
 catch(e){
  log(e.toString());
  throw Exception("Try again,please");
 }


  }

}