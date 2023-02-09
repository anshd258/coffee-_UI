import 'package:inter_coffee/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getToken() async {
  final SharedPreferences instence = await SharedPreferences.getInstance();
  return instence.getString("token");
}

Future<String?> getRole() async {
  final SharedPreferences instence = await SharedPreferences.getInstance();

  return instence.getString("role");
}

Future<void> setToken(String tokken) async {
  final SharedPreferences instence = await SharedPreferences.getInstance();
  instence.setString("token", tokken);
}

Future<void> setRole(String role) async {
  final SharedPreferences instence = await SharedPreferences.getInstance();
  role == "admin" ? isAdmin = true : isAdmin = false;
  instence.setString("role", role);
}
