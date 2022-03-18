import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:ninjapay/payment_gateway/common_component/alert_message.dart';
import 'package:ninjapay/payment_gateway/common_component/api_urls.dart';
import 'package:ninjapay/payment_gateway/module/payment_link/model/get_link_payments_model.dart';

import 'get_link_payment_events.dart';
import 'get_link_payment_states.dart';

class GetLinkPaymentBloc
    extends Bloc<GetLinkPaymentEvents, GetLinkPaymentStates> {
  GetLinkPaymentBloc() : super(GetLinkPaymentInitialState()) {
    on<GetLinkPaymentRefreshEvent>((event, emit) async {
      await getLinkPaymentAPI(event, emit);
    });
  }

  getLinkPaymentAPI(GetLinkPaymentRefreshEvent event,
      Emitter<GetLinkPaymentStates> emit) async {
    emit(GetLinkPaymentLoadingState());
    try {
      var headers = {HttpHeaders.authorizationHeader: "Bearer $authToken"};

      var response = await http.get(Uri.parse(apiBaseURL + createPaymentURL),
          headers: headers);
      GetLinkPaymentsModel model =
          GetLinkPaymentsModel.fromJson(convert.jsonDecode(response.body));

      if (response.statusCode == 200 && model.status == true) {
        emit(GetLinkPaymentSuccessState(model));
      } else {
        emit(GetLinkPaymentErrorState(
            model.message ?? AlertMessages.GENERIC_ERROR_MSG));
      }
    } catch (e) {
      emit(GetLinkPaymentErrorState(AlertMessages.GENERIC_ERROR_MSG));
    }
  }
}
