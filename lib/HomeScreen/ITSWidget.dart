import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../DataProvider.dart';
import 'package:weather/DartNetworking/WeatherIcons.dart';
import 'package:weather/DartNetworking/DaysOfWeek.dart';
import 'package:intl/intl.dart';

class ITSWidget extends StatefulWidget {
  ITSWidget(
      {Key key,
      @required this.width,
      @required this.textTheme,
      @required this.height,
      this.weatherData})
      : super(key: key);

  final double width;
  final TextStyle textTheme;
  final double height;
  var weatherData;

  @override
  _ITSWidgetState createState() => _ITSWidgetState();
}

class _ITSWidgetState extends State<ITSWidget> {
  WeatherIcons weatherIcons = WeatherIcons();
  DaysOfWeek daysOfWeek = DaysOfWeek();

  var dateAndTime = DateTime.now();
  var dayId;

  var formatter = DateFormat.MMMd('en_US');
  var todayDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dayId = DateTime.parse(dateAndTime.toString()).weekday;
    todayDate = formatter.format(dateAndTime);
  }

  @override
  Widget build(BuildContext context) {
    var todayWeatherContainerCurrentHeight = Provider.of<DataProvider>(context);

    return AnimatedCrossFade(
      duration: Duration(milliseconds: 100),
      crossFadeState:
          (todayWeatherContainerCurrentHeight.todayWeatherContainerHeight !=
                  0.0)
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
      firstChild:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        weatherIcons.getIcon(
          widget.weatherData['weather'][0]['id'],
          widget.width * 0.075,
        ),
        SizedBox(
          width: widget.width * .05,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text(
            "Today",
            style: widget.textTheme.copyWith(
              fontSize: widget.width * 0.07,
            ),
          ),
          SizedBox(
            height: widget.height * .01,
          ),
          Text(
            "${daysOfWeek.getDayFullName(dayId).substring(0, 3)}, ${todayDate.split(' ')[1]} ${todayDate.split(' ')[0]}",
            style: widget.textTheme.copyWith(
              fontSize: widget.width * 0.034,
            ),
          )
        ])
      ]),
      secondChild: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          weatherIcons.getIcon(
            widget.weatherData['weather'][0]['id'],
            widget.width * 0.06,
          ),
          SizedBox(
            width: widget.width * 0.04,
          ),
          Text(
            "${widget.weatherData['weather'][0]['description']} !",
            style: widget.textTheme.copyWith(
              fontSize: widget.width * 0.038,
            ),
          ),
        ],
      ),
    );
  }
}
