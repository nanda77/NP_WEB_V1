import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_buttons.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_loader.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_text_field.dart';
import 'package:ninjapay/payment_gateway/paywalls/bloc/create_paywall_bloc.dart';
import 'package:ninjapay/payment_gateway/paywalls/bloc/paywall_list_bloc.dart';

Widget createPaywallLink(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        color: kBgCardColor,
        border: Border.all(width: 1, color: darkCementColor)),
    child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create Paywall Link',
            style: boldTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: kGreyTextColor,
            height: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Redirect URL',
                      style: NormalTextStyle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    customTextField(
                      'www.youtube/xxxx.....',
                      controller: urlController,
                      validator: (val){
                        if(val!.trim().isEmpty){
                          return "Enter Url!";
                        }
                        else{
                          return null;
                        }
                      }
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price/View',
                      style: NormalTextStyle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    customTextField(
                        'Enter price',
                        controller: amountController,
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                        validator: (val){
                          if(val!.trim().isEmpty){
                            return "Enter Price!";
                          }
                          else{
                            return null;
                          }
                        }
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: NormalTextStyle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    customTextField(
                      'Enter title',
                      controller: titleController,
                      validator: (val){
                        if(val!.trim().isEmpty){
                          return "Enter Title!";
                        }
                        else{
                          return null;
                        }
                      }
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocListener<CreatePaywallBloc, CreatePaywallState>(
            listener: (context, deleteState) {
              if (deleteState is CreatePaywallLoadingState) {
                loaderDialog(context);
              }
              if (deleteState is CreatePaywallSuccessState) {
                amountController.clear();
                titleController.clear();
                urlController.clear();
                Navigator.pop(context);
                BlocProvider.of<PaywallListBloc>(context).add(PaywallListRefreshEvent());
              }
              if(deleteState is CreatePaywallErrorState){
                Navigator.pop(context);
                Fluttertoast.showToast(msg: deleteState.errorMessage);
              }
            },
            child: blackBorderButton(
              'CREATE',
              onTap: (){
                print("viek");
                if(_formKey.currentState!.validate()){
                  BlocProvider.of<CreatePaywallBloc>(context).add(CreatePaywallRefreshEvent(amount: int.parse(amountController.text), url: urlController.text, memo: titleController.text, desc: ""));
                }
              }
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    ),
  );
}
