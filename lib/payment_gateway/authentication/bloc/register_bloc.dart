import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/api_provider.dart';
import 'package:ninjapay/app_utils.dart';
import 'package:ninjapay/payment_gateway/pay/model/common_model.dart';
import 'package:ninjapay/tipsmodule/models/user_name_model.dart';

class RegisterEvent {}

class RegisterRefreshEvent extends RegisterEvent {
  String name;
  RegisterRefreshEvent(this.name);
}

class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  CommonModel? response;
  RegisterSuccessState(this.response);
}

class RegisterErrorState extends RegisterState {
  String errorMessage;
  RegisterErrorState(this.errorMessage);
}

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  ApiProvider provider = ApiProvider();
  RegisterBloc() : super(RegisterInitialState());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    try {
      if(event is RegisterRefreshEvent) {
        yield RegisterLoadingState();
        // TODO send data in register function
        AppUtils appUtils = AppUtils();
        String? country, email, phoneNumber, userName, fcm, uid;
        userName = event.name;
        await appUtils.getFirebaseUId().then((value) {
          uid = value;
        });
        await appUtils.getUserEmail().then((value) {
          email = value;
        });
        await appUtils.getUserNumber().then((value) {
          phoneNumber = value;
        });
        await appUtils.getFCMToken().then((value) {
          fcm = value;
        });
        await appUtils.getCountry().then((value) {
          country = value;
        });

        var response = await provider.register(userName: userName, uid: uid, country: country, email: email, fcm: fcm, phone: phoneNumber);
        if(response?.status != null && response?.status == true){
          yield RegisterSuccessState(response);
        }
        else {
          yield RegisterErrorState(response?.message??"");
        }
      }
    } catch(e, stacktrace) {
      print("$e : $stacktrace");
      yield RegisterErrorState(e.toString());
    }
  }

}