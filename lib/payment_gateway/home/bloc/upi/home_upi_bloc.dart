import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:ninjapay/payment_gateway/common_component/alert_message.dart';
import 'package:ninjapay/payment_gateway/common_component/api_urls.dart';
import 'package:ninjapay/payment_gateway/home/model/home_upi_model.dart';
import 'package:ninjapay/payment_gateway/module/payment_link/model/get_link_payments_model.dart';

import 'home_upi_events.dart';
import 'home_upi_states.dart';

class HomeUpiBloc
    extends Bloc<HomeUpiEvents, HomeUpiStates> {
  HomeUpiBloc() : super(HomeUpiInitialState()) {
    on<GetHomeUpiDataEvent>((event, emit) async {
      await getHomeUpiDataAPI(event, emit);
    });
  }

  getHomeUpiDataAPI(GetHomeUpiDataEvent event, Emitter<HomeUpiStates> emit) async {
    emit(HomeUpiLoadingState());
    try {
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
