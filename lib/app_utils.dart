import 'package:shared_preferences/shared_preferences.dart';

class AppUtils {

  Future<bool> getUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('user_logged_in') ?? false;
    return isLoggedIn;
  }

  void setUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('user_logged_in', true);
  }

  Future logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('user_logged_in', false);
    prefs.setString('user_name', '');
    prefs.setString('user_number', '');
    prefs.setString('user_email', '');
    prefs.setString('fcmToken', '');
  }

  void setUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_name', userName);
  }

  Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userName = prefs.getString('user_name') ?? "";
    return userName;
  }

  void setUserNumber(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_number', userName);
  }

  Future<String> getUserNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userName = prefs.getString('user_number') ?? "";
    return userName;
  }

  void setUserEmail(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_email', userName);
  }

  Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userName = prefs.getString('user_email') ?? "";
    return userName;
  }

  void setFCMToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('fcmToken', token);
  }

  Future<String> getFCMToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String fcmToken = prefs.getString('fcmToken') ?? "";
    return fcmToken;
  }

  void setBearerToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('bearerToken', token);
  }

  Future<String> getBearerToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String fcmToken = prefs.getString('bearerToken') ?? "";
    return fcmToken;
  }

}
