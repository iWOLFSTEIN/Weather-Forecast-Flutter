import 'package:flutter/material.dart';

class TemperatureInCelcius extends StatelessWidget {
  const TemperatureInCelcius(
      {Key key,
      @required this.textTheme,
      @required this.width,
      @required this.height,
      this.weatherData})
      : super(key: key);

  final TextStyle textTheme;
  final double width;
  final double height;
  final weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
     
      height: height * 0.15,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("${(weatherData['main']['temp'].toInt())}",
              style: textTheme.copyWith(fontSize: width * 0.25)),
          SizedBox(
            width: width * 0.02,
          ),

          Text(
            "O",
            style: textTheme.copyWith(
                fontSize: width * 0.03, fontWeight: FontWeight.w600),
          ),

          Text(
            "C",
            style: textTheme.copyWith(
              fontSize: width * 0.07,
            ),
          ),
          // )
        ],
      ),
    );
  }
}
