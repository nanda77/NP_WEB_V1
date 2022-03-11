import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_text_field.dart';

import '../common_component/custom_buttons.dart';

class PayScreen extends StatefulWidget {
  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
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
          Column(
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
                        Text("@ninjatag",
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
              customTextField('', width: 400),
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
              customTextField('', width: 400),
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
              customTextField('', width: 400),
              const SizedBox(
                height: 40,
              ),
              blueRoundButton('NEXT', width: 400)
            ],
          )
        ],
      ),
    );
  }
}
