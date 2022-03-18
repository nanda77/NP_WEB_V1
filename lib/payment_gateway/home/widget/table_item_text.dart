import 'package:flutter/material.dart';
import 'package:ninjapay/constants.dart';

Widget tableItemText(String text, double width) {
  return Container(
    padding: tablePadding,
    child: Text(text, style: tabBarTextStyle, maxLines: 1),
    width: width,
  );
}
