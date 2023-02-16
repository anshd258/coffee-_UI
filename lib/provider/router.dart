import 'package:flutter/material.dart';

class routing with ChangeNotifier {
  int routeID = 1;

  int get gettingroute {
    return routeID;
  }

  void settingRoute(int id) {
    routeID = id;
    notifyListeners();
  }
}
