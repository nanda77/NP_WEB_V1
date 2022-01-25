import 'package:ninjapay/landingpage/views/components/header.dart';
import 'package:flutter/material.dart';

import 'components/SmallLandingSection2.dart';
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
          SmallLandingSection1(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            constraints: BoxConstraints(maxHeight: 320, minHeight: 200),
            margin: EdgeInsets.only(left: 100, right: 0, top: 0),
            // width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage("assets/images/f1.png"),
              ),
            ),
          ),
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
