import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ninjapay/constants.dart';

Widget yourLink() {
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
          'Your Payment Link',
          style: boldTextStyle,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'https://bit.ly/39uje4k32mke',
              style: tabBarTextStyle.copyWith(fontSize: 22),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  FlutterClipboard.copy("https://bit.ly/39uje4k32mke").then((value) {
                    Fluttertoast.showToast(msg: "Copied");
                  });
                },
                icon: SvgPicture.asset(
                  'assets/Icons/ic_copy.svg',
                )),
          ],
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
