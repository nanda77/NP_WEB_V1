import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/api_provider.dart';
import 'package:ninjapay/tipsmodule/models/get_exchange_rate_model.dart';

class ExchangeRateEvent {}

class ExchangeRateRefreshEvent extends ExchangeRateEvent {
  ExchangeRateRefreshEvent();
}

class ExchangeRateState {}

class ExchangeRateInitialState extends ExchangeRateState {}

class ExchangeRateLoadingState extends ExchangeRateState {}

class ExchangeRateSuccessState extends ExchangeRateState {
  GetExchangeRateModel? response;
  ExchangeRateSuccessState(this.response);
}

class ExchangeRateErrorState extends ExchangeRateState {
  String errorMessage;
  ExchangeRateErrorState(this.errorMessage);
}

class ExchangeRateBloc extends Bloc<ExchangeRateEvent, ExchangeRateState> {
  ApiProvider provider = ApiProvider();
  ExchangeRateBloc() : super(ExchangeRateInitialState());

  @override
  Stream<ExchangeRateState> mapEventToState(ExchangeRateEvent event) async* {
    try {
      if(event is ExchangeRateRefreshEvent) {
        yield ExchangeRateLoadingState();
        var response = await provider.getExchangeRate();
        if(response?.status != null && response?.status == true){
          yield ExchangeRateSuccessState(response);
        }
        else {
          yield ExchangeRateErrorState(response?.message??"");
        }
      }
    } catch(e, stacktrace) {
      print("$e : $stacktrace");
      yield ExchangeRateErrorState(e.toString());
    }
  }

}