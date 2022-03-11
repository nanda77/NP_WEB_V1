import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_buttons.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_text_field.dart';

Widget createPaywallLink() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        color: kBgCardColor,
        border: Border.all(width: 1, color: darkCementColor)),
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
                  customTextField('www.youtube/xxxx.....')
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
                  customTextField('Enter price',
                      textInputFormatter: FilteringTextInputFormatter.digitsOnly),
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
                  customTextField('Enter title'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        blackBorderButton('CREATE'),
        const SizedBox(
          height: 40,
        ),
      ],
    ),
  );
}
