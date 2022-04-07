import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/api_provider.dart';
import 'package:ninjapay/payment_gateway/paywalls/models/paywall_list_model.dart';
import 'package:ninjapay/tipsmodule/models/user_name_model.dart';

class PaywallListEvent {}

class PaywallListRefreshEvent extends PaywallListEvent {}

class PaywallListState {}

class PaywallListInitialState extends PaywallListState {}

class PaywallListLoadingState extends PaywallListState {}

class PaywallListSuccessState extends PaywallListState {
  PaywallListModel? response;
  PaywallListSuccessState(this.response);
}

class PaywallListErrorState extends PaywallListState {
  String errorMessage;
  PaywallListErrorState(this.errorMessage);
}

class PaywallListBloc extends Bloc<PaywallListEvent, PaywallListState> {
  ApiProvider provider = ApiProvider();
  PaywallListBloc() : super(PaywallListInitialState());

  @override
  Stream<PaywallListState> mapEventToState(PaywallListEvent event) async* {
    try {
      if(event is PaywallListRefreshEvent) {
        yield PaywallListLoadingState();
        var response = await provider.paywallList();
        if(response?.data != null && response?.data != []){
          yield PaywallListSuccessState(response);
        }
        else {
          yield PaywallListErrorState("No Paywall data!");
        }
      }
    } catch(e, stacktrace) {
      print("$e : $stacktrace");
      yield PaywallListErrorState(e.toString());
    }
  }

}