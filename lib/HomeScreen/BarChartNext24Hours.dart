import 'dart:async';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:intl/intl.dart';
import 'package:time/time.dart';
import 'package:weather/DartNetworking/BarChartProgressIndicator.dart';

class BarChartNext24Hours extends StatefulWidget {
  const BarChartNext24Hours(
      {this.textStyle, key, this.height, this.width, this.predictedWeatherData})
      : super(key: key);
  final height;
  final width;
  final textStyle;
  final predictedWeatherData;

  @override
  _BarChartNext24HoursState createState() => _BarChartNext24HoursState();
}

class _BarChartNext24HoursState extends State<BarChartNext24Hours>
    with AfterLayoutMixin<BarChartNext24Hours> {

   BarChartProgressIndicator progress = BarChartProgressIndicator();

  var first4HourInterval;
  var second4HourInterval;
  var third4HourInterval;
  var fourth4HourInterval;
  var fifth4HourInterval;
  var sixth4HourInterval;

  var firstTimeStramp;
  var secondTimeStramp;
  var thirdTimeStramp;
  var fourthTimeStramp;
  var fifthTimeStramp;
  var sixthTimeStramp;

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
    updatedWeather(widget.predictedWeatherData);

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

  void updatedWeather(var value) {
    first4HourInterval = value['hourly'][3]['weather'][0]['id'];

    second4HourInterval = value['hourly'][7]['weather'][0]['id'];

    third4HourInterval = value['hourly'][11]['weather'][0]['id'];

    fourth4HourInterval = value['hourly'][15]['weather'][0]['id'];

    fifth4HourInterval = value['hourly'][19]['weather'][0]['id'];

    sixth4HourInterval = value['hourly'][23]['weather'][0]['id'];
  }

  bool callBack = false;

  Widget containerYAxis(context, String data, {var heightOf, var size}) {
    return Container(
        height: heightOf,
        child: Center(
          child: Text(
            data,
            style: widget.textStyle
                .copyWith(fontSize: (widget.width * size) / 100),
          ),
        ));
  }

  Widget progressContainer(context, {var progress}) {
    return Padding(
      padding: EdgeInsets.only(
          left: ((widget.width / 3) * 12) / 100,
          right: ((widget.width / 3) * 12) / 100,
          bottom: (((widget.height / 3) * 18) / 100) / 3.5),
      child: LimitedBox(
        maxHeight: widget.height * 15 / 100,
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: RotatedBox(
                quarterTurns: 1,
                child: Text(
                  "-------------",
                  style: widget.textStyle.copyWith(
                    letterSpacing: 2.0,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TweenAnimationBuilder(
                curve: Curves.linearToEaseOut,
                duration: Duration(milliseconds: 200),
                tween: Tween<double>(
                    begin: 0, end: (callBack) ? progress.toDouble() : 0),
                builder: (context, value, __) => Container(
                  height: ((widget.height * 15 / 100) * value) / 100,
                  decoration: BoxDecoration(
                      color: (progress <= 60)
                          ? Color(0xFFF7C411)
                          : Color(0xFF2F3062),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: (widget.width * 4) / 100,
        right: (widget.width * 4) / 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    containerYAxis(
                      context,
                      "sunny",
                      heightOf: ((widget.height / 3) * 19) / 100,
                      size: 3.5,
                    ),
                    containerYAxis(
                      context,
                      "Rainy",
                      heightOf: ((widget.height / 3) * 19) / 100,
                      size: 3.5,
                    ),
                    containerYAxis(
                      context,
                      "Stormy",
                      heightOf: ((widget.height / 3) * 19) / 100,
                      size: 3.5,
                    ),
                  ],
                ),
                Expanded(
                    child: progressContainer(context,
                        progress: progress.getProgress(first4HourInterval),
                        //  (first4HourInterval <= 600)
                        //     ? first4HourInterval / 10
                        //     : (first4HourInterval + 196) / 10
                            )
                            ),
                Expanded(
                    child: progressContainer(context,
                    progress: progress.getProgress(second4HourInterval),
                        // progress: (second4HourInterval <= 600)
                        //     ? second4HourInterval / 10
                        //     : (second4HourInterval + 196) / 10
                            )),
                Expanded(
                    child: progressContainer(context,
                    progress: progress.getProgress(third4HourInterval),
                        // progress: (third4HourInterval <= 600)
                        //     ? third4HourInterval / 10
                        //     : (third4HourInterval + 196) / 10
                            )),
                Expanded(
                    child: progressContainer(context,
                    progress: progress.getProgress(fourth4HourInterval),
                        // progress: (fourth4HourInterval <= 600)
                        //     ? fourth4HourInterval / 10
                        //     : (fourth4HourInterval + 196) / 10
                            )),
                Expanded(
                    child: progressContainer(context,
                    progress: progress.getProgress(fifth4HourInterval),
                        // progress: (fifth4HourInterval <= 600)
                        //     ? fifth4HourInterval / 10
                        //     : (fifth4HourInterval + 196) / 10
                            )),
                Expanded(
                    child: progressContainer(context,
                    progress: progress.getProgress(sixth4HourInterval),
                        // progress: (sixth4HourInterval <= 600)
                        //     ? sixth4HourInterval / 10
                        //     : (sixth4HourInterval + 196) / 10
                            )),
              ],
            ),
          ),
          SizedBox(
            height: widget.height * 1 / 100,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: widget.width * 14 / 100,
              ),
              Expanded(
                child: containerYAxis(
                  context,
                  "$firstTimeStramp",
                  size: 3,
                ),
              ),
              Expanded(
                  child: containerYAxis(
                context,
                "$secondTimeStramp",
                size: 3,
              )),
              Expanded(
                  child: containerYAxis(
                context,
                "$thirdTimeStramp",
                size: 3,
              )),
              Expanded(
                  child: containerYAxis(
                context,
                "$fourthTimeStramp",
                size: 3,
              )),
              Expanded(
                  child: containerYAxis(
                context,
                "$fifthTimeStramp",
                size: 3,
              )),
              Expanded(
                  child: containerYAxis(
                context,
                "$sixthTimeStramp",
                size: 3,
              )),
            ],
          )
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    startTimer();
  }

  startTimer() {
    var duration = Duration(milliseconds: 100);
    Timer(duration, callback);
  }

  callback() {
    setState(() {
      callBack = true;
    });
  }
}
