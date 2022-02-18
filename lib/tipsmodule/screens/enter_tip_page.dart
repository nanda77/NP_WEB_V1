import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/tipsmodule/blocs/exchange_rate_bloc.dart';
import 'package:ninjapay/tipsmodule/blocs/get_user_bloc.dart';
import 'package:ninjapay/tipsmodule/blocs/lightning_tip_bloc.dart';
import 'package:ninjapay/tipsmodule/screens/qr_page.dart';
import 'package:ninjapay/tipsmodule/widgets/app_progress_indicator.dart';
import 'package:ninjapay/tipsmodule/widgets/button_with_icon.dart';
import 'package:ninjapay/tipsmodule/widgets/custom_textfieds.dart';

class EnterTipPage extends StatefulWidget {
  const EnterTipPage({Key? key}) : super(key: key);

  @override
  _EnterTipPageState createState() => _EnterTipPageState();
}

class _EnterTipPageState extends State<EnterTipPage> {
  TextEditingController noteController = TextEditingController();
  Color colorChange = Colors.transparent;
  int? index;
  double? btcValue;
  Map<String, dynamic>? data;
  int fiatValue = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<ExchangeRateBloc>(context).add(ExchangeRateRefreshEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocBuilder<GetUserBloc, GetUserState>(
          builder: (context, state){
            if(state is GetUserSuccessState){
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: height*0.1),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: darkBackgroundColor,
                          border: Border.all(
                            color: kGreyTextColor,
                            width: 2,
                          )
                      ),
                      child: Icon(Icons.person, size: 60, color: Colors.white),
                    ),

                    SizedBox(height: height*0.02),

                    Text(state.response?.username??"", style: TextStyle(fontSize: 14, color: kGreyTextColor, fontWeight: FontWeight.bold)),

                    SizedBox(height: height*0.02),

                    Text(state.response?.fullName??"", style: TextStyle(fontSize: 10, color: kGreyTextColor)),

                    SizedBox(height: height*0.02),

                    SizedBox(height: height*0.05),

                    BlocBuilder<ExchangeRateBloc, ExchangeRateState>(
                        builder: (context, exchangeState){
                          if(exchangeState is ExchangeRateSuccessState){
                            (exchangeState.response?.data?.data??{}).forEach((key, value){
                              if(key == "BTCUSD"){
                                data = value;
                              }
                            });

                            return BlocBuilder<GetUserBloc, GetUserState>(
                                builder: (context, state){
                                  if(state is GetUserSuccessState){
                                    return Container(
                                      width: width*0.3,
                                      child: Wrap(
                                        runSpacing: height*0.03,
                                        spacing: width*0.06,
                                        children: [
                                          ...list.map((e) {
                                            if(e.id == 6){
                                              return InkWell(
                                                onTap: (){
                                                  setState(() {
                                                    index = e.id;
                                                  });
                                                },
                                                child: customIcon("assets/Icons/menu.png", "Custom", color: index != null && index == e.id ? Colors.grey.shade800 : Colors.transparent),
                                              );
                                            }
                                            return InkWell(
                                              onTap: (){
                                                btcValue = double.parse(((e.value)*(data?['BTC']??0.0)).toStringAsFixed(8));
                                                setState(() {
                                                  fiatValue = e.value;
                                                  index = e.id;
                                                  print(fiatValue);
                                                });
                                              },
                                              child: icon(e.value, data?['BTC']??0.0, color: index != null && index == e.id ? Colors.grey.shade800 : Colors.transparent),
                                            );
                                          }).toList(),
                                        ],
                                      ),
                                    );
                                  }
                                  if(state is GetUserErrorState){
                                    return Container(
                                      width: width*0.25,
                                      child: Wrap(
                                        runSpacing: height*0.03,
                                        spacing: width*0.05,
                                        children: [
                                          ...[1,2,3,4,5,6].map((e) {
                                            if(e==6){
                                              return customIcon("assets/Icons/menu.png", "Custom");
                                            }
                                            return icon(0, 0.0);
                                          }).toList(),
                                        ],
                                      ),
                                    );
                                  }
                                  if(state is GetUserLoadingState){
                                    return Center(child: CircularProgressIndicator());
                                  }
                                  return Container();
                                }
                            );
                          }
                          if(exchangeState is ExchangeRateErrorState){
                            return Container(
                              width: width*0.25,
                              child: Wrap(
                                runSpacing: height*0.03,
                                spacing: width*0.05,
                                children: [
                                  ...[1,2,3,4,5,6].map((e) {
                                    if(e==6){
                                      return customIcon("assets/Icons/menu.png", "Custom");
                                    }
                                    return icon(0, 0.0);
                                  }).toList(),
                                ],
                              ),
                            );
                          }
                          if(exchangeState is ExchangeRateLoadingState){
                            return Center(child: CircularProgressIndicator());
                          }
                          return Container();
                        }
                    ),

                    SizedBox(height: height*0.05),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Powered By", style: TextStyle(fontSize: 10, color: kGreyTextColor)),
                        SizedBox(width: 5),
                        Text("NINJAPAY", style: TextStyle(fontSize: 12, color: kGreyTextColor, decoration: TextDecoration.underline,))
                      ],
                    ),

                    SizedBox(height: height*0.04),

                    Container(
                      height: 45,
                      width: width*0.3,
                      child: CustomTextField(
                        noteController,
                        hintText: "Add notes",
                      ),
                    ),

                    SizedBox(height: height*0.02),

                    BlocListener<LightningTipBloc, LightningTipState>(
                      listener: (context, state){
                        if(state is LightningTipLoadingState){
                          showDialogLoader(context);
                        }
                        else if(state is LightningTipSuccessState){
                          print(state.response?.data?.toJson()??"");
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => QRPage(state.response?.data?.transactionId??"")),
                          );
                        }
                        else if(state is LightningTipErrorState){
                          Navigator.pop(context);
                        }

                      },
                      child: InkWell(
                        onTap: (){
                          if(data == null){
                            Fluttertoast.showToast(msg: "Select btc value!");
                          }
                          else{
                            String notes = noteController.text.trim().isEmpty ? "Tip" : "Tip: ${noteController.text}";
                            BlocProvider.of<LightningTipBloc>(context).add(LightningTipRefreshEvent(notes: notes, tip: btcValue??0.0, btcPrice: data?['USD']??0.0, fiatvalue: fiatValue));
                          }
                        },
                        child: SimpleButton("NEXT"),
                      ),
                    ),

                  ],
                ),
              );
            }
            if(state is GetUserErrorState){
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: height*0.1),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: darkBackgroundColor,
                          border: Border.all(
                            color: kGreyTextColor,
                            width: 2,
                          )
                      ),
                      child: Icon(Icons.person, size: 60, color: Colors.white),
                    ),

                    SizedBox(height: height*0.02),

                    Text("@satoshinakamoto", style: TextStyle(fontSize: 14, color: kGreyTextColor, fontWeight: FontWeight.bold)),

                    SizedBox(height: height*0.02),

                    Text("Satoshi Nakamoto", style: TextStyle(fontSize: 10, color: kGreyTextColor)),

                    SizedBox(height: height*0.02),

                    SizedBox(height: height*0.05),

                    Container(
                      width: width*0.25,
                      child: Wrap(
                        runSpacing: height*0.03,
                        spacing: width*0.05,
                        children: [
                          ...[1,2,3,4,5,6].map((e) {
                            if(e==6){
                              return customIcon("assets/Icons/menu.png", "Custom");
                            }
                            return icon(0, 0.0);
                          }).toList(),
                        ],
                      ),
                    ),

                    SizedBox(height: height*0.05),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Powered By", style: TextStyle(fontSize: 10, color: kGreyTextColor)),
                        SizedBox(width: 5),
                        Text("NINJAPAY", style: TextStyle(fontSize: 12, color: kGreyTextColor, decoration: TextDecoration.underline,))
                      ],
                    ),

                    SizedBox(height: height*0.04),

                    Container(
                      height: 45,
                      width: width*0.3,
                      child: CustomTextField(
                        noteController,
                        hintText: "Add notes",
                      ),
                    ),

                    SizedBox(height: height*0.02),

                    SimpleButton("NEXT")

                  ],
                ),
              );
            }
            if(state is GetUserLoadingState){
              return Center(child: CircularProgressIndicator());
            }
            return Container();
          }
      )
    );
  }

  icon(int label, double btcValue, {Color color = Colors.transparent}){
    double btc = btcValue*label;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // color: color ? Colors.grey.shade800 : null
        color: color,
      ),
      child: Column(
        children: [
          Image.asset("assets/Icons/bt_ic.png", height: 40, width: 40),

          SizedBox(height: 5),

          Text("\$${label.toString()}", style: TextStyle(color: kBgWorksColor, /*fontWeight: FontWeight.bold,*/ fontSize: 17)),

          SizedBox(height: 5),

          Text("${double.parse(btc.toStringAsFixed(8))}", style: TextStyle(fontSize: 10, color: kGreyTextColor))
        ],
      ),
    );
  }

  customIcon(String icon, String label, {Color color = Colors.transparent}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color
      ),
      child: Column(
        children: [
          Image.asset(icon, height: 40, width: 40),

          SizedBox(height: 10),

          Text(label, style: TextStyle(color: kBgWorksColor, /*fontWeight: FontWeight.bold,*/ fontSize: 16)),

          SizedBox(height: 15),
        ],
      ),
    );
  }

  List<Tip> list = [
    Tip(1, 1),
    Tip(2, 2),
    Tip(3, 5),
    Tip(4, 7),
    Tip(5, 10),
    Tip(6, 0)
  ];
}

class Tip{
  int id;
  int value;
  Tip(this.id, this.value);
}