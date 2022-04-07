import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/api_provider.dart';
import 'package:ninjapay/payment_gateway/pay/model/common_model.dart';

class DeletePaywallEvent {}

class DeletePaywallRefreshEvent extends DeletePaywallEvent {
  String paywallId;
  int index;
  DeletePaywallRefreshEvent(this.paywallId, this.index);
}

class DeletePaywallState {}

class DeletePaywallInitialState extends DeletePaywallState {}

class DeletePaywallLoadingState extends DeletePaywallState {
  int index;
  DeletePaywallLoadingState(this.index);
}

class DeletePaywallSuccessState extends DeletePaywallState {
  CommonModel? response;
  int index;
  DeletePaywallSuccessState(this.response, this.index);
}

class DeletePaywallErrorState extends DeletePaywallState {
  String errorMessage;
  int index;
  DeletePaywallErrorState(this.errorMessage, this.index);
}

class DeletePaywallBloc extends Bloc<DeletePaywallEvent, DeletePaywallState> {
  ApiProvider provider = ApiProvider();
  DeletePaywallBloc() : super(DeletePaywallInitialState());

  @override
  Stream<DeletePaywallState> mapEventToState(DeletePaywallEvent event) async* {
    try {
      if(event is DeletePaywallRefreshEvent) {
        yield DeletePaywallLoadingState(event.index);
        var response = await provider.deletePaywall(event.paywallId);
        if(response?.data != null && response?.data != []){
          yield DeletePaywallSuccessState(response, event.index);
        }
        else {
          yield DeletePaywallErrorState(response?.message??"", event.index);
        }
      }
    } catch(e, stacktrace) {
      print("$e : $stacktrace");
      yield DeletePaywallErrorState(e.toString(), 0);
    }
  }

}