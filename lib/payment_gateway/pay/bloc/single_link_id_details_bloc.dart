import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/api_provider.dart';
import 'package:ninjapay/payment_gateway/pay/model/single_link_id_detail_model.dart';

class SingleLinkIdDetailEvent {}

class SingleLinkIdDetailRefreshEvent extends SingleLinkIdDetailEvent {
  String? id;
  SingleLinkIdDetailRefreshEvent(this.id);
}

class SingleLinkIdDetailState {}

class SingleLinkIdDetailInitialState extends SingleLinkIdDetailState {}

class SingleLinkIdDetailLoadingState extends SingleLinkIdDetailState {}

class SingleLinkIdDetailSuccessState extends SingleLinkIdDetailState {
  SingleLinkIdDetailModel? response;
  SingleLinkIdDetailSuccessState(this.response);
}

class SingleLinkIdDetailErrorState extends SingleLinkIdDetailState {
  String errorMessage;
  SingleLinkIdDetailErrorState(this.errorMessage);
}

class SingleLinkIdDetailBloc extends Bloc<SingleLinkIdDetailEvent, SingleLinkIdDetailState> {
  ApiProvider provider = ApiProvider();
  SingleLinkIdDetailBloc() : super(SingleLinkIdDetailInitialState());

  @override
  Stream<SingleLinkIdDetailState> mapEventToState(SingleLinkIdDetailEvent event) async* {
    try {
      if(event is SingleLinkIdDetailRefreshEvent) {
        yield SingleLinkIdDetailLoadingState();
        var response = await provider.singleLinkIdDetails(event.id??"");
        if(response?.status != null && response?.status == true){
          yield SingleLinkIdDetailSuccessState(response);
        }
        else {
          yield SingleLinkIdDetailErrorState(response?.message??"");
        }
      }
    } catch(e, stacktrace) {
      print("$e : $stacktrace");
      yield SingleLinkIdDetailErrorState(e.toString());
    }
  }

}