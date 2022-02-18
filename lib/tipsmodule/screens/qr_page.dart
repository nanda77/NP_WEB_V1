import 'dart:async';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/tipsmodule/blocs/lightning_tip_bloc.dart';
import 'package:ninjapay/tipsmodule/blocs/transaction_status_bloc.dart';
import 'package:ninjapay/tipsmodule/screens/enter_upi_tip_page.dart';
import 'package:ninjapay/tipsmodule/screens/expire_page.dart';
import 'package:ninjapay/tipsmodule/screens/success_page.dart';
import 'package:ninjapay/tipsmodule/widgets/button_with_icon.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPage extends StatefulWidget {
  String transActionId;
  QRPage(this.transActionId);
  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  String status = "pending";
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
          apiTimer?.cancel();
          upiId = null;
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => ExpirePage()),
          );
          //redirect to payment cancelled screen
        }
      });
    });
    apiTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      BlocProvider.of<TransactionStatusBloc>(context).add(TransactionStatusRefreshEvent(widget.transActionId));
    });
  }

  @override
  void initState() {
    super.initState();
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

      body: BlocListener<TransactionStatusBloc, TransactionStatusState>(
        listener: (context, state){
          if(state is TransactionStatusLoadingState){
          }
          else if(state is TransactionStatusSuccessState){
            if(state.response?.data?.status == "success"){
              apiTimer?.cancel();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => SuccessPage()),
              );
            }
          }
          else if(state is TransactionStatusErrorState){
          }
        },
        child: BlocBuilder<LightningTipBloc, LightningTipState>(
            builder: (context, state){
              if(state is LightningTipSuccessState){
                upiId = state.response?.data?.lightningInvoicePayReq;
                print(state.response?.data?.toJson()??"");
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height*0.1),

                    Text("Please pay the below lightning\ninvoice to complete tipping ", style: TextStyle(fontSize: 27, color: kBlueTextColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),

                    SizedBox(height: height*0.04),

                    Text("Expires in $timerText", style: TextStyle(fontSize: 11, color: kGreyTextColor)),

                    SizedBox(height: height*0.02),

                    Container(
                      height: 220,
                      width: 220,
                      color: Colors.white,
                      child: QrImage(
                        data: upiId??"",
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

                    BorderButton("COPY INVOICE", onTap: (){
                      FlutterClipboard.copy(state.response?.data?.lightningInvoicePayReq??"").then((value) {
                        Fluttertoast.showToast(msg: "Copied");
                      });
                    }),

                    SizedBox(height: height*0.02),

                    BorderButton("OPEN WALLET"),
                  ],
                );
              }
              if(state is LightningTipErrorState){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height*0.1),

                    Text("Please pay the below lightning\ninvoice to complete tipping ", style: TextStyle(fontSize: 27, color: kBlueTextColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),

                    SizedBox(height: height*0.04),

                    Text("Expires in $timerText", style: TextStyle(fontSize: 11, color: kGreyTextColor)),

                    SizedBox(height: height*0.02),

                    Container(
                      height: 220,
                      width: 220,
                      color: Colors.white,
                      child: QrImage(
                        data: "Something went wrong!",
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

                    BorderButton("COPY INVOICE"),

                    SizedBox(height: height*0.02),

                    BorderButton("OPEN WALLET"),
                  ],
                );
              }
              if(state is LightningTipLoadingState){
                return Center(child: CircularProgressIndicator());
              }
              return Container();
            }
        ),
      )

    );
  }
}
