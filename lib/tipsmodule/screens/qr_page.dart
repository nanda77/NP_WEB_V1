import 'package:flutter/material.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/tipsmodule/widgets/button_with_icon.dart';

class QRPage extends StatefulWidget {
  const QRPage({Key? key}) : super(key: key);

  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: darkBackgroundColor,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height*0.1),

          Text("Please pay the below lightning\ninvoice to complete tipping ", style: TextStyle(fontSize: 14, color: kGreyTextColor, fontWeight: FontWeight.bold)),

          SizedBox(height: height*0.04),

          Text("Expires in 9:47", style: TextStyle(fontSize: 11, color: kGreyTextColor)),

          SizedBox(height: height*0.02),

          Image.asset("assets/Icons/qr.png", height: 200, width: 200),

          SizedBox(height: height*0.02),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Powered By", style: TextStyle(fontSize: 10, color: kGreyTextColor)),
              SizedBox(width: 5),
              Text("NINJAPAY", style: TextStyle(fontSize: 12, color: kGreyTextColor, decoration: TextDecoration.underline,))
            ],
          ),

          SizedBox(height: height*0.04),

          BorderButton("COPY INVOICE"),

          SizedBox(height: height*0.02),

          BorderButton("OPEN WALLET"),
        ],
      ),
    );
  }
}
