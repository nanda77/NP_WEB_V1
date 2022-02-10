import 'package:flutter/material.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/tipsmodule/widgets/button_with_icon.dart';

class TipsLeadPage extends StatefulWidget {
  const TipsLeadPage({Key? key}) : super(key: key);

  @override
  _TipsLeadPageState createState() => _TipsLeadPageState();
}

class _TipsLeadPageState extends State<TipsLeadPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: darkBackgroundColor,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: height*0.1),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: darkBackgroundColor,
              border: Border.all(
                color: kGreyTextColor,
                width: 2,
              )
            ),
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),

          SizedBox(height: height*0.02),

          Text("@satoshinakamoto", style: TextStyle(fontSize: 14, color: kGreyTextColor, fontWeight: FontWeight.bold)),

          SizedBox(height: height*0.02),

          Text("Satoshi Nakamoto", style: TextStyle(fontSize: 10, color: kGreyTextColor)),

          SizedBox(height: height*0.12),

          ButtonWithIcon("Tips using BTC", "assets/Icons/bt_ic.png"),

          SizedBox(height: height*0.04),

          ButtonWithIcon("Tips using BTC", "assets/Icons/upi_ic.png"),

          SizedBox(height: height*0.02),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Powered By", style: TextStyle(fontSize: 10, color: kGreyTextColor)),
              SizedBox(width: 5),
              Text("NINJAPAY", style: TextStyle(fontSize: 12, color: kGreyTextColor, decoration: TextDecoration.underline,))
            ],
          ),
        ],
      ),
    );
  }
}
