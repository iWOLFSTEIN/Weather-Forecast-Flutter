import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:weather/PredictedWeatherScreen/TemperatureRepresentationInCelcius.dart';

enum direction { Right, Left }

class DayOfWeekTemperature extends StatefulWidget {
  const DayOfWeekTemperature(
      {Key key,
      @required this.width,
      @required this.dayName,
      @required this.textTheme,
      @required this.height,
      @required this.humidityLevel,
      @required this.initialTemperature,
      @required this.finalTemperature,
      this.icon
      // this.dayName,
      })
      : super(key: key);

  final double width;
  final dayName;
  final TextStyle textTheme;
  final double height;
  final String humidityLevel;
  final int initialTemperature;
  final int finalTemperature;
  final icon;
  // final dayName;

  @override
  _DayOfWeekTemperatureState createState() => _DayOfWeekTemperatureState();
}

class _DayOfWeekTemperatureState extends State<DayOfWeekTemperature>
    with AfterLayoutMixin<DayOfWeekTemperature> {
  bool callBack = false;

  progressContainer(context, {Color color, var progress, var direct}) {
    return TweenAnimationBuilder(
      curve: Curves.linearToEaseOut,
      duration: Duration(milliseconds: 200),
      tween: Tween<double>(begin: 0, end: (callBack) ? progress.toDouble() : 0),
      builder: (context, value, _) => Container(
        width: ((widget.width * 13.5 / 100) * (value * 100 / 50)) / 100,
        height: widget.height * 4 / 100,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: (direct == direction.Left)
                  ? Radius.circular(20)
                  : Radius.circular(0),
              bottomLeft: (direct == direction.Left)
                  ? Radius.circular(20)
                  : Radius.circular(0),
              topRight: (direct == direction.Right)
                  ? Radius.circular(20)
                  : Radius.circular(0),
              bottomRight: (direct == direction.Right)
                  ? Radius.circular(20)
                  : Radius.circular(0),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.width * 6 / 100,
        right: widget.width * 6 / 100,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${widget.dayName}",
                style: widget.textTheme.copyWith(
                  fontSize: widget.width * 3.8 / 100,
                  fontFamily: 'Montserrat-SemiBold',
                ),
              ),
              SizedBox(
                height: widget.height * 0.2 / 100,
              ),
              Row(
                //  mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'images/drop.png',
                    height: widget.height * 2.7 / 100,
                    width: widget.width * 2.7 / 100,
                  ),
                  SizedBox(
                    width: widget.width * 2 / 100,
                  ),
                  Text(
                    widget.humidityLevel,
                    style: widget.textTheme.copyWith(
                      fontSize: widget.width * 3.4 / 100,
                      fontFamily: 'Montserrat-SemiBold',
                      letterSpacing: 1,
                      color: Color(0xFFADB4B6),
                    ),
                  )
                ],
              )
            ],
          ),
          Expanded(child: widget.icon
             

              ),
          Row(
            children: <Widget>[
              TemperatureRepresentationInCelcius(
                textTheme: widget.textTheme,
                size1: widget.width * 0.048,
                size2: widget.width * 0.028,
                height: widget.height,
                color: Color(0xFFADB4B6),
                semiBold: true,
                bold: false,
                temperature: "${widget.initialTemperature}",
              ),
              SizedBox(
                width: widget.width * 2.5 / 100,
              ),
              LimitedBox(
                maxWidth: widget.width * 27 / 100,
                maxHeight: widget.height * 4 / 100,
                child: Stack(overflow: Overflow.visible, children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text("-------------",
                        style: widget.textTheme.copyWith(
                          letterSpacing: 2.0,
                          color: Color(0xFFADB4B6),
                        )),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        progressContainer(
                          context,
                          color: Color(0xFFD2E4F7),
                          direct: direction.Left,
                          progress:
                              // 50,
                              widget.initialTemperature,
                        ),
                        progressContainer(
                          context,
                          color: Color(0xFFF74512),
                          direct: direction.Right,
                          progress:
                              // 50,
                              widget.finalTemperature,
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              SizedBox(
                width: widget.width * 2.5 / 100,
              ),
              TemperatureRepresentationInCelcius(
                textTheme: widget.textTheme,
                size1: widget.width * 0.048,
                size2: widget.width * 0.028,
                height: widget.height,
                semiBold: true,
                bold: false,
                temperature: "${widget.finalTemperature}",
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    var duration = Duration(milliseconds: 100);
    Timer(duration, callback);
    // TODO: implement afterFirstLayout
  }

  callback() {
    setState(() {
      callBack = true;
    });
  }
}
