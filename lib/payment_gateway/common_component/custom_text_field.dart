import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ninjapay/constants.dart';

Widget customTextField(String hint,
    {Icon? suffixIcon,
    TextInputFormatter? textInputFormatter,
    int? maxLength,
    double? width,TextEditingController? controller, String? Function(String?)? validator, bool? enable}) {
  return Container(
    width: width ?? 300,
    child: TextFormField(
      enabled: enable,
      style: boldTextStyle,
      textAlignVertical: TextAlignVertical.center,
      maxLength: maxLength ?? 50,
      controller: controller,
      validator: validator,
      inputFormatters: [
        textInputFormatter ?? FilteringTextInputFormatter.singleLineFormatter
      ],
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          counterText: '',
          fillColor: kBgCardColor,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: kGreyTextColor
            ),
            borderRadius: BorderRadius.circular(5.0),
            // borderSide: const BorderSide(color: Colors.grey),
          ),
          hintText: hint,
          suffixIcon: suffixIcon ?? SizedBox(),
          hintStyle: boldTextStyle.copyWith(color: kTextSubColor)),
    ),
  );
}

Widget simpleTextField(String hint, {
    Icon? suffixIcon,
    TextInputFormatter? textInputFormatter,
    int? maxLength,
    double? width,
    TextEditingController? controller,
    String? Function(String?)? validator,
    Widget? prefix,
    Widget? prefixIcon,
    bool? enabled,
    void Function()? onTap
  }) {
  return Container(
    width: width ?? 300,
    child: TextFormField(
      onTap: onTap,
      style: boldTextStyle,
      textAlignVertical: TextAlignVertical.center,
      maxLength: maxLength ?? 50,
      controller: controller,
      validator: validator,
      enabled: enabled,
      inputFormatters: [
        textInputFormatter ?? FilteringTextInputFormatter.singleLineFormatter
      ],
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          prefix: prefix,
          prefixIcon: prefixIcon,
          counterText: '',
          fillColor: kBgWorksColor,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                color: kGreyTextColor
            ),
            borderRadius: BorderRadius.circular(2.0),
            // borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                color: kGreyTextColor
            ),
            borderRadius: BorderRadius.circular(2.0),
            // borderSide: const BorderSide(color: Colors.grey),
          ),
          hintText: hint,
          suffixIcon: suffixIcon ?? SizedBox(),
          hintStyle: boldTextStyle.copyWith(color: kTextSubColor)
      ),
    ),
  );
}
