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

Future<String?> getPhoneNumber() async {
  final SharedPreferences instence = await SharedPreferences.getInstance();

  return instence.getString("phonenumber");
}
Future<String?> getUserId() async {
  final SharedPreferences instence = await SharedPreferences.getInstance();

  return instence.getString("userId");
}

Future<void> setToken(String tokken) async {
  final SharedPreferences instence = await SharedPreferences.getInstance();
  instence.setString("token", tokken);
}

Future<void> setRole(String role) async {
  final SharedPreferences instence = await SharedPreferences.getInstance();
  role == "admin" || role == "ADMIN" ? isAdmin = true : isAdmin = false;
  instence.setString("role", role);
}

Future<void> setPhoneNumber(String pnumber) async {
  final SharedPreferences instence = await SharedPreferences.getInstance();

  instence.setString("phonenumber", pnumber);
}

Future<void> setUserId(String userId) async {
  final SharedPreferences instence = await SharedPreferences.getInstance();

  instence.setString("userId", userId);
}