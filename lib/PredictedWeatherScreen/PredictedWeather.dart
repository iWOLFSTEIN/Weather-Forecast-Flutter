import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/DartNetworking/WeatherIcons.dart';
import 'package:weather/FadePageRoute.dart';
import 'package:weather/HomeScreen/AppBarWidget.dart';
import 'package:weather/HomeScreen/CurrentWeather.dart';
import 'package:weather/MapScreen/SearchScreen.dart';
import 'package:weather/PredictedWeatherScreen/BackIcon.dart';
import 'package:weather/PredictedWeatherScreen/CardWidget.dart';
import 'package:weather/PredictedWeatherScreen/DayOfWeekTemperature.dart';
import 'package:weather/PredictedWeatherScreen/Next7DaysCardHeading.dart';
import 'package:weather/DartNetworking/DaysOfWeek.dart';

class PredictedWeather extends StatefulWidget {
  PredictedWeather({Key key, this.predictedWeatherData, this.lat, this.long}) : super(key: key);
  final predictedWeatherData;
  final lat;
  final long;

  @override
  _PredictedWeatherState createState() => _PredictedWeatherState();
}

class _PredictedWeatherState extends State<PredictedWeather> {
  WeatherIcons weatherIcons = WeatherIcons();
  Map firstDayOfWeekWeather;
  DaysOfWeek daysOfWeek = DaysOfWeek();



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
    super.initState();
    
    firstDayOfWeekWeather = {
      'wind': widget.predictedWeatherData['daily'][1]['wind_speed'].round(),
      'humidity': widget.predictedWeatherData['daily'][1]['humidity'],
      'pressure': widget.predictedWeatherData['daily'][1]['pressure'],
      'uv': widget.predictedWeatherData['daily'][1]['uvi'].round(),
      'minTemp': widget.predictedWeatherData['daily'][1]['temp']['min'].toInt(),
      'maxTemp': widget.predictedWeatherData['daily'][1]['temp']['max'].toInt(),
    };
    updatedIconId(widget.predictedWeatherData);
    nameOfDay = DateTime.parse(day.toString()).weekday;


