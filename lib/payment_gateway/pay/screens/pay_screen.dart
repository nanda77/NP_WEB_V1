import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_text_field.dart';
import 'package:ninjapay/payment_gateway/home/bloc/upi/home_upi_bloc.dart';
import 'package:ninjapay/payment_gateway/pay/bloc/single_link_id_details_bloc.dart';
import 'package:ninjapay/payment_gateway/pay/screens/complete_payment.dart';

import '../../common_component/custom_buttons.dart';

class PayScreen extends StatefulWidget {
  String? purpose, amount;
  PayScreen({this.purpose, this.amount});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  String? baseUrl;
  final _formKey = GlobalKey<FormState>();
  var list = ['a','b','c','d'];
  final _random = new Random();
  String? element;
  TextEditingController purposeController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController emailOrPhoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    baseUrl = Uri.base.toString();
    print(baseUrl);
    print("vivek : ${baseUrl!.split(" ? ").last}");
    if(baseUrl!.split("?").last.isNotEmpty){
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        BlocProvider.of<HomeUpiBloc>(context).add(GetHomeUpiDataEvent());
        BlocProvider.of<SingleLinkIdDetailBloc>(context).add(SingleLinkIdDetailRefreshEvent(baseUrl!.split("?").last));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          BlocBuilder<HomeUpiBloc, HomeUpiStates>(
              builder: (context, state){
                if (state is HomeUpiLoadingState) {
                  return Text('loading');
                } else if (state is HomeUpiSuccessState) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 400,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 1, color: kBlueColor),
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/img_profile.svg',
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Paying to", style: blueTextStyle),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("@${state.data.data?.merchantDetails?.username??""}",
                                      style: TextStyle(
                                          fontSize: 16, color: darkBackgroundColor))
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Purpose',
                          style: blueTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        BlocBuilder<SingleLinkIdDetailBloc, SingleLinkIdDetailState>(
                            builder: (context, linkState){
                              if(linkState is SingleLinkIdDetailSuccessState){
                                purposeController.text = linkState.response?.data?.purpose??"";
                                amountController.text = linkState.response?.data?.amount.toString()??"";
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customTextField(
                                        '',
                                        width: 400,
                                        enable: false,
                                        controller: purposeController,
                                        validator: (text){
                                          if(text!.trim().isEmpty){
                                            return "";
                                          }
                                          else{
                                            return null;
                                          }
                                        }
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Amount',
                                      style: blueTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    customTextField(
                                        '',
                                        width: 400,
                                        enable: false,
                                        controller: amountController,
                                        validator: (text){
                                          if(text!.trim().isEmpty){
                                            return "";
                                          }
                                          else{
                                            return null;
                                          }
                                        }
                                    ),
                                  ],
                                );
                              }
                              else{
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customTextField(
                                        '',
                                        width: 400,
                                        controller: purposeController,
                                        validator: (text){
                                          if(text!.trim().isEmpty){
                                            return "";
                                          }
                                          else{
                                            return null;
                                          }
                                        }
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Amount',
                                      style: blueTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    customTextField(
                                        '',
                                        width: 400,
                                        controller: amountController,
                                        validator: (text){
                                          if(text!.trim().isEmpty){
                                            return "";
                                          }
                                          else{
                                            return null;
                                          }
                                        }
                                    ),
                                  ],
                                );
                              }
                            }
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Email or Phone',
                          style: blueTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        customTextField(
                            '',
                            width: 400,
                            controller: emailOrPhoneController,
                            validator: (text){
                              if(text!.trim().isEmpty){
                                return "";
                              }
                              else{
                                return null;
                              }
                            }
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        blueRoundButton('NEXT', width: 400, onTap: (){
                          if(_formKey.currentState!.validate()){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CompletePayment(purpose: purposeController.text, amount: amountController.text, emailOrPhone: emailOrPhoneController.text, userId: state.data.data?.merchantDetails?.upi??"", userName: state.data.data?.merchantDetails?.username??"",)),
                            );
                          }
                        })
                      ],
                    ),
                  );
                } else if (state is HomeUpiErrorState) {
                  return Text(state.data);
                } else {
                  return Text('else');
                }
              }
          ),

        ],
      ),
    );
  }
}
