import 'package:flutter/material.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/tipsmodule/widgets/button_with_icon.dart';
import 'package:ninjapay/tipsmodule/widgets/custom_textfieds.dart';

class EnterUpiTipPage extends StatefulWidget {
  const EnterUpiTipPage({Key? key}) : super(key: key);

  @override
  _EnterUpiTipPageState createState() => _EnterUpiTipPageState();
}

class _EnterUpiTipPageState extends State<EnterUpiTipPage> {
  TextEditingController noteController = TextEditingController();

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

          SizedBox(height: height*0.02),

          SizedBox(height: height*0.05),

          Container(
            width: width*0.25,
            child: Wrap(
              runSpacing: height*0.03,
              spacing: width*0.05,
              children: [
                ...[1,2,3,4,5,6].map((e) {
                  if(e==6){
                    return customIcon("assets/Icons/menu.png", "Custom");
                  }
                  return InkWell(
                    onTap: (){
                      setState(() {
                        noteController.text = e.toString();
                      });
                    },
                    child: icon("\$$e"),
                  );
                }).toList(),
              ],
            ),
          ),

          SizedBox(height: height*0.05),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Powered By", style: TextStyle(fontSize: 10, color: kGreyTextColor)),
              SizedBox(width: 5),
              Text("NINJAPAY", style: TextStyle(fontSize: 12, color: kGreyTextColor, decoration: TextDecoration.underline,))
            ],
          ),

          SizedBox(height: height*0.04),

          Container(
            height: 45,
            width: width*0.3,
            child: CustomTextField(
              noteController,
              hintText: "Add notes",
            ),
          ),

          SizedBox(height: height*0.02),

          SimpleButton("NEXT")

        ],
      ),
    );
  }

  icon(String label){
    bool color = false;
    Color colors = Colors.transparent;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // color: color ? Colors.grey.shade800 : null
        color: colors,
      ),
      child: Column(
        children: [
          Image.asset("assets/Icons/upi_ic.png", height: 40, width: 40),

          SizedBox(height: 10),

          Text(label, style: TextStyle(color: kBgWorksColor, /*fontWeight: FontWeight.bold,*/ fontSize: 16)),

          SizedBox(height: 15),
        ],
      ),
    );
  }

  customIcon(String icon, String label){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // color: Colors.grey.shade800
      ),
      child: Column(
        children: [
          Image.asset(icon, height: 40, width: 40),

          SizedBox(height: 10),

          Text(label, style: TextStyle(color: kBgWorksColor, /*fontWeight: FontWeight.bold,*/ fontSize: 16)),

          SizedBox(height: 15),
        ],
      ),
    );
  }
}
