import 'dart:convert' as convert;
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:ninjapay/api_provider.dart';
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
  HomeUpiModel? data;
  HomeUpiSuccessState(this.data);
}

class HomeUpiErrorState extends HomeUpiStates {
  String data;
  HomeUpiErrorState(this.data);
}

class HomeUpiBloc extends Bloc<HomeUpiEvents, HomeUpiStates> {
  ApiProvider provider = ApiProvider();
  HomeUpiBloc() : super(HomeUpiInitialState());

  @override
  Stream<HomeUpiStates> mapEventToState(HomeUpiEvents event) async* {
    try {
      if(event is GetHomeUpiDataEvent) {
        yield HomeUpiLoadingState();
        var response = await provider.upiDashboard();
        if(response?.status != null && response?.status == true){
          yield HomeUpiSuccessState(response);
        }
        else {
          yield HomeUpiErrorState(response?.message??"");
        }
      }
    } catch(e, stacktrace) {
      print("$e : $stacktrace");
      yield HomeUpiErrorState(e.toString());
    }
  }

}
