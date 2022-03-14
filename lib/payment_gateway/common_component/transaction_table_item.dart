import 'package:flutter/material.dart';
import 'package:ninjapay/constants.dart';

Widget transactionTableItem(String text, double width,{int? maxLines}) {
  return Container(
    padding: tablePadding,
    child: Text(text, style: tabBarTextStyle, maxLines: maxLines??1),
    width: width,
  );
}
