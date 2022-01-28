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
import 'components/mediumLanding_section_1.dart';
import 'components/mediumLanding_section_2.dart';
import 'components/mediumLanding_section_3.dart';
import 'components/mediumLanding_section_4.dart';
import 'components/mediumLanding_section_5.dart';
import 'components/mediumLanding_section_6.dart';
import 'components/mediumLanding_section_7.dart';
import 'components/medium_header.dart';
import 'components/small_footer.dart';

const kDefaultPadding = 20.0;

class MediumLandingPage extends StatelessWidget {
  const MediumLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: kDefaultPadding * 1),
          MediumHeader(),
          MediumLandingSection1(),
          SizedBox(height: kDefaultPadding * 1),
          MediumLandingSection2(),
          SizedBox(height: kDefaultPadding * 1),
          MediumLandingSection4(),
          SizedBox(height: kDefaultPadding * 1),
          MediumLandingSection3(),
          SizedBox(height: kDefaultPadding * 1),
          MediumLandingSection5(),
          SizedBox(height: kDefaultPadding * 1),
          MediumLandingSection6(),
          SizedBox(height: kDefaultPadding * 1),
          MediumLandingSection7(),
          SizedBox(height: kDefaultPadding * 8),
          Footer(),
        ],
      )),
    );
  }
}
