import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/PredictedWeatherScreen/PredictedWeather.dart';
import '../DataProvider.dart';
import '../FadePageRoute.dart';

class TodayTomorrowNext7daysTextRow extends StatefulWidget {
  const TodayTomorrowNext7daysTextRow(
      {Key key,
      @required this.height,
      @required this.textTheme,
      @required this.width,
      this.lat,
      this.long,
      this.predictedWeatherData})
      : super(key: key);

  final double height;
  final TextStyle textTheme;
  final double width;
  final predictedWeatherData;
  final lat;
  final long;

  @override
  _TodayTomorrowNext7daysTextRowState createState() =>
      _TodayTomorrowNext7daysTextRowState();
}

class _TodayTomorrowNext7daysTextRowState
    extends State<TodayTomorrowNext7daysTextRow> {
  @override
  Widget build(BuildContext context) {
    var todayWeatherContainerCurrentHeight = Provider.of<DataProvider>(context);

    return Row(
      children: <Widget>[
        Spacer(),
        GestureDetector(
          onTap: () {
            if (todayWeatherContainerCurrentHeight
                        .todayWeatherContainerHeight ==
                    widget.height * 18.5 / 100 &&
                !todayWeatherContainerCurrentHeight.tomorrowTextCondition)
              todayWeatherContainerCurrentHeight.todayWeatherContainerHeight =
                  0.0;
            else
              todayWeatherContainerCurrentHeight.todayWeatherContainerHeight =
                  widget.height * 18.5 / 100;

            todayWeatherContainerCurrentHeight.todayTextCondition =
                !todayWeatherContainerCurrentHeight.todayTextCondition;
            todayWeatherContainerCurrentHeight.tomorrowTextCondition = false;
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            child: Transform.scale(
              scale: (todayWeatherContainerCurrentHeight
                              .todayWeatherContainerHeight !=
                          0.0 &&
                      todayWeatherContainerCurrentHeight.todayTextCondition)
                  ? 1.25
                  : 1,
              child: Text("Today",
                  style: widget.textTheme.copyWith(
                      fontSize: widget.width * 0.042,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            if (todayWeatherContainerCurrentHeight
                        .todayWeatherContainerHeight ==
                    widget.height * 18.5 / 100 &&
                !todayWeatherContainerCurrentHeight.todayTextCondition)
              todayWeatherContainerCurrentHeight.todayWeatherContainerHeight =
                  0.0;
            else
              todayWeatherContainerCurrentHeight.todayWeatherContainerHeight =
                  widget.height * 18.5 / 100;

            todayWeatherContainerCurrentHeight.tomorrowTextCondition =
                !todayWeatherContainerCurrentHeight.tomorrowTextCondition;
            todayWeatherContainerCurrentHeight.todayTextCondition = false;
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            child: Transform.scale(
              scale: (todayWeatherContainerCurrentHeight
                              .todayWeatherContainerHeight !=
                          0.0 &&
                      todayWeatherContainerCurrentHeight.tomorrowTextCondition)
                  ? 1.25
                  : 1,
              child: Text("Tomorrow",
                  style: widget.textTheme.copyWith(
                      fontSize: widget.width * 0.042,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                FadePageRoute(PredictedWeather(
                  predictedWeatherData:
                      widget.predictedWeatherData,
                      lat: widget.lat,
                      long: widget.long,
                )));
          },
          child: Row(
            children: <Widget>[
              Text("Next 7 Days",
                  style: widget.textTheme.copyWith(
                      fontSize: widget.width * 0.042,
                      color: Color(0xFF4896E9),
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.only(left: widget.width * 0.01),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF4896E9),
                  size: widget.width * 0.04,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }
}
