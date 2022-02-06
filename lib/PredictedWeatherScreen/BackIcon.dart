import 'package:flutter/material.dart';
import 'package:weather/FadePageRoute.dart';
import 'package:weather/HomeScreen/CurrentWeather.dart';
class BackIcon extends StatelessWidget {
  const BackIcon({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.025),
        child: GestureDetector(
          onTap: (){
          //  Navigator.push(context, FadePageRoute(CurrentWeather()));
          Navigator.pop(context);
          },
                  child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF10103B),
            size: width*0.05,
          ),
        ),
      ),
    );
  }
}