    currentTimeString = formatter.format(currentTimeObject);
    currentTime = formatter.parse(currentTimeString);
    morningTime = formatter.parse('6:00 AM');
    eveningTime = formatter.parse('6:00 PM');
  }

  var iconId1, iconId2, iconId3, iconId4, iconId5, iconId6, iconId7;
  void updatedIconId(var value) {
    iconId1 = value['daily'][1]['weather'][0]['id'];
    iconId2 = value['daily'][2]['weather'][0]['id'];
    iconId3 = value['daily'][3]['weather'][0]['id'];
    iconId4 = value['daily'][4]['weather'][0]['id'];
    iconId5 = value['daily'][5]['weather'][0]['id'];
    iconId6 = value['daily'][6]['weather'][0]['id'];
    iconId7 = value['daily'][7]['weather'][0]['id'];
  }

  var day = DateTime.now();

  var nameOfDay;

  String imageAdress = "images/pic8.png";

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.bodyText2;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFE9F1F7),
      body: SafeArea(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <
                Widget>[
          AppBarWidget(
            height: height,
            width: width,
            textTheme: textTheme,
            imageAdress: imageAdress,
          ),
          BackIcon(width: width),
          Next7DaysCardHeading(width: width, textTheme: textTheme),
          CardWidget(
            width: width,
            height: height,
            textTheme: textTheme,
            firstDayOfWeekWeather: firstDayOfWeekWeather,
            dayName: daysOfWeek.getDayFullName(
                (nameOfDay + 1 <= 7) ? nameOfDay + 1 : nameOfDay + 1 - 7),
            icon:
               
                weatherIcons.getIcon(
              iconId1,
              width * 7 / 100,
            ),
          ),
          DayOfWeekTemperature(
            width: width,
            dayName:
                //  "MON",
                daysOfWeek.getDay(
                    (nameOfDay + 2 <= 7) ? nameOfDay + 2 : nameOfDay + 2 - 7),

            textTheme: textTheme,
            height: height,
            humidityLevel:
                widget.predictedWeatherData['daily'][2]['humidity'].toString() +
                    '%',
            // daily[1].humidity
            initialTemperature: (widget.predictedWeatherData['daily'][2]['temp']
                    ['min']
                .toInt()),
            // daily[1].temp.min
            finalTemperature: (widget.predictedWeatherData['daily'][2]['temp']
                    ['max']
                .toInt()),
            icon: weatherIcons.getIcon(
              iconId2,
              width * 0.065,
            ),
            // daily[1].temp.max
          ),
          DayOfWeekTemperature(
            width: width,
            dayName: daysOfWeek.getDay(
                (nameOfDay + 3 <= 7) ? nameOfDay + 3 : nameOfDay + 3 - 7),
            textTheme: textTheme,
            height: height,
            humidityLevel:
                widget.predictedWeatherData['daily'][3]['humidity'].toString() +
                    '%',
            initialTemperature: (widget.predictedWeatherData['daily'][3]['temp']
                    ['min']
                .toInt()),
            finalTemperature:
                widget.predictedWeatherData['daily'][3]['temp']['max'].toInt(),
            icon: weatherIcons.getIcon(
              iconId3,
              width * 0.065,
            ),
          ),
          DayOfWeekTemperature(
            width: width,
            dayName: daysOfWeek.getDay(
                (nameOfDay + 4 <= 7) ? nameOfDay + 4 : nameOfDay + 4 - 7),
            textTheme: textTheme,
            height: height,
            humidityLevel:
                widget.predictedWeatherData['daily'][4]['humidity'].toString() +
                    '%',
            initialTemperature: (widget.predictedWeatherData['daily'][4]['temp']
                    ['min']
                .toInt()),
            finalTemperature:
                widget.predictedWeatherData['daily'][4]['temp']['max'].toInt(),
            icon: weatherIcons.getIcon(
              iconId4,
              width * 0.065,
            ),
          ),
          DayOfWeekTemperature(
            width: width,
            dayName: daysOfWeek.getDay(
                (nameOfDay + 5 <= 7) ? nameOfDay + 5 : nameOfDay + 5 - 7),
            textTheme: textTheme,
            height: height,
            humidityLevel:
                widget.predictedWeatherData['daily'][5]['humidity'].toString() +
                    '%',
            initialTemperature: (widget.predictedWeatherData['daily'][5]['temp']
                    ['min']
                .toInt()),
            finalTemperature:
                widget.predictedWeatherData['daily'][5]['temp']['max'].toInt(),
            icon: weatherIcons.getIcon(
              iconId5,
              width * 0.065,
            ),
          ),
          DayOfWeekTemperature(
            width: width,
            dayName: daysOfWeek.getDay(
                (nameOfDay + 6 <= 7) ? nameOfDay + 6 : nameOfDay + 6 - 7),
            textTheme: textTheme,
            height: height,
            humidityLevel:
                widget.predictedWeatherData['daily'][6]['humidity'].toString() +
                    '%',
            initialTemperature:
                widget.predictedWeatherData['daily'][6]['temp']['min'].toInt(),
            finalTemperature:
                widget.predictedWeatherData['daily'][6]['temp']['max'].toInt(),
            icon: weatherIcons.getIcon(
              iconId6,
              width * 0.065,
            ),
          ),
          DayOfWeekTemperature(
            width: width,
            dayName: daysOfWeek.getDay(
                (nameOfDay + 7 <= 7) ? nameOfDay + 7 : nameOfDay + 7 - 7),
            textTheme: textTheme,
            height: height,
            humidityLevel:
                widget.predictedWeatherData['daily'][7]['humidity'].toString() +
                    '%',
            initialTemperature:
                widget.predictedWeatherData['daily'][7]['temp']['min'].toInt(),
            finalTemperature:
                widget.predictedWeatherData['daily'][7]['temp']['max'].toInt(),
            icon: weatherIcons.getIcon(
              iconId7,
              width * 0.065,
            ),
          ),
        ]),
      ),
      drawer:  Drawer(
        child: Container(
          color: 
         Color(0xFFE9F1F7),
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
                    'Home',
                    style: textTheme.copyWith(
                      color: Color(0xFF10103B),
                    ),
                  ),
                ),
                onTap: () {
                 Navigator.pushAndRemoveUntil(context, FadePageRoute(CurrentWeather(
                   latitude: widget.lat,
                   longitude: widget.long,
                 )), (route) => false);
                     
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
                    'Search City',
                    style: textTheme.copyWith(
                      color: Color(0xFF10103B),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      FadePageRoute(SearchScreen(
                        latitude: widget.lat,
                        longitude: widget.long,
                      )));
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
                      color: Color(0xFF10103B),
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
              SizedBox(height: height*20/100,),
              Align(
                alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: width*5.5/100),
                                child: FloatingActionButton(
                
                  backgroundColor:
                 Color(0xFFE9F1F7),
                
                   child: Icon(Icons.arrow_back, color:
                  
                    Color(0xFF10103B),
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
