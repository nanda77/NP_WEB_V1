import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_buttons.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_text_field.dart';

class AadharKycScreen extends StatefulWidget {
  const AadharKycScreen({Key? key}) : super(key: key);

  @override
  _AadharKycScreenState createState() => _AadharKycScreenState();
}

class _AadharKycScreenState extends State<AadharKycScreen> {
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

            Text("Address Proof", style: TextStyle(fontSize: 14, color: Colors.grey)),

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
                  Text("Aadhar", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey[600])),
                  SizedBox(height: 10),
                  simpleTextField(
                      "Enter aadhar number",
                      width: double.infinity,
                      controller: nameController
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: height*0.2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color: kGreyTextColor
                              )
                          ),
                          child: Center(child: Text("Upload aadhar\nfront", style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400))),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          height: height*0.2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color: kGreyTextColor
                              )
                          ),
                          child: Center(child: Text("Upload aadhar\nfront", style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400))),
                        ),
                      ),
                    ],
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
