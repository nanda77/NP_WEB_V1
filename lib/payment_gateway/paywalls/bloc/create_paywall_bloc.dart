import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/api_provider.dart';
import 'package:ninjapay/payment_gateway/pay/model/common_model.dart';
import 'package:ninjapay/payment_gateway/paywalls/models/paywall_list_model.dart';
import 'package:ninjapay/tipsmodule/models/user_name_model.dart';

class CreatePaywallEvent {}

class CreatePaywallRefreshEvent extends CreatePaywallEvent {
  String name;
  CreatePaywallRefreshEvent(this.name);
}

class CreatePaywallState {}

class CreatePaywallInitialState extends CreatePaywallState {}

class CreatePaywallLoadingState extends CreatePaywallState {}

class CreatePaywallSuccessState extends CreatePaywallState {
  CommonModel? response;
  CreatePaywallSuccessState(this.response);
}

class CreatePaywallErrorState extends CreatePaywallState {
  String errorMessage;
  CreatePaywallErrorState(this.errorMessage);
}

class CreatePaywallBloc extends Bloc<CreatePaywallEvent, CreatePaywallState> {
  ApiProvider provider = ApiProvider();
  CreatePaywallBloc() : super(CreatePaywallInitialState());

  @override
  Stream<CreatePaywallState> mapEventToState(CreatePaywallEvent event) async* {
    try {
      if(event is CreatePaywallRefreshEvent) {
        yield CreatePaywallLoadingState();
        var response = await provider.createPaywall();
        if(response?.data != null && response?.data != []){
          yield CreatePaywallSuccessState(response);
        }
        else {
          yield CreatePaywallErrorState("No Paywall data!");
        }
      }
    } catch(e, stacktrace) {
      print("$e : $stacktrace");
      yield CreatePaywallErrorState(e.toString());
    }
  }

}