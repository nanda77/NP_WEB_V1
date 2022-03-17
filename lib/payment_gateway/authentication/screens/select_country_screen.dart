import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninjapay/constants.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  _SelectCountryScreenState createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
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
              child: Text("Login/SignUp", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 27),),
            ),

            Container(
              padding: EdgeInsets.only(top: 40, bottom: height*0.3),
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
                  Text("Select Country", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  SizedBox(height: 10),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
