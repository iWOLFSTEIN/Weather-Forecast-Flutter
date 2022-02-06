import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class City extends StatelessWidget {
  const City(
      {Key key,
      @required this.textTheme,
      @required this.width,
      this.weatherData})
      : super(key: key);

  final TextStyle textTheme;
  final double width;
  final weatherData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "${weatherData['name']}, ${weatherData['sys']['country']}",
          style: textTheme.copyWith(
            fontSize: width * 0.035,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.02),
          child: FaIcon(
            FontAwesomeIcons.solidEdit,
            color: Colors.white,
            size: width * 0.03,
          ),
        )
      ],
    );
  }
}
