import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/api_provider.dart';
import 'package:ninjapay/tipsmodule/models/transaction_status_model.dart';

class TransactionStatusEvent {}

class TransactionStatusRefreshEvent extends TransactionStatusEvent {
  String transactionId;
  TransactionStatusRefreshEvent(this.transactionId);
}

class TransactionStatusState {}

class TransactionStatusInitialState extends TransactionStatusState {}

class TransactionStatusLoadingState extends TransactionStatusState {}

class TransactionStatusSuccessState extends TransactionStatusState {
  TransactionStatusModel? response;
  TransactionStatusSuccessState(this.response);
}

class TransactionStatusErrorState extends TransactionStatusState {
  String errorMessage;
  TransactionStatusErrorState(this.errorMessage);
}

class TransactionStatusBloc extends Bloc<TransactionStatusEvent, TransactionStatusState> {
  ApiProvider provider = ApiProvider();
  TransactionStatusBloc() : super(TransactionStatusInitialState());

  @override
  Stream<TransactionStatusState> mapEventToState(TransactionStatusEvent event) async* {
    try {
      if(event is TransactionStatusRefreshEvent) {
        yield TransactionStatusLoadingState();
        var response = await provider.transactionStatus(event.transactionId);
        print(response?.data?.toJson()??"");
        if(response?.status != null && response?.status == true){
          yield TransactionStatusSuccessState(response);
        }
        else {
          yield TransactionStatusErrorState(response?.message??"");
        }
      }
    } catch(e, stacktrace) {
      print("$e : $stacktrace");
      yield TransactionStatusErrorState(e.toString());
    }
  }

}