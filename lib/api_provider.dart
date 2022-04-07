import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ninjapay/app_utils.dart';
import 'package:ninjapay/landingpage/views/components/header.dart';
import 'package:ninjapay/payment_gateway/common_component/api_urls.dart';
import 'package:ninjapay/payment_gateway/home/model/home_upi_model.dart';
import 'package:ninjapay/payment_gateway/home/model/profile_dashboard_model.dart';
import 'package:ninjapay/payment_gateway/pay/model/common_model.dart';
import 'package:ninjapay/payment_gateway/pay/model/single_link_id_detail_model.dart';
import 'package:ninjapay/payment_gateway/paywalls/models/create_paywall_model.dart';
import 'package:ninjapay/payment_gateway/paywalls/models/paywall_list_model.dart';
import 'package:ninjapay/tipsmodule/models/get_exchange_rate_model.dart';
import 'package:ninjapay/tipsmodule/models/lightning_tip_deposit_model.dart';
import 'package:ninjapay/tipsmodule/models/transaction_status_model.dart';
import 'package:ninjapay/tipsmodule/models/user_name_model.dart';
import 'package:ninjapay/tipsmodule/screens/tips_lead_page.dart';

import '../main.dart';

class ApiProvider {
  late Dio _dio;
  static const String BASE_URL = "http://lightpay-env.eba-ru7nma8h.ap-southeast-1.elasticbeanstalk.com/api/v1";
  AppUtils appUtils = AppUtils();

