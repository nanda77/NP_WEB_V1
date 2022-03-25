import 'package:flutter/material.dart';

loaderDialog(BuildContext context){
  showDialog(
    context: context,
    builder: (context){
      return Center(child: CircularProgressIndicator());
    }
  );
}