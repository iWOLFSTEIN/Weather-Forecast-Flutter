import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key key,
    @required this.height,
    @required this.width,
    @required this.textTheme,
   
    this.imageAdress

  }) : super(key: key);

  final double height;
  final double width;
  final TextStyle textTheme;
 
  final String imageAdress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Spacer(),
        Image.asset(
          // "images/pic7.png",
          imageAdress,
          height: height * 0.02,
          width: width * .09,
        ),
        Spacer(),
        Spacer(),
        Spacer(),
        Spacer(),
        Spacer(),
        Spacer(),
        Text(
          "Weather Forecast",
          style: textTheme.copyWith(
              fontSize: width * 0.045, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Spacer(),
        Spacer(),
        Spacer(),
        Spacer(),
        Spacer(),
        Spacer(),
        Spacer(),
        Spacer(),
      ],
    );
  }
}
