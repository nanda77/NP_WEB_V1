import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/home/bloc/upi/home_btc_bloc.dart';
import 'dart:html' as html;

Widget yourLink() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
      color: kBgSideMenuColor,
      border: Border.all(width: 1, color: darkCementColor)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Payment Link',
          style: boldTextStyle,
        ),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<HomeBtcBloc, HomeBtcState>(
          builder: (context, state){
            if(state is HomeBtcSuccessState){
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: (){
                      html.window.open(state.response?.upiPaylink??"","_blank");
                    },
                    child: Text(
                      state.response?.upiPaylink??"",
                      // 'https://bit.ly/39uje4k32mke',
                      style: tabBarTextStyle.copyWith(fontSize: 22),
                    ),
                  ),

                  const SizedBox(
                    width: 20,
                  ),

                  state.response?.upiPaylink == null || state.response!.upiPaylink!.isEmpty ? Container()
                  : IconButton(
                    onPressed: () {
                      FlutterClipboard.copy("https://bit.ly/39uje4k32mke").then((value) {
                        Fluttertoast.showToast(msg: "Copied");
                      });
                    },
                    icon: SvgPicture.asset(
                      'assets/Icons/ic_copy.svg',
                    )
                  ),
                ],
              );
            }
            else{
              return Container();
            }
          }
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'This is your payment link mapped to your merchant account. Share this link to your customers to receive online payments using UPI app',
          style: tabBarTextStyle,
        ),
      ],
    ),
  );
}
