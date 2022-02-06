import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkProvider {

  final String url1;
  final String url2;
  NetworkProvider({this.url1, this.url2});

  Future getCurrentWeatherData() async{
      http.Response weatherData = await http.get(url1);
     if(weatherData.statusCode==200){
       String data = weatherData.body; 
       return jsonDecode(data);
     }
     else{
       debugPrint(weatherData.statusCode.toString());
     }
    }

     Future getPredictedWeatherData() async{
      http.Response weatherData = await http.get(url2);
     if(weatherData.statusCode==200){
       String data = weatherData.body; 
       return jsonDecode(data);
     }
     else{
       debugPrint(weatherData.statusCode.toString());
     }
    }

}