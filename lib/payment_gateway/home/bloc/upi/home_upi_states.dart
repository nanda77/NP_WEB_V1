import 'package:ninjapay/payment_gateway/home/model/home_upi_model.dart';

class HomeUpiStates {}

class HomeUpiInitialState extends HomeUpiStates {}

class HomeUpiLoadingState extends HomeUpiStates {}

class HomeUpiSuccessState extends HomeUpiStates {
  HomeUpiModel data;

  HomeUpiSuccessState(this.data);
}

class HomeUpiErrorState extends HomeUpiStates {
  String data;

  HomeUpiErrorState(this.data);
}
