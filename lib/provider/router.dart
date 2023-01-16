import 'package:flutter/material.dart';

class routing with ChangeNotifier {
  int routeID = 1;

  int get gettingroute {
    return routeID;
  }

  set settingroute(int id) {
    routeID = id;
    notifyListeners();
  }
}
