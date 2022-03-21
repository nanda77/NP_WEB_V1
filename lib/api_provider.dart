import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ninjapay/app_utils.dart';
import 'package:ninjapay/landingpage/views/components/header.dart';
import 'package:ninjapay/payment_gateway/common_component/api_urls.dart';
import 'package:ninjapay/payment_gateway/home/model/profile_dashboard_model.dart';
import 'package:ninjapay/payment_gateway/pay/model/common_model.dart';
import 'package:ninjapay/tipsmodule/models/get_exchange_rate_model.dart';
import 'package:ninjapay/tipsmodule/models/lightning_tip_deposit_model.dart';
import 'package:ninjapay/tipsmodule/models/transaction_status_model.dart';
import 'package:ninjapay/tipsmodule/models/user_name_model.dart';

import '../main.dart';

class ApiProvider {
  late Dio _dio;
  static const String BASE_URL =
      "http://lightpay-env.eba-ru7nma8h.ap-southeast-1.elasticbeanstalk.com/api/v1";
  AppUtils appUtils = AppUtils();

  ApiProvider() {
    BaseOptions options = BaseOptions(
      baseUrl: BASE_URL,
      // headers: header,
      headers: {
        /*      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS",*/
        "Authorization": "Bearer $authToken"
      },
      receiveTimeout: 80000,
      connectTimeout: 80000,
      followRedirects: true,
      validateStatus: (status) {
        return status! <= 500;
      },
    );
    _dio = Dio(options);
    // _dio.interceptors.add(LoggingInterceptors());
  }

  // -----------------------Personal Page-----------------------

  Future<UserNameModel?> getUser(String name) async {
    try {
      Response response = await _dio.get("/personalPage/username",
          queryParameters: {"q": name},
          options: Options(contentType: Headers.jsonContentType));
      print(response.data.toString());
      return UserNameModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return UserNameModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<LightningTipDepositModel?> lightingTipDeposit(
      {int? tip,
      String? notes,
      double? btcPrice,
      int? fiatvalue,
      String? userName}) async {
    print({
      "type": "ln",
      "amount": tip,
      "note": notes,
      "fiatValue": fiatvalue,
      "fiatCurrencyUnit": "usd",
      "btcPrice": btcPrice,
      "username": userName
    });
    try {
      Response response = await _dio.post("/personalPage/tipLightningRequest",
          data: {
            "type": "ln",
            "amount": tip,
            "note": notes,
            "fiatValue": fiatvalue,
            "fiatCurrencyUnit": "usd",
            "btcPrice": btcPrice,
            "username": userName
          },
          options: Options(contentType: Headers.jsonContentType));
      return LightningTipDepositModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return LightningTipDepositModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  // -----------------------Exchange Rate-----------------------

  Future<GetExchangeRateModel?> getExchangeRate() async {
    try {
      Response response = await _dio.get("/rates/exchangeRates",
          queryParameters: {},
          options: Options(contentType: Headers.jsonContentType));
      return GetExchangeRateModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return GetExchangeRateModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  // -----------------------Transaction-----------------------

  Future<TransactionStatusModel?> transactionStatus(
      String transactionId) async {
    print(transactionId);
    try {
      Response response = await _dio.post("/transfer/transferstatus",
          data: {"transaction_id": transactionId},
          options: Options(contentType: Headers.jsonContentType));
      return TransactionStatusModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return TransactionStatusModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  // -----------------------Profile-----------------------

  Future<ProfileDashboardModel?> getProfileDashboard() async {
    try {
      Response response = await _dio.get("/profile/dashboard",
          queryParameters: {},
          options: Options(
            contentType: Headers.jsonContentType,
          ));
      print("--------------------" + "${response.data.toString()}");
      return ProfileDashboardModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return ProfileDashboardModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  // -----------------------Merchant-----------------------

  Future<CommonModel?> completePayment(
      {String? orderId,
      String? userName,
      String? utr,
      String? amount,
      String? upi,
      String? purpose,
      String? emailOrPhone}) async {
    try {
      Response response = await _dio.post("/merchant/payment",
          data: {
            "orderId": orderId,
            "username": userName,
            "utr": utr,
            "amount": int.parse(amount ?? "0"),
            "upi": upi,
            "purpose": purpose,
            "emailPhone": emailOrPhone
          },
          options: Options(contentType: Headers.jsonContentType));
      return CommonModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return CommonModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  // -----------------------User-----------------------

  Future<CommonModel?> register(
      {String? uid,
      String? country,
      String? email,
      String? userName,
      String? fcm}) async {
    try {
      Response response = await _dio.post("/user/registration",
          data: {
            "uid": uid,
            "country": country,
            "email": email,
            "username": userName,
            "fcm": fcm
          },
          options: Options(contentType: Headers.jsonContentType));
      return CommonModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return CommonModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<CommonModel?> userExist(String fcm) async {
    try {
      Response response = await _dio.get("/user/userExist",
          queryParameters: {"fcm": fcm},
          options: Options(
            contentType: Headers.jsonContentType,
          ));
      print("--------------------" + "${response.data.toString()}");
      return CommonModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return CommonModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<CommonModel?> userNameCheck(String username) async {
    try {
      Response response = await _dio.get("/user/usernameCheck",
          queryParameters: {"username": username},
          options: Options(
            contentType: Headers.jsonContentType,
          ));
      print("--------------------" + "${response.data.toString()}");
      return CommonModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return CommonModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}
