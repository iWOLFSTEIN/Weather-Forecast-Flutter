import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/DataProvider.dart';
import 'package:intl/intl.dart';
import 'package:time/time.dart';
import 'package:weather/DartNetworking/WeatherIcons.dart';

class TodayWeather extends StatefulWidget {
  const TodayWeather(
      {Key key,
      @required this.height,
      @required this.width,
      @required this.textTheme,
      this.predictedWeatherData})
      : super(key: key);

  final double height;
  final double width;
  final TextStyle textTheme;
  final predictedWeatherData;

  @override
  _TodayWeatherState createState() => _TodayWeatherState();
}

class _TodayWeatherState extends State<TodayWeather> {
  WeatherIcons weatherIcons = WeatherIcons();
  var deActiveColor = [
    Colors.white,
    Color(0xFF1E1F45),
    Color(0xFF313158),
    Color(0xFF191A43),
  ];

  var activeColor = [
    Colors.black,
    Colors.white,
    Color(0xFFDEE9F8),
    Color(0xFF4896E9),
  ];

  var firstTimeStramp;
  var secondTimeStramp;
  var thirdTimeStramp;
  var fourthTimeStramp;
  var fifthTimeStramp;
  var sixthTimeStramp;

  var seventhTimeStramp;
  var eigthTimeStramp;
  var ninthTimeStramp;
  var tenthTimeStramp;
  var eleventhTimeStramp;
  var tewelthTimeStramp;

  var currentTime1 = DateTime.now() + Duration(hours: 4);
  var currentTime2 = DateTime.now() + Duration(hours: 8);
  var currentTime3 = DateTime.now() + Duration(hours: 12);
  var currentTime4 = DateTime.now() + Duration(hours: 16);
  var currentTime5 = DateTime.now() + Duration(hours: 20);
  var currentTime6 = DateTime.now() + Duration(hours: 24);

  var timeFormatter = DateFormat('j');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    updatedIconId(widget.predictedWeatherData);
    updatedTemp(widget.predictedWeatherData);

