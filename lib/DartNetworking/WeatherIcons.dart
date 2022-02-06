import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather/DartNetworking/Location.dart';
import 'package:weather/DartNetworking/NetworkProvider.dart';

const apiKey = "3d77a40fe693cbf25010a1e8dc823442";
class WeatherIcons {


  static final currentTimeObject = DateTime.now();
  static final formatter = DateFormat.jm();
  static final currentTimeString = formatter.format(currentTimeObject);

 var currentTime = formatter.parse(currentTimeString);
 var morningTime = formatter.parse('6:00 AM');
 var eveningTime = formatter.parse('6:00 PM');


   getWeatherData() async{

     List <dynamic> weatherDataContainer = new List <dynamic> (4);
     Location location = Location();
     await location.getLocationServices();
        
      NetworkProvider networkProvider = NetworkProvider(
      url1: "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric",
      url2: "https://api.openweathermap.org/data/2.5/onecall?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric"
        );
       weatherDataContainer[0] = await networkProvider.getCurrentWeatherData();
       weatherDataContainer[1] = await networkProvider.getPredictedWeatherData();
       weatherDataContainer[2] = location.latitude;
       weatherDataContainer[3] = location.longitude;

       
      return weatherDataContainer;
   }

 getWeatherDataByCoordinates({var latitude, var longitude}) async{

     List <dynamic> weatherDataContainer = new List <dynamic> (2);
    
        
      NetworkProvider networkProvider = NetworkProvider(
      url1: "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric",
      url2: "https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric"
        );
       weatherDataContainer[0] = await networkProvider.getCurrentWeatherData();
       weatherDataContainer[1] = await networkProvider.getPredictedWeatherData();

       
      return weatherDataContainer;
   }

  Widget getIcon(int id, var size) {
    if (id >= 200 && id < 300) {
      return Icon(
        FontAwesomeIcons.cloudShowersHeavy,
        color: Color(0xFF000052),
        size: size,
      );
    } else if (id >= 300 && id < 500) {
      return Icon(
        FontAwesomeIcons.cloudRain,
        color: Color(0xFF4896E9),
        size: size,
      );
    } else if (id >= 500 && id < 600) {
      return Icon(
      (currentTime.isAfter(morningTime)&&currentTime.isBefore(eveningTime))? FontAwesomeIcons.cloudSunRain : FontAwesomeIcons.cloudMoonRain,
        color: Color(0xFF4896E9),
        size: size,
      );
    } else if (id >= 600 && id < 700) {
      return Icon(
        FontAwesomeIcons.snowflake,
        color: Color(0xFF4896E9),
        size: size,
      );
    } else if (id >= 700 && id < 800) {
      return Icon(
        FontAwesomeIcons.smog,
        color: Color(0xFF4896E9),
        size: size,
      );
    } else if (id == 800) {
      return Icon(
      (currentTime.isAfter(morningTime)&&currentTime.isBefore(eveningTime))? Icons.wb_sunny : FontAwesomeIcons.moon,
        color: (currentTime.isAfter(morningTime)&&currentTime.isBefore(eveningTime))? Color(0xFFF7C411) : Color(0xFF4896E9),
        size: size,
      );
    } else if (id == 801 || id == 802) {
      return Icon(
       (currentTime.isAfter(morningTime)&&currentTime.isBefore(eveningTime))?  FontAwesomeIcons.cloudSun : FontAwesomeIcons.cloudMoon,
        color: Color(0xFF4896E9),
        size: size,
      );
    } else if (id == 803 || id == 804) {
      return Icon(
        Icons.wb_cloudy,
        color: Color(0xFF4896E9),
        size: size,
      );
    }
  }
}
