import 'package:flutter/material.dart';
import 'package:ninjapay/constants.dart';

Widget tableHeaderText(String text, double width) {
  return Container(
    padding: tablePadding,
    child: Text(text, style: NormalTextStyle, maxLines: 1),
    width: width,
  );
}
