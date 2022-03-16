import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/api_provider.dart';
import 'package:ninjapay/payment_gateway/pay/model/complete_payment_model.dart';

class CompletePaymentEvent {}

class CompletePaymentRefreshEvent extends CompletePaymentEvent {
  String? orderId, userName, utr, amount, upi, purpose, emailOrPhone;
  CompletePaymentRefreshEvent({this.upi, this.userName, this.amount, this.purpose, this.emailOrPhone, this.orderId, this.utr});
}

class CompletePaymentState {}

class CompletePaymentInitialState extends CompletePaymentState {}

class CompletePaymentLoadingState extends CompletePaymentState {}

class CompletePaymentSuccessState extends CompletePaymentState {
  CompletePaymentModel? response;
  CompletePaymentSuccessState(this.response);
}

class CompletePaymentErrorState extends CompletePaymentState {
  String errorMessage;
  CompletePaymentErrorState(this.errorMessage);
}

class CompletePaymentBloc extends Bloc<CompletePaymentEvent, CompletePaymentState> {
  ApiProvider provider = ApiProvider();
  CompletePaymentBloc() : super(CompletePaymentInitialState());

  @override
  Stream<CompletePaymentState> mapEventToState(CompletePaymentEvent event) async* {
    try {
      if(event is CompletePaymentRefreshEvent) {
        yield CompletePaymentLoadingState();
        var response = await provider.completePayment(userName: event.userName, amount: event.amount, emailOrPhone: event.emailOrPhone, orderId: event.orderId, purpose: event.purpose, upi: event.upi, utr: event.utr);
        if(response?.status != null && response?.status == true){
          yield CompletePaymentSuccessState(response);
        }
        else {
          yield CompletePaymentErrorState(response?.message??"");
        }
      }
    } catch(e, stacktrace) {
      print("$e : $stacktrace");
      yield CompletePaymentErrorState(e.toString());
    }
  }

}