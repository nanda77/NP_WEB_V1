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
    prefs.setString('phone_code', '');
    prefs.setString('country_name', '');
    prefs.setString('country_code', '');
    prefs.setString('firebase_uid', '');
    prefs.setString('bearerToken', '');
  }

  void setPhoneCode(String phoneCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phone_code', phoneCode);
  }

  Future<String> getPhoneCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String phoneCode = prefs.getString('phone_code') ?? "";
    return phoneCode;
  }

  void setCountry(String countryName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('country_name', countryName);
  }

  Future<String> getCountry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String countryName = prefs.getString('country_name') ?? "";
    return countryName;
  }

  void setCountryCode(String countryCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('country_code', countryCode);
  }

  Future<String> getCountryCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String countryCode = prefs.getString('country_code') ?? "";
    return countryCode;
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

  void setUserEmail(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_email', userEmail);
  }

  Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userEmail = prefs.getString('user_email') ?? "";
    return userEmail;
  }

  void setFirebaseUId(String firebaseUid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('firebase_uid', firebaseUid);
  }

  Future<String> getFirebaseUId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String firebaseUid = prefs.getString('firebase_uid') ?? "";
    return firebaseUid;
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
