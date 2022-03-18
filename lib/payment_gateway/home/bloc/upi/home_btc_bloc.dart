import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/api_provider.dart';
import 'package:ninjapay/payment_gateway/home/model/profile_dashboard_model.dart';

class HomeBtcEvent {}

class HomeBtcRefreshEvent extends HomeBtcEvent {}

class HomeBtcState {}

class HomeBtcInitialState extends HomeBtcState {}

class HomeBtcLoadingState extends HomeBtcState {}

class HomeBtcSuccessState extends HomeBtcState {
  ProfileDashboardData? response;
  HomeBtcSuccessState(this.response);
}

class HomeBtcErrorState extends HomeBtcState {
  String errorMessage;
  HomeBtcErrorState(this.errorMessage);
}

class HomeBtcBloc extends Bloc<HomeBtcEvent, HomeBtcState> {
  ApiProvider provider = ApiProvider();
  HomeBtcBloc() : super(HomeBtcInitialState());

  @override
  Stream<HomeBtcState> mapEventToState(HomeBtcEvent event) async* {
    try {
      if(event is HomeBtcRefreshEvent) {
        yield HomeBtcLoadingState();
        var response = await provider.getProfileDashboard();
        if(response?.status != null && response?.status == true){
          yield HomeBtcSuccessState(response?.data);
        }
        else {
          yield HomeBtcErrorState(response?.message??"");
        }
      }
    } catch(e, stacktrace) {
      print("$e : $stacktrace");
      yield HomeBtcErrorState(e.toString());
    }
  }

}