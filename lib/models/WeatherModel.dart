class WeatherModel{
final double Temperature;
final String date;
final String city;
final String? country;
final String? image;
final String condition;
final double wind;
final num rain;
final int snow;
final int clouds;
final num uv;
final num humidity;
final double visibility;
final double pressure;
final String sunrise;
 final String sunset;

  WeatherModel({
   required this.Temperature,
   required this.date,
   required this.city,
   this.image,
   required this.condition,
   required this.wind,
   required this.uv,
   required this.humidity,
   required this.visibility,
   required this.pressure,
    this.country,
   required this.rain,
   required this.snow,
   required this.clouds,
   required this.sunrise,
   required this.sunset,
    });

  factory WeatherModel.fromJson( dynamic json){
 return WeatherModel(
  Temperature:double.parse(json["forecast"]["forecastday"][0]['day']['avgtemp_c'].toString()),
  date:json['current']['last_updated'], 
  city: json["location"]['name'],
  country: json["location"]['country'],
  condition: json["forecast"]["forecastday"][0]['day']['condition']['text'],
  clouds: json["forecast"]["forecastday"][0]['hour'][2]['cloud'],
  wind: json['current']['wind_mph'],
  rain:json["forecast"]["forecastday"][0]['day']['daily_chance_of_rain'],
  snow:json["forecast"]["forecastday"][0]['day']['daily_chance_of_snow'],
  uv:json["forecast"]["forecastday"][0]['day']['avgtemp_c'],
  humidity: json['current']['humidity'],
  visibility: json['current']['vis_km'],
  pressure: json['current']['pressure_in'],
  sunrise:json["forecast"]["forecastday"][0]["astro"]["sunrise"],
  sunset:json["forecast"]["forecastday"][0]["astro"]["sunset"],
      );
  }
}