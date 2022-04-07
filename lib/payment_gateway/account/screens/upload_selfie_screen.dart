import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_buttons.dart';

class UploadSelfieScreen extends StatefulWidget {
  const UploadSelfieScreen({Key? key}) : super(key: key);

  @override
  _UploadSelfieScreenState createState() => _UploadSelfieScreenState();
}

class _UploadSelfieScreenState extends State<UploadSelfieScreen> {
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

            Text("Upload Selfie", style: TextStyle(fontSize: 14, color: Colors.grey)),

            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: width*0.07),
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
                  SizedBox(height: height*0.08),
                  Container(
                    height: height*0.25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 1,
                            color: kGreyTextColor
                        )
                    ),
                    child: Center(child: Text("Open camera", style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400))),
                  ),
                  SizedBox(height: height*0.08),
                  blueRoundButton(
                    "SUBMIT",
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
