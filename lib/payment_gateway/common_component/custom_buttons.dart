import 'package:flutter/material.dart';

import '../../constants.dart';

Widget blackBorderButton(String text,{Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      // width: 400,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          color: kBgCardColor,
          border: Border.all(width: 2, color: darkCementColor)),
      child: Text(
        text,
        style: boldTextStyle,
        // textAlign: TextAlignVertical.center,
      ),
    ),
  );
}

Widget blueRoundButton(String text, {double? width, GestureTapCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: width ?? 300,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          color: kBlueColor,),
          // border: Border.all(width: 40, color: darkCementColor)),
      child: Text(
        text,
        style: boldTextStyle.copyWith(color: kBgCardColor),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget paginationButton(String text) {
  return SizedBox(
    height: 25,
    width: 25,
    child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(color: Color(0XFF708598)),
        )),
  );
}
