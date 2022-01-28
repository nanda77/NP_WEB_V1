import 'package:ninjapay/landingpage/views/components/header.dart';
import 'package:flutter/material.dart';
import 'package:ninjapay/landingpage/views/components/landing_section_5.dart';

import 'components/footer.dart';
import 'components/landing_section_1.dart';
import 'components/landing_section_2.dart';
import 'components/landing_section_3.dart';
import 'components/landing_section_4.dart';
import 'components/landing_section_6.dart';
import 'components/landing_section_7.dart';

const kDefaultPadding = 20.0;

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: kDefaultPadding * 1),
          Header(),
          LandingSection1(),
          SizedBox(height: kDefaultPadding * 2),
          LandingSection2(),
          SizedBox(height: kDefaultPadding * 2),
          LandingSection4(),
          SizedBox(height: kDefaultPadding * 2),
          LandingSection3(),
          SizedBox(height: kDefaultPadding * 2),
          LandingSection5(),
          SizedBox(height: kDefaultPadding * 2),
          LandingSection6(),
          SizedBox(height: kDefaultPadding * 2),
          LandingSection7(),
          SizedBox(height: kDefaultPadding * 8),
          Footer(),
        ],
      )),
    );
  }
}
