import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ninjapay/constants.dart';

Widget customTextField(String hint,
    {Icon? suffixIcon,
    TextInputFormatter? textInputFormatter,
    int? maxLength}) {
  return Container(
    width: 400,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        color: kBgCardColor,
        border: Border.all(width: 1.5, color: kGreyTextColor)),
    child: TextFormField(
      style: boldTextStyle,
      textAlignVertical: TextAlignVertical.center,
      maxLength: maxLength ?? 50,
      inputFormatters: [
        textInputFormatter ?? FilteringTextInputFormatter.singleLineFormatter
      ],
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          counterText: '',
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: InputBorder.none,
          hintText: hint,
          suffixIcon: suffixIcon ?? SizedBox(),
          hintStyle: boldTextStyle.copyWith(color: kTextSubColor)),
    ),
  );
}
