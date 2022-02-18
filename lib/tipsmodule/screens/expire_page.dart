import 'package:flutter/material.dart';
import 'package:ninjapay/constants.dart';

class ExpirePage extends StatelessWidget {
  const ExpirePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,

      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(60)
            ),
            child: Icon(Icons.close, color: kBgWorksColor, size: 80)
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Expired...", style: TextStyle(color: kBgWorksColor)),
            ],
          ),
        ],
      ),
    );
  }
}
