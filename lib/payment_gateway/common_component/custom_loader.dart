import 'package:flutter/material.dart';

loaderDialog(BuildContext context){
  showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context){
      return Center(child: CircularProgressIndicator());
    }
  );
}