import 'package:flutter/material.dart';
import 'package:weather/PredictedWeatherScreen/TemperatureRepresentationInCelcius.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {Key key,
      @required this.width,
      @required this.height,
      @required this.textTheme,
      this.firstDayOfWeekWeather,
      this.dayName,
      this.icon})
      : super(key: key);

  final double width;
  final double height;
  final TextStyle textTheme;
  final firstDayOfWeekWeather;
  final dayName;
  final icon;

  textRepresentation(context,
      {var text, var color = false, var letterSpacing = false}) {
    return Text(
      text,
      style: textTheme.copyWith(
        fontSize: width * 0.032,
        fontWeight: FontWeight.bold,
        color: (color) ? Color(0xFFADB4B6) : Color(0xFF10103B),
        letterSpacing: (letterSpacing) ? 1 : 0,
      ),
    );
  }

  textColumn(context, {var text1, var text2, var state = false}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          textRepresentation(context,
              text: text1,
              color: (state) ? true : state,
              letterSpacing: (state) ? true : state),
          SizedBox(height: height * 2 / 100),
          textRepresentation(context,
              text: text2,
              color: (state) ? true : state,
              letterSpacing: (state) ? true : state),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.03,
        right: width * 0.03,
      ),
      child: Card(
        elevation: 8,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.07,
            right: width * 0.07,
            top: height * 3 / 100,
            bottom: height * 5 / 100,
          ),
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(dayName,
                    style: textTheme.copyWith(
                        fontSize: width * 0.042, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: width * 5 / 100,
                ),
                icon,
                Expanded(
                  child: Container(),
                ),
                TemperatureRepresentationInCelcius(
                  textTheme: textTheme,
                  size1: width * 0.053,
                  size2: width * 0.025,
                  height: height,
                  semiBold: false,
                  bold: true,
                  temperature: '${firstDayOfWeekWeather['maxTemp']}',
                ),
                SizedBox(
                  width: width * 2.5 / 100,
                ),
                TemperatureRepresentationInCelcius(
                  textTheme: textTheme,
                  size1: width * 0.04,
                  size2: width * 0.025,
                  height: height,
                  color: Color(0xFFADB4B6),
                  semiBold: false,
                  bold: false,
                  temperature: '${firstDayOfWeekWeather['minTemp']}',
                ),
              ],
            ),
            SizedBox(height: height * 3.5 / 100),
            Row(
              children: <Widget>[
                textColumn(context, text1: "Wind", text2: "Pressure"),
                SizedBox(width: width * 6 / 100),
                textColumn(context,
                    text1: '${firstDayOfWeekWeather['wind']} m/h',
                    text2: '${firstDayOfWeekWeather['pressure']}',
                    state: true),
                SizedBox(width: width * 8 / 100),
                textColumn(context, text1: "Humidity", text2: "UV"),
                SizedBox(width: width * 6 / 100),
                textColumn(context,
                    text1: "${firstDayOfWeekWeather['humidity']}%",
                    text2: "${firstDayOfWeekWeather['uv']}",
                    state: true),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
