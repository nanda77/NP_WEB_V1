import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/api_provider.dart';
import 'package:ninjapay/tipsmodule/models/user_name_model.dart';

class GetUserEvent {}

class GetUserRefreshEvent extends GetUserEvent {
  String name;
  GetUserRefreshEvent(this.name);
}

class GetUserState {}

class GetUserInitialState extends GetUserState {}

class GetUserLoadingState extends GetUserState {}

class GetUserSuccessState extends GetUserState {
  UserData? response;
  GetUserSuccessState(this.response);
}

class GetUserErrorState extends GetUserState {
  String errorMessage;
  GetUserErrorState(this.errorMessage);
}

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  ApiProvider provider = ApiProvider();
  GetUserBloc() : super(GetUserInitialState());

  @override
  Stream<GetUserState> mapEventToState(GetUserEvent event) async* {
    try {
      if(event is GetUserRefreshEvent) {
        yield GetUserLoadingState();
        var response = await provider.getUser(event.name);
        if(response?.status != null && response?.status == true){
          yield GetUserSuccessState(response?.data);
        }
        else {
          yield GetUserErrorState(response?.message??"");
        }
      }
    } catch(e, stacktrace) {
      print("$e : $stacktrace");
      yield GetUserErrorState(e.toString());
    }
  }

}