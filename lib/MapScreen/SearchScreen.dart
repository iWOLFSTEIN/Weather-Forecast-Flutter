import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:weather/FadePageRoute.dart';
import 'package:weather/HomeScreen/CurrentWeather.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({this.latitude, this.longitude});
  final latitude;
  final longitude;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List latlong = new List(2);

  GoogleMapController mapController;

  String searchAddr;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
              });
            },
            initialCameraPosition: CameraPosition(
                target: LatLng(
                  widget.latitude,
                  //  51.509865,
                  widget.longitude,
                  // -0.118092
                ),
                zoom: 11.0),
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            // ),
          ),
          Positioned(
            top: height * 5.5 / 100,
            right: width * 4.5 / 100,
            left: width * 4.5 / 100,
            child: Container(
              height: height * 7.7 / 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: TextField(
                style: TextStyle(fontFamily: 'Montserrat'),
                decoration: InputDecoration(
                    hintText: 'Search city',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: width * 4 / 100,
                      top: width * 4 / 100,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: searchandNavigate,
                      iconSize: width * 8 / 100,
                    )),
                onChanged: (val) {
                  setState(() {
                    searchAddr = val;
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    searchAddr = value;
                  });
                  searchandNavigate();
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Transform.rotate(
            angle: 3.14 + (3 * (3.14 / 4)), child: Icon(Icons.send)),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              FadePageRoute(CurrentWeather(
                latitude: latlong[0],
                longitude: latlong[1],
              )),
              (route) => false);
        },
      ),
    );
  }

  searchandNavigate() {
    Geolocator().placemarkFromAddress(searchAddr).then((result) {
      setState(() {
        latlong[0] = result[0].position.latitude;
        latlong[1] = result[0].position.longitude;
      });
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target:
              LatLng(result[0].position.latitude, result[0].position.longitude),
          zoom: 10.0)));
    });
  }
}
