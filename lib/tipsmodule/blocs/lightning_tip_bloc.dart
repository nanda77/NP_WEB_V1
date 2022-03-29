import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/api_provider.dart';
import 'package:ninjapay/convertor.dart';
import 'package:ninjapay/tipsmodule/models/lightning_tip_deposit_model.dart';

class LightningTipEvent {}

class LightningTipRefreshEvent extends LightningTipEvent {
  String notes, userName;
  double tip, btcPrice;
  int fiatvalue;
  LightningTipRefreshEvent(
      {required this.notes,
      required this.tip,
      required this.btcPrice,
      required this.fiatvalue,
      required this.userName
      });
}

class LightningTipState {}

class LightningTipInitialState extends LightningTipState {}

class LightningTipLoadingState extends LightningTipState {}

class LightningTipSuccessState extends LightningTipState {
  LightningTipDepositModel? response;
  LightningTipSuccessState(this.response);
}

class LightningTipErrorState extends LightningTipState {
  String errorMessage;
  LightningTipErrorState(this.errorMessage);
}

class LightningTipBloc extends Bloc<LightningTipEvent, LightningTipState> {
  ApiProvider provider = ApiProvider();
  LightningTipBloc() : super(LightningTipInitialState());

  @override
  Stream<LightningTipState> mapEventToState(LightningTipEvent event) async* {
    try {
      if (event is LightningTipRefreshEvent) {
        yield LightningTipLoadingState();

        int tip = ConvertorClass.btcToSats(event.tip);

        var response = await provider.lightingTipDeposit(
          tip: tip,
          notes: event.notes,
          btcPrice: event.btcPrice,
          fiatvalue: event.fiatvalue,
          userName: event.userName
        );
        print(response?.toJson().toString());
        if (response?.status != null && response?.status == true) {
          yield LightningTipSuccessState(response);
        } else {
          yield LightningTipErrorState(response?.message ?? "");
        }
      }
    } catch (e, stacktrace) {
      print("$e : $stacktrace");
      yield LightningTipErrorState(e.toString());
    }
  }
}
