import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:ninjapay/payment_gateway/common_component/alert_message.dart';
import 'package:ninjapay/payment_gateway/common_component/api_urls.dart';

import 'get_link_payment_events.dart';
import 'get_link_payment_states.dart';

class GetLinkPaymentBloc
    extends Bloc<GetLinkPaymentEvents, GetLinkPaymentStates> {
  GetLinkPaymentBloc() : super(GetLinkPaymentInitialState()) {
    on<GetLinkPaymentRefreshEvent>((event, emit) async {
      await GetLinkPaymentAPI(event, emit);
    });
  }

  GetLinkPaymentAPI(GetLinkPaymentRefreshEvent event,
      Emitter<GetLinkPaymentStates> emit) async {
    emit(GetLinkPaymentLoadingState());
    try {
      var authToken = "";
      var headers = {HttpHeaders.authorizationHeader: "Bearer $authToken"};
      Map<String, dynamic> postBody = {
        "amount": event.amount,
        "purpose": event.purpose,
      };

      var response = await http.post(
        Uri.parse(apiBaseURL + getLinkPaymentURL),
        headers: headers,
        body: postBody,
      );

      final Map<String, dynamic> decodedBody =
          convert.jsonDecode(response.body);

      if (response.statusCode == 200 && decodedBody['status'] == true) {
        emit(GetLinkPaymentSuccessState(decodedBody['message']));
      } else if (decodedBody.containsKey('message')) {
        emit(GetLinkPaymentErrorState(decodedBody['message']));
      } else {
        emit(GetLinkPaymentErrorState(AlertMessages.GENERIC_ERROR_MSG));
      }
    } catch (e) {
      emit(GetLinkPaymentErrorState(AlertMessages.GENERIC_ERROR_MSG));
    }
  }
}
