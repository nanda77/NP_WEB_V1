import 'package:flutter/material.dart';
import 'package:ninjapay/constants.dart';

Widget paywallLink() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        color: kBgSideMenuColor,
        border: Border.all(width: 1, color: darkCementColor)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Paywall Links',
          style: boldTextStyle,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '1 active link',
          style: tabBarTextStyle.copyWith(fontSize: 22),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Creates a paywall link for your content. You specify the amount, title and redirect URL and that's it.",
          style: tabBarTextStyle,
        ),
      ],
    ),
  );
}
