import 'package:ninjapay/landingpage/views/components/header.dart';
import 'package:flutter/material.dart';

import 'components/footer.dart';
import 'components/landing_section_1.dart';
import 'components/landing_section_2';
import 'components/landing_section_3';

const kDefaultPadding = 20.0;

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: kDefaultPadding * 1),
          Header(),
          LandingSection1(),
          SizedBox(height: kDefaultPadding * 2),
          LandingSection2(),
          SizedBox(height: kDefaultPadding * 2),
          LandingSection3(),
          SizedBox(height: kDefaultPadding / 2),
          Footer(),
        ],
      )),
    );
  }
}
