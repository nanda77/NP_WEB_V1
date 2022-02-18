import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ninjapay/constants.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController _controller = TextEditingController();
  String? hintText, labelText;
  int? maxLength;
  List<TextInputFormatter>? inputFormatters;
  String Function(String?)? validator;
  TextInputType? keyboardType;
  bool enabled;
  int maxLines;
  void Function(String)? onChanged;

  CustomTextField(this._controller, {
    Key? key,
    this.hintText,
    this.labelText,
    this.inputFormatters,
    this.maxLength,
    this.validator,
    this.keyboardType,
    this.enabled = true,
    this.maxLines = 1,
    this.onChanged
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      // inputFormatters: [
      //   FilteringTextInputFormatter.allow(RegExp('[0-9]')),
      // ],
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        enabled: widget.enabled,
        disabledBorder: OutlineInputBorder(
            // borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(35.0)
        ),
        labelText: widget.labelText,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        labelStyle: TextStyle(
          color: kBgWorksColor
        ),
        counterText: "",
        hintStyle: TextStyle(
          color: kGreyTextColor,
          fontSize: 12
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        fillColor: darkGreyTransColor,
        filled: true,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.0),
          // borderSide: const BorderSide(color: Colors.grey),
        ),
        //fillColor: Colors.green
      ),
      maxLines: widget.maxLines,
      validator: widget.validator,
      style: const TextStyle(
        fontFamily: "Poppins",
        color: kBgWorksColor
      ),
    );
  }
}
