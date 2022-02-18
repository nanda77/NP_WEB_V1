import 'package:flutter/material.dart';
import 'package:ninjapay/tipsmodule/widgets/button_with_icon.dart';
import 'package:ninjapay/tipsmodule/widgets/custom_textfieds.dart';

class CustomTipPage extends StatefulWidget {
  CustomTipPage({Key? key}) : super(key: key);

  @override
  State<CustomTipPage> createState() => _CustomTipPageState();
}

class _CustomTipPageState extends State<CustomTipPage> {
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  )),
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '@satoshinakamoto',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const Text(
              'Satoshi Nakamota',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 100, bottom: 4),
              child: Text(
                "\$0",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 4, bottom: 100),
              child: Text(
                "Enter Amount",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Powerd by  ',
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                      TextSpan(
                          text: 'NINJAPAY',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
            ),

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
        ));
  }
}