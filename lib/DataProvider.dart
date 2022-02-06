import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DataProvider with ChangeNotifier {
  dynamic _todayWeatherContainerHeight = 0.0;

  dynamic get todayWeatherContainerHeight => _todayWeatherContainerHeight;

  set todayWeatherContainerHeight(var value) {
    _todayWeatherContainerHeight = value;
    notifyListeners();
  }

  bool _listViewCondition1 = false;
  bool get listViewCondition1 => _listViewCondition1;
  set listViewCondition1(var value) {
    _listViewCondition1 = value;
    notifyListeners();
  }

  bool _listViewCondition2 = false;
  bool get listViewCondition2 => _listViewCondition2;
  set listViewCondition2(var value) {
    _listViewCondition2 = value;
    notifyListeners();
  }

  bool _listViewCondition3 = false;
  bool get listViewCondition3 => _listViewCondition3;
  set listViewCondition3(var value) {
    _listViewCondition3 = value;
    notifyListeners();
  }

  bool _listViewCondition4 = false;
  bool get listViewCondition4 => _listViewCondition4;
  set listViewCondition4(var value) {
    _listViewCondition4 = value;
    notifyListeners();
  }

  bool _listViewCondition5 = false;
  bool get listViewCondition5 => _listViewCondition5;
  set listViewCondition5(var value) {
    _listViewCondition5 = value;
    notifyListeners();
  }

  bool _listViewCondition6 = false;
  bool get listViewCondition6 => _listViewCondition6;
  set listViewCondition6(var value) {
    _listViewCondition6 = value;
    notifyListeners();
  }

  bool _todayTextCondition = false;
  bool get todayTextCondition => _todayTextCondition;
  set todayTextCondition(var value) {
    _todayTextCondition = value;
    notifyListeners();
  }

  bool _tomorrowTextCondition = false;
  bool get tomorrowTextCondition => _tomorrowTextCondition;
  set tomorrowTextCondition(var value) {
    _tomorrowTextCondition = value;
    notifyListeners();
  }
}
