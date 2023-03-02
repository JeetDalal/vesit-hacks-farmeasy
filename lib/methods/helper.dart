import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String loginKey = "LOGINKEY";
  static String emailKey = "EMAILKEY";
  static String passwordKey = "PASSWORDKEY";

  //save user
  saveUserLoggedInStatus(bool isLoogedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setBool(loginKey, isLoogedIn);
  }

  Future<bool?> getIfUserLoggedIn() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(loginKey);
  }
}
