import 'dart:convert' as convert;
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:ninjapay/api_provider.dart';
import 'package:ninjapay/app_utils.dart';
import 'package:ninjapay/payment_gateway/common_component/alert_message.dart';
import 'package:ninjapay/payment_gateway/common_component/api_urls.dart';
import 'package:ninjapay/payment_gateway/home/model/home_upi_model.dart';
import 'package:ninjapay/payment_gateway/pay/model/common_model.dart';

class UpdateTransactionEvents {}

class UpdateTransactionStateRefreshEvent extends UpdateTransactionEvents {
  String? utr, status;
  int? index;
  UpdateTransactionStateRefreshEvent({this.status, this.utr, this.index});
}

class UpdateTransactionStates {}

class UpdateTransactionInitialState extends UpdateTransactionStates {}

class UpdateTransactionLoadingState extends UpdateTransactionStates {
  int? index;
  UpdateTransactionLoadingState(this.index);
}

class UpdateTransactionSuccessState extends UpdateTransactionStates {
  CommonModel? data;
  int? index;
  UpdateTransactionSuccessState(this.data, this.index);
}

class UpdateTransactionErrorState extends UpdateTransactionStates {
  String data;
  int? index;
  UpdateTransactionErrorState(this.data, this.index);
}

class UpdateTransactionBloc extends Bloc<UpdateTransactionEvents, UpdateTransactionStates> {
  ApiProvider provider = ApiProvider();
  UpdateTransactionBloc() : super(UpdateTransactionInitialState());

  @override
  Stream<UpdateTransactionStates> mapEventToState(UpdateTransactionEvents event) async* {
    try {
      if(event is UpdateTransactionStateRefreshEvent) {
        yield UpdateTransactionLoadingState(event.index);
        var response = await provider.updateTransactionStatus(status: event.status, utr: event.utr);
        if(response?.status != null && response?.status == true){
          yield UpdateTransactionSuccessState(response, event.index);
        }
        else {
          yield UpdateTransactionErrorState(response?.message??"", event.index);
        }
      }
    } catch(e, stacktrace) {
      print("$e : $stacktrace");
      yield UpdateTransactionErrorState(e.toString(), 0);
    }
  }

}
