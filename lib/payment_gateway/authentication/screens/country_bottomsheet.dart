import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:ninjapay/app_utils.dart';
import 'package:ninjapay/constants.dart';

countryBottomSheet(BuildContext context, {Function()? onClosed}) {
  return showCountryPicker(
    context: context,
    countryListTheme: CountryListThemeData(
      textStyle: TextStyle(
        fontFamily: 'MontserratReg',
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      inputDecoration: InputDecoration(
        constraints: const BoxConstraints(
          maxHeight: 40,
        ),
        focusColor: darkCementColor,
        fillColor: darkCementColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: darkCementColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: darkCementColor, width: 1),
        ),
        hintStyle: TextStyle(
          fontFamily: 'MontserratReg',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: darkCementColor,
        ),
        hintText: 'Search country',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: darkCementColor, width: 1),
        ),
      ),
    ),
    onSelect: (Country country) {
      AppUtils appUtils = AppUtils();
      appUtils.setCountry(country.name);
      appUtils.setCountryCode(country.countryCode);
      appUtils.setPhoneCode(country.phoneCode);
    },
    onClosed: onClosed,
  );
}
