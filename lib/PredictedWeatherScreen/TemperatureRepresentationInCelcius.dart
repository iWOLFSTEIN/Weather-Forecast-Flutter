import 'package:flutter/material.dart';


class TemperatureRepresentationInCelcius extends StatelessWidget {
  const TemperatureRepresentationInCelcius({
    Key key,
    @required this.textTheme,
    @required this.size1,
    @required this.height,
    this.color,
    this.size2,
   @required this.bold,
   this.temperature,
   this.semiBold

  }) : super(key: key);

  final TextStyle textTheme;
  final double size1;
  final double size2;
  final double height;
  final Color color;
  final bool bold;
  final String temperature;
 final bool semiBold ;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(temperature , style: textTheme.copyWith(
          fontSize: size1,
          fontFamily:(bold || semiBold)? 'Montserrat-SemiBold': 'Montserrat',
          fontWeight:(bold)? FontWeight.bold: FontWeight.normal,
          color: (color == null)? Color(0xFF10103B) : color,
        ),),
      
       Text("o", style: textTheme.copyWith(
        fontSize: size2,
       fontWeight:(bold)? FontWeight.bold: FontWeight.normal,
        fontFamily:(bold)? 'Montserrat': 'Montserrat-SemiBold',
         color: (color == null)? Color(0xFF10103B) : color,
      ),
      ),
    
   
       Text("C", style: textTheme.copyWith(
        fontSize: size1,
         fontFamily:(bold || semiBold)? 'Montserrat-SemiBold': 'Montserrat',
          fontWeight:(bold)? FontWeight.bold: FontWeight.normal,
         color: (color == null)? Color(0xFF10103B) : color,
      ),),
  
      ],
    );
  }
}
