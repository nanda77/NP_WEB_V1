import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_buttons.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_text_field.dart';

class VerifyKycScreen extends StatefulWidget {
  const VerifyKycScreen({Key? key}) : super(key: key);

  @override
  _VerifyKycScreenState createState() => _VerifyKycScreenState();
}

class _VerifyKycScreenState extends State<VerifyKycScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBgLightColor,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              width: double.infinity,
              color: darkCementColor,
              child: SvgPicture.asset(
                'assets/images/img_ninja_pay_text.svg',
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 50),
              child: Text("Verify KYC", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 27),),
            ),

            Text("ID Document", style: TextStyle(fontSize: 14, color: Colors.grey)),

            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(top: 40, bottom: 20, left: width*0.07, right: width*0.07),
              width: width*0.35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      width: 1,
                      color: kGreyTextColor
                  )
              ),
              child: Column(
                children: [
                  Text("PAN", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
                  SizedBox(height: 10),
                  simpleTextField(
                    "",
                    width: double.infinity,
                    controller: nameController
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: height*0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: kGreyTextColor
                      )
                    ),
                    child: Center(child: Text("Upload PAN front", style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400))),
                  ),
                  SizedBox(height: 30),
                  blueRoundButton(
                    "NEXT",
                    width: width*0.15,
                    onTap: (){}
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
