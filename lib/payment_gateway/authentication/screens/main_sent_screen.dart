import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/tipsmodule/widgets/button_with_icon.dart';

class MailSentScreen extends StatefulWidget {
  String email;
  MailSentScreen(this.email);

  @override
  _MailSentScreenState createState() => _MailSentScreenState();
}

class _MailSentScreenState extends State<MailSentScreen> {
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


            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(top: 30, bottom: 30, left: width*0.01, right: width*0.01),
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
                  Text("We sent you a magic link to your email \"${widget.email}\".\nClick on it to verify your email.", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: kGreyText), textAlign: TextAlign.center,),
                  SizedBox(height: 30),
                  Image.asset("assets/Icons/stripy.png", height: height*0.2, width: height*0.2, fit: BoxFit.fill),
                  SizedBox(height: 40),
                  BorderButton(
                    "OPEN MAIL APP",
                    onTap: (){

                    },
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
