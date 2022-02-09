import 'package:ninjapay/landingpage/views/components/header.dart';
import 'package:flutter/material.dart';
import 'package:ninjapay/landingpage/views/components/small_landing_section_2.dart';
import 'package:ninjapay/landingpage/views/components/small_landing_section_4.dart';
import 'package:ninjapay/landingpage/views/components/small_landing_section_5.dart';
import 'package:ninjapay/landingpage/views/components/small_landing_section_6.dart';
import 'package:ninjapay/landingpage/views/components/small_landing_section_7.dart';

import 'components/footer.dart';
import 'components/landing_section_1.dart';
import 'components/landing_section_2';
import 'components/landing_section_3';
import 'components/small_footer.dart';
import 'components/small_header.dart';
import 'components/small_landing_section_1.dart';
import 'components/small_landing_section_3.dart';

const kDefaultPadding = 20.0;

class SmallLandingPage extends StatelessWidget {
  const SmallLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: kDefaultPadding * 1),
          SmallHeader(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            constraints: BoxConstraints(maxHeight: 420, minHeight: 200),
            margin: EdgeInsets.only(left: 0, right: 0, top: 100),
            // width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/hero.png"),
              ),
            ),
          ),
          SmallLandingSection1(),
          // SizedBox(height: kDefaultPadding / 2),
          SmallLandingSection2(),
          // SizedBox(height: kDefaultPadding / 3),
          SmallLandingSection3(),
          // SizedBox(height: kDefaultPadding / 3),
          SmallLandingSection4(),
          // SizedBox(height: kDefaultPadding / 3),
          SmallLandingSection5(),
          SizedBox(height: kDefaultPadding * 2),
          SmallLandingSection6(),
          // SizedBox(height: kDefaultPadding / 3),
          SmallLandingSection7(),
          SizedBox(height: kDefaultPadding * 2),
          SmallFooter(),
        ],
      )),
    );
  }
}
