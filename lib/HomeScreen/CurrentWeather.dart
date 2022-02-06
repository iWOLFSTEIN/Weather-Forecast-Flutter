import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../DataProvider.dart';
import 'package:weather/HomeScreen/City.dart';
import 'package:weather/HomeScreen/AppBarWidget.dart';
import 'package:weather/HomeScreen/BarChartNext24Hours.dart';
import 'package:weather/HomeScreen/ITSWidget.dart';
import 'package:weather/HomeScreen/TemperatureInCelcius.dart';
import 'package:weather/HomeScreen/TodayTomorrowTextRow.dart';
import 'package:weather/HomeScreen/TodayWeather.dart';
import 'package:weather/FadePageRoute.dart';
import 'package:weather/MapScreen/SearchScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/DartNetworking/WeatherIcons.dart';
import 'package:weather/PredictedWeatherScreen/PredictedWeather.dart';
import 'package:intl/intl.dart';

class CurrentWeather extends StatefulWidget {
  CurrentWeather({this.latitude, this.longitude});

  final latitude;
  final longitude;

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  final String imageAdress = "images/pic7.png";

  WeatherIcons weatherIcons = WeatherIcons();
  var predictedWeatherData;
  var lat;
  var long;


  var timeImages = [
   "images/day.jpg",
   "images/night.jpg",
   "images/cloud.jpg"
    
  ];


  var currentWeatherId;


  var currentTimeObject = DateTime.now();
  var formatter = DateFormat.jm();
  var currentTimeString;
  var currentTime;

