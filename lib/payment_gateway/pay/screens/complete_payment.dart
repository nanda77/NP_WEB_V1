import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_buttons.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_loader.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_text_field.dart';
import 'package:ninjapay/payment_gateway/pay/bloc/complete_payment_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:xid/xid.dart';

class CompletePayment extends StatefulWidget {
  String? purpose, amount, emailOrPhone, userId, userName;
  CompletePayment({this.amount, this.emailOrPhone, this.purpose, this.userId, this.userName});

  @override
  _CompletePaymentState createState() => _CompletePaymentState();
}

class _CompletePaymentState extends State<CompletePayment> {
  TextEditingController utrController = TextEditingController();
  final interval = const Duration(seconds: 1);
  String? upiId;
  final int timerMaxSeconds = 30;
  var xid = Xid();
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  String? element, orderId;
  int currentSeconds = 0;
  Timer? countDownTimer;
  Timer? apiTimer;

  String get timerText => '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout() {
    var duration = interval;
    countDownTimer = Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {
          timer.cancel();
          apiTimer?.cancel();
          //redirect to payment cancelled screen
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    orderId = widget.userName?.substring(0, 2);
    element = "$orderId${DateTime.now().millisecondsSinceEpoch.toString().substring(0, 7)}${getRandomString(4)}";
    print("Random: $element");
    print("${DateTime.now().millisecondsSinceEpoch} $orderId");
    startTimeout();
    upiId = "upi://pay?pa=${widget.userId?.trim()}&pn=${widget.userName?.trim()}&am=${widget.amount?.trim()??""}&tn=${widget.purpose?.trim()??""}";
  }

  @override
  void dispose() {
    apiTimer?.cancel();
    countDownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBgLightColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            width: double.infinity,
            color: darkCementColor,
            child: SvgPicture.asset(
              'assets/images/img_ninja_pay_text.svg',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //img_profile.svg

          Text('Complete Your Payment', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),),

          Text('#$element / Amount - ₹${widget.amount}', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: kBlueColor),),

          Text('@${widget.userName}', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: kBlueColor),),

          SizedBox(height: height*0.05),

          Text("Expires in $timerText", style: TextStyle(fontSize: 11, color: kBlueColor)),

          Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.only(top: 10, bottom: 20),
            height: 300,
            width: 550,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text("Open PhonePe / GPay /..", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),),
                      SizedBox(height: 20),
                      Text("Scan the Qr code", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),),
                      SizedBox(height: 20),
                      Text("Complete the payment", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),),
                      SizedBox(height: 20),
                      Text("Enter 12 digit UTR ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    ],
                  )
                ),

                Expanded(
                  child: Column(
                    children: [
                      QrImage(
                        data: upiId??"something went wrong!",
                        version: QrVersions.auto,
                        size: 180,
                        gapless: false,
                        backgroundColor: Colors.white,
                        errorStateBuilder: (cxt, err) {
                          return Container(
                            child: Center(
                              child: Text(
                                "Uh oh! Something went wrong...",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  )
                )
              ],
            ),
          ),

          BlocListener<CompletePaymentBloc, CompletePaymentState>(
            listener: (context, state){
              if(state is CompletePaymentLoadingState){
                loaderDialog(context);
              }
              else if(state is CompletePaymentSuccessState){
                Navigator.pop(context);
                Fluttertoast.showToast(msg: state.response?.message??"");
                /*if(state.response?.data?.status == "success"){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SuccessPage()),
                  );
                }*/
              }
              else if(state is CompletePaymentErrorState){
                Navigator.pop(context);
                Fluttertoast.showToast(msg: state.errorMessage);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customTextField('Enter 12 digit UTR', width: 300, controller: utrController),
                SizedBox(width: 20),
                blueRoundButton('SUBMIT', width: 200, onTap: (){
                  print(xid);
                  BlocProvider.of<CompletePaymentBloc>(context).add(CompletePaymentRefreshEvent(
                    utr: utrController.text,
                    upi: widget.userId,
                    purpose: widget.purpose,
                    orderId: xid.toString(),
                    emailOrPhone: widget.emailOrPhone,
                    amount: widget.amount,
                    userName: widget.userName
                  ));
                })
              ],
            ),
          ),

        ],
      ),
    );
  }
}
