import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/api_provider.dart';
import 'package:ninjapay/payment_gateway/pay/model/common_model.dart';
import 'package:ninjapay/tipsmodule/models/user_name_model.dart';

class UserExistEvent {}

class UserExistRefreshEvent extends UserExistEvent {
  String name;
  UserExistRefreshEvent(this.name);
}

class UserExistState {}

class UserExistInitialState extends UserExistState {}

class UserExistLoadingState extends UserExistState {}

class UserExistSuccessState extends UserExistState {
  CommonModel? response;
  UserExistSuccessState(this.response);
}

class UserExistErrorState extends UserExistState {
  String errorMessage;
  UserExistErrorState(this.errorMessage);
}

class UserExistBloc extends Bloc<UserExistEvent, UserExistState> {
  ApiProvider provider = ApiProvider();
  UserExistBloc() : super(UserExistInitialState());

  @override
  Stream<UserExistState> mapEventToState(UserExistEvent event) async* {
    try {
      if(event is UserExistRefreshEvent) {
        yield UserExistLoadingState();
        // TODO send dynamic token
        var response = await provider.userExist("fcm");
        if(response?.status != null && response?.status == true){
          yield UserExistSuccessState(response);
        }
        else {
          yield UserExistErrorState(response?.message??"");
        }
      }
    } catch(e, stacktrace) {
      print("$e : $stacktrace");
      yield UserExistErrorState(e.toString());
    }
  }

}