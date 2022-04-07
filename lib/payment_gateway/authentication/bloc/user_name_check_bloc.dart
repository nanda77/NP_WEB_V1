import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/api_provider.dart';
import 'package:ninjapay/payment_gateway/pay/model/common_model.dart';

class UserNameCheckEvent {}

class UserNameCheckRefreshEvent extends UserNameCheckEvent {
  String name;
  UserNameCheckRefreshEvent(this.name);
}

class UserNameCheckState {}

class UserNameCheckInitialState extends UserNameCheckState {}

class UserNameCheckLoadingState extends UserNameCheckState {}

class UserNameCheckSuccessState extends UserNameCheckState {
  CommonModel? response;
  UserNameCheckSuccessState(this.response);
}

class UserNameCheckErrorState extends UserNameCheckState {
  String errorMessage;
  UserNameCheckErrorState(this.errorMessage);
}

class UserNameCheckBloc extends Bloc<UserNameCheckEvent, UserNameCheckState> {
  ApiProvider provider = ApiProvider();
  UserNameCheckBloc() : super(UserNameCheckInitialState());

  @override
  Stream<UserNameCheckState> mapEventToState(UserNameCheckEvent event) async* {
    try {
      if(event is UserNameCheckRefreshEvent) {
        yield UserNameCheckLoadingState();
        var response = await provider.userNameCheck(event.name);
        if(response?.status != null && response?.status == true){
          yield UserNameCheckSuccessState(response);
        }
        else {
          yield UserNameCheckErrorState(response?.message??"");
        }
      }
    } catch(e, stacktrace) {
      print("$e : $stacktrace");
      yield UserNameCheckErrorState(e.toString());
    }
  }

}