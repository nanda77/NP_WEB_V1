import 'package:flutter/material.dart';

import '../../constants.dart';

Widget blackBorderButton(String text) {
  return GestureDetector(
    onTap: (){},
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
