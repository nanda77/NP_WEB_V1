import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/tipsmodule/screens/expire_page.dart';
import 'package:ninjapay/tipsmodule/widgets/button_with_icon.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UpiQrPage extends StatefulWidget {
  String notes, name, upiId, tipPrice;
  UpiQrPage({this.notes="", this.name="", this.tipPrice="", this.upiId=""});

  @override
  _UpiQrPageState createState() => _UpiQrPageState();
}

class _UpiQrPageState extends State<UpiQrPage> {
  final interval = const Duration(seconds: 1);
  String? upiId;
  final int timerMaxSeconds = 600;

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
          upiId = null;
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => ExpirePage()),
          );
          //redirect to payment cancelled screen
        }
      });
    });
    /*apiTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      BlocProvider.of<TransactionStatusBloc>(context).add(TransactionStatusRefreshEvent(widget.transActionId));
    });*/
  }

  @override
  void initState() {
    super.initState();
    upiId = "upi://pay?pa=${widget.upiId.trim()}&pn=${widget.name.trim()}&am=${widget.tipPrice.trim()}&tn=${widget.notes.trim()}";
    startTimeout();
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
      backgroundColor: darkBackgroundColor,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height*0.1),

          Text("Please pay the below UPI Qr\ncode to complete tipping", style: TextStyle(fontSize: 27, color: kBlueTextColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),

          SizedBox(height: height*0.04),

          Text("Expires in $timerText", style: TextStyle(fontSize: 11, color: kGreyTextColor)),

          SizedBox(height: height*0.02),

          Container(
            height: 220,
            width: 220,
            color: Colors.white,
            child: QrImage(
              data: upiId??"Something went wrong!",
              version: QrVersions.auto,
              size: 200,
              gapless: false,
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
            ),
          ),

          SizedBox(height: height*0.02),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Powered By", style: TextStyle(fontSize: 10, color: kGreyTextColor)),
              SizedBox(width: 5),
              Text("NINJAPAY", style: TextStyle(fontSize: 12, color: kGreyTextColor, decoration: TextDecoration.underline,))
            ],
          ),

          SizedBox(height: height*0.04),

          BorderButton("OPEN WALLET"),

        ],
      ),
    );
  }
}
