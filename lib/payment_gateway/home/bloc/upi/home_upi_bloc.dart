import 'dart:convert' as convert;
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:ninjapay/app_utils.dart';
import 'package:ninjapay/payment_gateway/common_component/alert_message.dart';
import 'package:ninjapay/payment_gateway/common_component/api_urls.dart';
import 'package:ninjapay/payment_gateway/home/model/home_upi_model.dart';

class HomeUpiEvents {}

class GetHomeUpiDataEvent extends HomeUpiEvents {}

class HomeUpiStates {}

class HomeUpiInitialState extends HomeUpiStates {}

class HomeUpiLoadingState extends HomeUpiStates {}

class HomeUpiSuccessState extends HomeUpiStates {
  HomeUpiModel data;

  HomeUpiSuccessState(this.data);
}

class HomeUpiErrorState extends HomeUpiStates {
  String data;
  HomeUpiErrorState(this.data);
}

class HomeUpiBloc extends Bloc<HomeUpiEvents, HomeUpiStates> {
  HomeUpiBloc() : super(HomeUpiInitialState()) {
    on<GetHomeUpiDataEvent>((event, emit) async {
      await getHomeUpiDataAPI(event, emit);
    });
  }

  getHomeUpiDataAPI(GetHomeUpiDataEvent event, Emitter<HomeUpiStates> emit) async {
    emit(HomeUpiLoadingState());
    AppUtils appUtils = AppUtils();
    await appUtils.getFCMToken().then((value) {
      authToken = value;
      print("frist : $authToken");
    });
    try {
      print("second : $authToken");
      var headers = {HttpHeaders.authorizationHeader: "Bearer $authToken"};

      var response = await http.get(Uri.parse(apiBaseURL + getHomeUpiData),
          headers: headers);
      print("*************   response.body   ${response.body}");
      HomeUpiModel model =
      HomeUpiModel.fromJson(convert.jsonDecode(response.body));

      if (response.statusCode == 200 && model.status == true) {
        print("*************     sucess");
        emit(HomeUpiSuccessState(model));
      } else {
        emit(HomeUpiErrorState(
            model.message ?? AlertMessages.GENERIC_ERROR_MSG));
      }
    } catch (e) {
      print("*************     error : ${e.toString()}");

      emit(HomeUpiErrorState(AlertMessages.GENERIC_ERROR_MSG));
    }
  }
}