  ApiProvider() {
    BaseOptions options = BaseOptions(
      baseUrl: BASE_URL,
      receiveTimeout: 80000,
      connectTimeout: 80000,
      followRedirects: true,
      validateStatus: (status) {
        return status! <= 500;
      },
    );
    _dio = Dio(options);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);//modify your request
      },
      onResponse: (response, handler) {
        if (response != null) {//on success it is getting called here
          return handler.next(response);
        } else {
          return null;
        }
      },
      onError: (DioError e, handler) async {
        if (e.response != null) {
          if (e.response?.data.toString().trim() == "forbidden" || e.response?.statusCode == 401) {//catch the 401 here
            _dio.interceptors.requestLock.lock();
            _dio.interceptors.responseLock.lock();
            FirebaseAuth.instance.signOut();
            appUtils.logoutUser();
            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const TipsLeadPage()), (Route<dynamic> route) => false);
          } else {
            handler.next(e);
          }
        }
      }
    ));
    // _dio.interceptors.add(LoggingInterceptors());
  }

  // -----------------------Personal Page-----------------------

  Future<UserNameModel?> getUser(String name) async {
    String token = await appUtils.getFCMToken();
    try {
      Response response = await _dio.get("/personalPage/username",
        queryParameters: {"q": name},
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            "Authorization": "Bearer $token"
          }
        )
      );
      return UserNameModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return UserNameModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<LightningTipDepositModel?> lightingTipDeposit({int? tip, String? notes, double? btcPrice, int? fiatvalue, String? userName}) async {
    String token = await appUtils.getFCMToken();
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
          options: Options(
            contentType: Headers.jsonContentType,
            headers: {
              "Authorization": "Bearer $token"
            }
          )
      );
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
    String token = await appUtils.getFCMToken();
    try {
      Response response = await _dio.get("/rates/exchangeRates",
        queryParameters: {},
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            "Authorization": "Bearer $token"
          }
        )
      );
      return GetExchangeRateModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return GetExchangeRateModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  // -----------------------Transaction-----------------------

  Future<TransactionStatusModel?> transactionStatus(String transactionId) async {
    String token = await appUtils.getFCMToken();
    print(transactionId);
    try {
      Response response = await _dio.post("/transfer/transferstatus",
          data: {
            "transaction_id": transactionId
          },
          options: Options(
            contentType: Headers.jsonContentType,
            headers: {
              "Authorization": "Bearer $token"
            }
          )
      );
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
    String token = await appUtils.getFCMToken();
    try {
      Response response = await _dio.get("/profile/dashboard",
        queryParameters: {},
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            "Authorization": "Bearer $token"
          }
        )
      );
      print("--------------------"+ "${response.data.toString()}");
      return ProfileDashboardModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return ProfileDashboardModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  // -----------------------Merchant-----------------------

  Future<CommonModel?> updateTransactionStatus({String? status, String? utr}) async {
    String token = await appUtils.getFCMToken();
    print("Bearer $token");
    try {
      Response response = await _dio.patch("/merchant/upiTransactionStatus",
          queryParameters: {
            "trnx_status": status,
            "utr": utr
            },
          options: Options(
              contentType: Headers.jsonContentType,
              headers: {
                "Authorization": "Bearer $token"
              }
          )
      );
      print("--------------------"+ "${response.data.toString()}");
      return CommonModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return CommonModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<CommonModel?> completePayment({String? orderId, String? userName, String? utr, String? amount, String? upi, String? purpose, String? emailOrPhone}) async {
    String token = await appUtils.getFCMToken();
    print({
      "orderId": orderId,
      "username": userName,
      "utr": utr,
      "amount": int.parse(amount??"0"),
      "upi": upi,
      "purpose": purpose,
      "emailPhone": emailOrPhone
    });
    try {
      Response response = await _dio.post("/merchant/payment",
          data: {
            "orderId": orderId,
            "username": userName,
            "utr": utr,
            "amount": int.parse(amount??"0"),
            "upi": upi,
            "purpose": purpose,
            "emailPhone": emailOrPhone
          },
          options: Options(
            contentType: Headers.jsonContentType,
            headers: {
              "Authorization": "Bearer $token"
            }
          )
      );
      return CommonModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {

      if (error.response != null)
        return CommonModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<SingleLinkIdDetailModel?> singleLinkIdDetails(String id) async {
    String token = await appUtils.getFCMToken();
    try {
      Response response = await _dio.get("/merchant/singlepaymentLinkDetail",
          queryParameters: {
            "linkId": id
          },
          options: Options(
              contentType: Headers.jsonContentType,
              headers: {
                "Authorization": "Bearer $token"
              }
          )
      );
      print("--------------------"+ "${response.data.toString()}");
      return SingleLinkIdDetailModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return SingleLinkIdDetailModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<HomeUpiModel?> upiDashboard() async {
    String token = await appUtils.getFCMToken();
    print("Bearer $token");
    try {
      Response response = await _dio.get("/merchant/upiDashboard",
          queryParameters: {},
          options: Options(
              contentType: Headers.jsonContentType,
              headers: {
                "Authorization": "Bearer $token"
              }
          )
      );
      print("--------------------"+ "${response.data.toString()}");
      return HomeUpiModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return HomeUpiModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  // -----------------------User-----------------------

  Future<CommonModel?> register({String? uid, String? country, String? email, String? phone, String? userName, String? fcm}) async {
    String token = await appUtils.getFCMToken();
    print({
      "uid": uid,
      "country": country,
      "email": email,
      "phoneNumber": phone,
      "username": userName,
      "fcm": fcm
    });
    try {
      Response response = await _dio.post("/user/registration",
          data: {
            "uid": uid,
            "country": country,
            "email": email,
            "phoneNumber": phone,
            "username": userName,
            "fcm": fcm
          },
          options: Options(
            contentType: Headers.jsonContentType,
            headers: {
              "Authorization": "Bearer $token"
            }
          )
      );
      print(response.data.toString());
      return CommonModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {

      if (error.response != null)
        return CommonModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<CommonModel?> userExist(String fcm) async {
    String token = await appUtils.getFCMToken();
    try {
      Response response = await _dio.get("/user/userExist",
          queryParameters: {
            "fcm": fcm
          },
          options: Options(
            contentType: Headers.jsonContentType,
            headers: {
              "Authorization": "Bearer $token"
            }
          )
      );
      print("--------------------"+ "${response.data.toString()}");
      return CommonModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return CommonModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<CommonModel?> userNameCheck(String username) async {
    String token = await appUtils.getFCMToken();
    try {
      Response response = await _dio.get("/user/usernameCheck",
          queryParameters: {
            "username": username
          },
          options: Options(
            contentType: Headers.jsonContentType,
            headers: {
              "Authorization": "Bearer $token"
            }
          )
      );
      print("--------------------"+ "${response.data.toString()}");
      return CommonModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return CommonModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  // -----------------------Paywall Section------------------------

  Future<PaywallListModel?> paywallList() async {
    String invoiceKey = await appUtils.getInvoiceKey();
    try {
      Response response = await _dio.get("https://www.lnbits.com/paywall/api/v1/paywalls",
        queryParameters: {},
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            "X-Api-Key": invoiceKey
          }
        )
      );
      print("--------------------"+ "${response.data.toString()}");
      return PaywallListModel.fromJson({
        "data": response.data
      });
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return PaywallListModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<CreatePaywallModel?> createPaywall({int? amount, String? desc, String? memo, String? url}) async {
    String adminKey = await appUtils.getAdminKey();
    try {
      Response response = await _dio.post("https://www.lnbits.com/paywall/api/v1/paywalls",
          data: {
            "amount": amount,
            "description": desc,
            "memo": memo,
            "remembers": true,
            "url": url
          },
          options: Options(
            contentType: Headers.jsonContentType,
            headers: {
              "X-Api-Key": adminKey
            }
          )
      );
      print(response.data.toString());
      return CreatePaywallModel.fromJson({
        "data": response.data
      });
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return CreatePaywallModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return CreatePaywallModel.fromJson({
        "data": null
      });
    }
  }

  Future<CommonModel?> deletePaywall(String paywallId) async {
    String invoiceKey = await appUtils.getInvoiceKey();
    try {
      Response response = await _dio.delete("https://www.lnbits.com/paywall/api/v1/paywalls/$paywallId",
          queryParameters: {},
          options: Options(
            contentType: Headers.jsonContentType,
            headers: {
              "X-Api-Key": invoiceKey
            }
          )
      );
      print("--------------------"+ "${response.data.toString()}");
      if(response.statusCode == 204){
        return CommonModel.fromJson({
          "status": true,
          "message": "Deleted Successfully..",
          "data": null
        });
      }
      else{
        return CommonModel.fromJson({
          "status": false,
          "message": "Something went wrong!",
          "data": null
        });
      }
    } on DioError catch (error, stacktrace) {
      if (error.response != null)
        return CommonModel.fromJson(error.response!.data);
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

}