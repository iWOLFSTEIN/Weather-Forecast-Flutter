import 'package:flutter/material.dart';


class Next7DaysCardHeading extends StatelessWidget {
  const Next7DaysCardHeading({
    Key key,
    @required this.width,
    @required this.textTheme,
  }) : super(key: key);

  final double width;
  final TextStyle textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: width * 0.03),
        child: Row(children: <Widget>[
    Text("Next", style: textTheme.copyWith(
      fontSize: width*0.06
    )),
    Text(" ", style: textTheme.copyWith(
      fontSize: width*0.06
    )),
    Text("7 days", style: textTheme.copyWith(
      fontSize: width*0.06,
      fontFamily: 'Montserrat-SemiBold',
      fontWeight: FontWeight.bold
    )),
        ],),
      );
  }
}

