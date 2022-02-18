import 'package:ninjapay/api_provider.dart';

class TipsRepository {
  static String? accessToken;
  static String? refreshToken;
  static String? uuid;
  ApiProvider _apiProvider = ApiProvider();
  TipsRepository._privateConstructor();

  static final TipsRepository instance = TipsRepository._privateConstructor();

  getUserName(){

  }
}