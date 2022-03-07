import 'package:flutter/material.dart';
import 'package:ninjapay/constants.dart';

Widget paymentStatusCard(
    Color bgColor, Color titleColor, String title, String amount,
    {String? smallAMount}) {
  return Container(
    padding: const EdgeInsets.only(
        top: 15, left: 20, bottom: 15, right: 150),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        color: bgColor,
        border: Border.all(width: 1, color: darkCementColor)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: tabBarTextStyle.copyWith(color: titleColor),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          amount,
          style: tabBarTextStyle.copyWith(fontSize: 20),
        ),
/*
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "₹",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                amount,
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
*/
      ],
    ),
  );
}
