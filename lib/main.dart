import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/DataProvider.dart';
import 'DataProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:weather/HomeScreen/CurrentWeather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
          ),
          bodyText2: TextStyle(
            color: Color(0xFF10103B),
            fontFamily: 'Montserrat',
          ),
        )),
        title: 'weather',
        home: CurrentWeather(),
      ),
    );
  }
}