  var morningTime;
  var eveningTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentTimeString = formatter.format(currentTimeObject);
    currentTime = formatter.parse(currentTimeString);
    morningTime = formatter.parse('6:00 AM');
    eveningTime = formatter.parse('6:00 PM');
  //  debugPrint(currentTimeString);
  }



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textTheme = Theme.of(context).textTheme.bodyText1;

    var todayWeatherContainerCurrentHeight = Provider.of<DataProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFF10103B),
      body: FutureBuilder(
          future: (widget.latitude != null && widget.longitude != null)
              ? weatherIcons.getWeatherDataByCoordinates(
                  latitude: widget.latitude, longitude: widget.longitude)
              : weatherIcons.getWeatherData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              
                predictedWeatherData = snapshot.data[1];
                lat = (widget.latitude != null)
                                        ? widget.latitude
                                        : snapshot.data[2];
                long= (widget.longitude != null)
                                        ? widget.longitude
                                        : snapshot.data[3];

                 currentWeatherId = snapshot.data[0]['weather'][0]['id'];                                               
              

              return SafeArea(
                child: Container(
                  height: height,
                  width: width,
                  child: Stack(
                    overflow: Overflow.clip,
                    children: <Widget>[
                      AnimatedPositioned(
                          top: height * 18 / 100,
                          left: (todayWeatherContainerCurrentHeight
                                      .todayWeatherContainerHeight !=
                                  0.0)
                              ? -width * 50 / 100
                              : -width * 22 / 100,
                          child: Icon(
                            Icons.cloud,
                            size: width * .5,
                            color: Color(0xFF1E1F45),
                          ),
                          duration: Duration(milliseconds: 200)),
                      AnimatedPositioned(
                          top: height * 0.1 / 100,
                          right: (todayWeatherContainerCurrentHeight
                                      .todayWeatherContainerHeight !=
                                  0.0)
                              ? -width * 50 / 100
                              : -width * 22 / 100,
                          child: Icon(
                            Icons.cloud,
                            size: width * .5,
                            color: Color(0xFF1E1F45),
                          ),
                          duration: Duration(milliseconds: 200)),
                      AnimatedPositioned(
                          top: height * 37 / 100,
                          right: (todayWeatherContainerCurrentHeight
                                      .todayWeatherContainerHeight !=
                                  0.0)
                              ? -width * 50 / 100
                              : width * 0 / 100,
                          child: Icon(
                            Icons.cloud,
                            size: width * .25,
                            color: Color(0xFF1E1F45),
                          ),
                          duration: Duration(milliseconds: 200)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          AppBarWidget(
                            height: height,
                            width: width,
                            textTheme: textTheme,
                            imageAdress: imageAdress,
                          ),
                          ITSWidget(
                            width: width,
                            textTheme: textTheme,
                            height: height,
                            weatherData: snapshot.data[0],
                          ),
                          TemperatureInCelcius(
                            textTheme: textTheme,
                            width: width,
                            height: height,
                            weatherData: snapshot.data[0],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  FadePageRoute(SearchScreen(
                                    latitude:
                                     (widget.latitude != null)
                                        ? widget.latitude
                                        : snapshot.data[2],
                                    longitude: (widget.longitude != null)
                                        ? widget.longitude
                                        : snapshot.data[3],
                                  )));
                            },
                            child: City(
                              textTheme: textTheme,
                              width: width,
                              weatherData: snapshot.data[0],
                            ),
                          ),
                          TodayTomorrowNext7daysTextRow(
                            height: height,
                            textTheme: textTheme,
                            width: width,
                            predictedWeatherData: snapshot.data[1],
                             lat:
                               (widget.latitude != null)
                                        ? widget.latitude
                                        : snapshot.data[2],
                                    long: (widget.longitude != null)
                                        ? widget.longitude
                                        : snapshot.data[3],
                          ),
                          TodayWeather(
                            height: height,
                            width: width,
                            textTheme: textTheme,
                            predictedWeatherData: snapshot.data[1],
                          ),
                          BarChartNext24Hours(
                            height: height,
                            width: width,
                            textStyle: textTheme,
                            predictedWeatherData: snapshot.data[1],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                  child: SpinKitCircle(
                color: Colors.white,
                size: MediaQuery.of(context).size.width * 15 / 100,
              ));
            }
          }),
      drawer:
       Drawer(
        child: Container(
          color: 
          Color(0xFF10103B),
          //Color(0xFFE9F1F7),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  child: Text(
                    'Weather Forecast',
                    style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(


                            (currentWeatherId == 800)? 

                             (currentTime.isAfter(morningTime)&&currentTime.isBefore(eveningTime))?
                             timeImages[0]: timeImages[1]

                             : timeImages[2]

                            
                            
                            ), fit: BoxFit.fill)),
                ),
             
              Divider(
                color:
                 Color(0xFFADB4B6).withOpacity(0.4),
               // height: 1,
               indent: 20,
               endIndent: 20,
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: width*1.5/100),
                                  child: Text(
                    'Refresh',
                    style: textTheme.copyWith(
                      color: Color(0xFFE9F1F7),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      FadePageRoute(CurrentWeather(
                        latitude: widget.latitude,
                        longitude: widget.longitude,
                      )),
                      (route) => false);
                     //  Navigator.pop(context);
                },
              ),


               Divider(
              color: Color(0xFFADB4B6).withOpacity(0.4),
             
               indent: 20,
               endIndent: 20,
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: width*1.5/100),
                  child: Text(
                    'Search City',
                    style: textTheme.copyWith(
                      color:Color(0xFFE9F1F7),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      FadePageRoute(SearchScreen(
                        latitude: lat,
                        longitude: long,
                      )));
                     //  Navigator.pop(context);
                },
              ),

               Divider(
              color:  Color(0xFFADB4B6).withOpacity(0.4),
              
               indent: 20,
               endIndent: 20,
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: width*1.5/100),
                  child: Text(
                    'Predicted Weather',
                    style: textTheme.copyWith(
                      color: Color(0xFFE9F1F7),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      FadePageRoute(PredictedWeather(
                        predictedWeatherData: predictedWeatherData,
                      )));
                     //  Navigator.pop(context);
                },
              ),


               Divider(
             color:  Color(0xFFADB4B6).withOpacity(0.4),
               // height: 1,
               indent: 20,
               endIndent: 20,
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: width*1.5/100),
                  child: Text(
                    'About',
                    style: textTheme.copyWith(
                      color: Color(0xFFE9F1F7),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

               Divider(
             color:  Color(0xFFADB4B6).withOpacity(0.4),
               // height: 1,
                indent: 20,
               endIndent: 20,
              ),
              SizedBox(height: height*8/100,),
              Align(
                alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: width*5.5/100),
                                child: FloatingActionButton(
                
                  backgroundColor:
                Color(0xFF10103B),
                
                   child: Icon(Icons.arrow_back, color:
                   Color(0xFFE9F1F7),
                   
                   ),
                  onPressed: (){
                     Navigator.pop(context);
                  },),
                              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
