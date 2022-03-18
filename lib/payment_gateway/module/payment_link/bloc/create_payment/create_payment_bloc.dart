import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:ninjapay/payment_gateway/common_component/alert_message.dart';
import 'package:ninjapay/payment_gateway/common_component/api_urls.dart';

import 'create_payment_events.dart';
import 'create_payment_states.dart';

class CreatePaymentBloc extends Bloc<CreatePaymentEvents, CreatePaymentStates> {
  CreatePaymentBloc() : super(CreatePaymentInitialState()) {
    on<CreatePaymentRefreshEvent>((event, emit) async {
      await createPaymentAPI(event, emit);
    });
  }

  createPaymentAPI(CreatePaymentRefreshEvent event,
      Emitter<CreatePaymentStates> emit) async {
    emit(CreatePaymentLoadingState());
    try {
      var headers = {HttpHeaders.authorizationHeader: "Bearer $authToken"};
      Map<String, dynamic> postBody = {
        "amount": event.amount,
        "purpose": event.purpose,
      };

      var response = await http.post(
        Uri.parse(apiBaseURL + createPaymentURL),
        headers: headers,
        body: postBody,
      );

      final Map<String, dynamic> decodedBody = convert.jsonDecode(response.body);

      print("**************** decodedBody : $decodedBody ");
      if (response.statusCode == 200 && decodedBody['status'] == true) {
        emit(CreatePaymentSuccessState(decodedBody['message']));
      } else if (decodedBody.containsKey('message')) {
        emit(CreatePaymentErrorState(decodedBody['message']));
      } else {
        emit(CreatePaymentErrorState(AlertMessages.GENERIC_ERROR_MSG));
      }
    } catch (e) {
      print("**************** decodedBody : ${e.toString()} ");
    emit(CreatePaymentErrorState(AlertMessages.GENERIC_ERROR_MSG));
    }
  }
}
