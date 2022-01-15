import 'package:ninjapay/landingpage/views/components/header.dart';
import 'package:flutter/material.dart';

import 'components/SmallLandingSection2.dart';
import 'components/footer.dart';
import 'components/landing_section_1.dart';
import 'components/landing_section_2.dart';
import 'components/landing_section_3.dart';
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: kDefaultPadding * 1),
          SmallHeader(),
          SmallLandingSection1(),
          // SizedBox(height: kDefaultPadding / 2),
          SmallLandingSection2(),
          SizedBox(height: kDefaultPadding / 2),
          SmallLandingSection3(),
          SizedBox(height: kDefaultPadding / 2),
          SmallFooter(),
        ],
      )),
    );
  }
}