    firstTimeStramp = timeFormatter.format(currentTime1).split(' ')[0] +
        timeFormatter.format(currentTime1).split(' ')[1];
    secondTimeStramp = timeFormatter.format(currentTime2).split(' ')[0] +
        timeFormatter.format(currentTime2).split(' ')[1];
    thirdTimeStramp = timeFormatter.format(currentTime3).split(' ')[0] +
        timeFormatter.format(currentTime3).split(' ')[1];
    fourthTimeStramp = timeFormatter.format(currentTime4).split(' ')[0] +
        timeFormatter.format(currentTime4).split(' ')[1];
    fifthTimeStramp = timeFormatter.format(currentTime5).split(' ')[0] +
        timeFormatter.format(currentTime5).split(' ')[1];
    sixthTimeStramp = timeFormatter.format(currentTime6).split(' ')[0] +
        timeFormatter.format(currentTime6).split(' ')[1];
  }

  var iconId1,
      iconId2,
      iconId3,
      iconId4,
      iconId5,
      iconId6,
      iconId7,
      iconId8,
      iconId9,
      iconId10,
      iconId11,
      iconId12;

  void updatedIconId(var value) {
    iconId1 = value['hourly'][3]['weather'][0]['id'];
    iconId2 = value['hourly'][7]['weather'][0]['id'];
    iconId3 = value['hourly'][11]['weather'][0]['id'];
    iconId4 = value['hourly'][15]['weather'][0]['id'];
    iconId5 = value['hourly'][19]['weather'][0]['id'];
    iconId6 = value['hourly'][23]['weather'][0]['id'];

    iconId7 = value['hourly'][27]['weather'][0]['id'];
    iconId8 = value['hourly'][31]['weather'][0]['id'];
    iconId9 = value['hourly'][35]['weather'][0]['id'];
    iconId10 = value['hourly'][39]['weather'][0]['id'];
    iconId11 = value['hourly'][43]['weather'][0]['id'];
    iconId12 = value['hourly'][47]['weather'][0]['id'];
  }

  var firstTimeStrampTemp;
  var secondTimeStrampTemp;
  var thirdTimeStrampTemp;
  var fourthTimeStrampTemp;
  var fifthTimeStrampTemp;
  var sixthTimeStrampTemp;

  var seventhTimeStrampTemp;
  var eigthTimeStrampTemp;
  var ninthTimeStrampTemp;
  var tenthTimeStrampTemp;
  var eleventhTimeStrampTemp;
  var tewelthTimeStrampTemp;
  void updatedTemp(var value) {
    firstTimeStrampTemp = value['hourly'][3]['temp'].toInt();
    secondTimeStrampTemp = value['hourly'][7]['temp'].toInt();
    thirdTimeStrampTemp = value['hourly'][11]['temp'].toInt();
    fourthTimeStrampTemp = value['hourly'][15]['temp'].toInt();
    fifthTimeStrampTemp = value['hourly'][19]['temp'].toInt();
    sixthTimeStrampTemp = value['hourly'][23]['temp'].toInt();

    seventhTimeStrampTemp = value['hourly'][27]['temp'].toInt();
    eigthTimeStrampTemp = value['hourly'][31]['temp'].toInt();
    ninthTimeStrampTemp = value['hourly'][35]['temp'].toInt();
    tenthTimeStrampTemp = value['hourly'][39]['temp'].toInt();
    eleventhTimeStrampTemp = value['hourly'][43]['temp'].toInt();
    tewelthTimeStrampTemp = value['hourly'][47]['temp'].toInt();
  }

  Widget hourlyWeatherContainer(context,
      {bool condition = false, var time, var temp, var icon}) {
    var fontColor = (!condition) ? deActiveColor[0] : activeColor[0];
    var containerColor = (!condition) ? deActiveColor[1] : activeColor[1];

    var borderColor = (!condition) ? deActiveColor[2] : activeColor[1];
    var circleAvatarBackgroundColor =
        (!condition) ? deActiveColor[3] : activeColor[2];
    var iconColor = (!condition) ? deActiveColor[0] : activeColor[3];

    return Column(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: (condition) ? 0 : widget.height * 2 / 100,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: widget.width * 0.01, right: widget.width * 0.01),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            height: (widget.height * 16.5) / 100,
            width: (widget.width * 18.5) / 100,
            decoration: BoxDecoration(
                color: containerColor,
                border: Border.all(color: borderColor, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: widget.height * 0.003,
                ),
                Text(
                  "$time",
                  style: widget.textTheme.copyWith(
                      color: fontColor, fontSize: (widget.width * 3) / 100),
                ),
                CircleAvatar(
                    backgroundColor: circleAvatarBackgroundColor, child: icon),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "$temp",
                      style: widget.textTheme.copyWith(
                          color: fontColor, fontSize: (widget.width * 4) / 100),
                    ),
                    Text(
                      "O",
                      style: widget.textTheme.copyWith(
                        color: fontColor,
                        fontSize: (widget.width * 1.5) / 100,
                      ),
                    ),
                    Text(
                      "C",
                      style: widget.textTheme.copyWith(
                          color: fontColor, fontSize: (widget.width * 3) / 100),
                    ),
                  ],
                ),
                SizedBox(
                  height: widget.height * 0.003,
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: (condition) ? widget.height * 2 / 100 : 0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, value, child) {
      return AnimatedCrossFade(
        duration: Duration(milliseconds: 150),
        firstCurve: Curves.fastOutSlowIn,
        crossFadeState: (value.todayWeatherContainerHeight != 0.0)
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        firstChild: Container(
          height: value.todayWeatherContainerHeight,

          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                height: widget.height * 18.5 / 100,
                width: (widget.width * 6) / 100,
              ),
              GestureDetector(
                onTap: () {
                  value.listViewCondition1 = !value.listViewCondition1;
                  value.listViewCondition2 = false;
                  value.listViewCondition3 = false;
                  value.listViewCondition4 = false;
                  value.listViewCondition5 = false;
                  value.listViewCondition6 = false;
                },
                child: hourlyWeatherContainer(
                  context,
                  condition: value.listViewCondition1,
                  time: firstTimeStramp,
                  temp: (value.todayTextCondition)
                      ? firstTimeStrampTemp
                      : seventhTimeStrampTemp,
                  icon: weatherIcons.getIcon(
                    (value.todayTextCondition) ? iconId1 : iconId7,
                    widget.width * 0.055,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  value.listViewCondition1 = false;
                  value.listViewCondition2 = !value.listViewCondition2;
                  value.listViewCondition3 = false;
                  value.listViewCondition4 = false;
                  value.listViewCondition5 = false;
                  value.listViewCondition6 = false;
                },
                child: hourlyWeatherContainer(
                  context,
                  condition: value.listViewCondition2,
                  time: secondTimeStramp,
                  temp: (value.todayTextCondition)
                      ? secondTimeStrampTemp
                      : eigthTimeStrampTemp,
                  icon: weatherIcons.getIcon(
                    (value.todayTextCondition) ? iconId2 : iconId8,
                    widget.width * 0.055,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  value.listViewCondition1 = false;
                  value.listViewCondition2 = false;
                  value.listViewCondition3 = !value.listViewCondition3;
                  value.listViewCondition4 = false;
                  value.listViewCondition5 = false;
                  value.listViewCondition6 = false;
                },
                child: hourlyWeatherContainer(
                  context,
                  condition: value.listViewCondition3,
                  time: thirdTimeStramp,
                  temp: (value.todayTextCondition)
                      ? thirdTimeStrampTemp
                      : ninthTimeStrampTemp,
                  icon: weatherIcons.getIcon(
                    (value.todayTextCondition) ? iconId3 : iconId9,
                    widget.width * 0.055,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  value.listViewCondition1 = false;
                  value.listViewCondition2 = false;
                  value.listViewCondition3 = false;
                  value.listViewCondition4 = !value.listViewCondition4;
                  value.listViewCondition5 = false;
                  value.listViewCondition6 = false;
                },
                child: hourlyWeatherContainer(
                  context,
                  condition: value.listViewCondition4,
                  time: fourthTimeStramp,
                  temp: (value.todayTextCondition)
                      ? fourthTimeStrampTemp
                      : tenthTimeStrampTemp,
                  icon: weatherIcons.getIcon(
                    (value.todayTextCondition) ? iconId4 : iconId10,
                    widget.width * 0.055,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  value.listViewCondition1 = false;
                  value.listViewCondition2 = false;
                  value.listViewCondition3 = false;
                  value.listViewCondition4 = false;
                  value.listViewCondition5 = !value.listViewCondition5;
                  value.listViewCondition6 = false;
                },
                child: hourlyWeatherContainer(
                  context,
                  condition: value.listViewCondition5,
                  time: fifthTimeStramp,
                  temp: (value.todayTextCondition)
                      ? fifthTimeStrampTemp
                      : eleventhTimeStrampTemp,
                  icon: weatherIcons.getIcon(
                    (value.todayTextCondition) ? iconId5 : iconId11,
                    widget.width * 0.055,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  value.listViewCondition1 = false;
                  value.listViewCondition2 = false;
                  value.listViewCondition3 = false;
                  value.listViewCondition4 = false;
                  value.listViewCondition5 = false;
                  value.listViewCondition6 = !value.listViewCondition6;
                },
                child: hourlyWeatherContainer(
                  context,
                  condition: value.listViewCondition6,
                  time: sixthTimeStramp,
                  temp: (value.todayTextCondition)
                      ? sixthTimeStrampTemp
                      : tewelthTimeStrampTemp,
                  icon: weatherIcons.getIcon(
                    (value.todayTextCondition) ? iconId6 : iconId12,
                    widget.width * 0.055,
                  ),
                ),
              ),
              Container(
                height: widget.height * 19 / 100,
                width: (widget.width * 6) / 100,
              ),
            ],
          ),
          // ),
        ),
        secondChild: Padding(
          padding: EdgeInsets.only(left: (widget.width * 4) / 100),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Chances of rain",
              style: widget.textTheme.copyWith(
                  fontSize: widget.width * 0.045, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    });
  }
}
