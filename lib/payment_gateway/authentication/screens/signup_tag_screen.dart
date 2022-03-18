import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_buttons.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_text_field.dart';

class SignUpTagScreen extends StatefulWidget {
  const SignUpTagScreen({Key? key}) : super(key: key);

  @override
  _SignUpTagScreenState createState() => _SignUpTagScreenState();
}

class _SignUpTagScreenState extends State<SignUpTagScreen> {
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
            const SizedBox(
              height: 20,
            ),
            //img_profile.svg

            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 50),
              child: Text("SignUp", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 27),),
            ),

            Text("Your unique name for getting paid by anyone", style: TextStyle(fontSize: 14, color: Colors.grey)),

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
                  Text("Create Ninjatag", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  SizedBox(height: 10),

                  simpleTextField(
                    "",
                    width: double.infinity,
                  ),

                  SizedBox(height: height*0.2),

                  blueRoundButton("DONE", width: width*0.15)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
