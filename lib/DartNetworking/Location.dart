
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location{
  
  double latitude;
  double longitude;


 Future<void> getLocationServices() async{
     try
    { 
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      debugPrint(position.toString());
     latitude = position.latitude;
     longitude = position.longitude;
     }
     catch(e){
       debugPrint(e);
     }
  }


}