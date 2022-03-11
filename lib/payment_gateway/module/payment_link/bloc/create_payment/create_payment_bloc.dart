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
      var authToken = "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJkYzBlNmRmOTgyN2EwMjA2MWU4MmY0NWI0ODQwMGQwZDViMjgyYzAiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoidmlrYXNoIHlhZGF2IiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hLS9BT2gxNEdoUTJyaTJ6RnlDaDFBcTltZ1NMWmM2cU5zOHNlWHJiLUJpbGxiUVdRPXM5Ni1jIiwiaXNzIjoiaHR0cHM6Ly9zZWN1cmV0b2tlbi5nb29nbGUuY29tL25pbmphcGF5LTE5MmMwIiwiYXVkIjoibmluamFwYXktMTkyYzAiLCJhdXRoX3RpbWUiOjE2NDY5OTE2MTMsInVzZXJfaWQiOiJsYXBXdnJCUTFBWExnRVduQjgzeGtEUDQyUVYyIiwic3ViIjoibGFwV3ZyQlExQVhMZ0VXbkI4M3hrRFA0MlFWMiIsImlhdCI6MTY0NzAwNTI3MCwiZXhwIjoxNjQ3MDA4ODcwLCJlbWFpbCI6InZpa2FzaDk4MTM5QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7Imdvb2dsZS5jb20iOlsiMTAwMDI1NTAwMTEzNTk2ODI1NDQ2Il0sImVtYWlsIjpbInZpa2FzaDk4MTM5QGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6Imdvb2dsZS5jb20ifX0.aO71e8ZAfAScePPHWead-d4bsn_oZA8SMzCSIM2l0wzV-Y58y2LQ4c8WSvBwvq3PahIqc14sKxozKxGofOW97AwHR1oyL5f-qtcurNf6tCIt5DNx6OyNr5pZFWXQS9gukYatHDhGG0WuSl89LpBrAW4tqEB7I5wANcyZrdRWnCW0CPMAysXgdyVu5j2t3xnRrOOTtG_xFMWoEoLP_31p0S1x1XQQdk59zOKNuzCYk0FiYX-Tu1B2rvXIM0nk2gqr_8hphp3xpyugy2z_4CzBARU31vfUTVyxOpxgfAKNTfrtYMCvhCHlgNwXDJ9hNb7N3oKiDsHgc6eyfpzRZljAwg";
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

      final Map<String, dynamic> decodedBody =
          convert.jsonDecode(response.body);

      print("**************** decodedBody : $decodedBody ");
      if (response.statusCode == 200 && decodedBody['status'] == true) {
        emit(CreatePaymentSuccessState(decodedBody['message']));
      } else if (decodedBody.containsKey('message')) {
        emit(CreatePaymentErrorState(decodedBody['message']));
      } else {
        emit(CreatePaymentErrorState(AlertMessages.GENERIC_ERROR_MSG));
      }
    } catch (e) {
      emit(CreatePaymentErrorState(AlertMessages.GENERIC_ERROR_MSG));
    }
  }
}
