import 'dart:ui';

import 'package:layout/layout.dart';
import 'package:ninjapay/landingpage/views/components/url_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class LandingSection7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      constraints: BoxConstraints(maxHeight: 940, minHeight: 500),
      margin: EdgeInsets.only(left: 140, right: 100, top: 150),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 77),
                child: SvgPicture.asset(
                  'assets/icons/t7.svg',
                  width: screenSize.width / 4,
                  // width: 118,
                ),
              ),
              SvgPicture.asset(
                'assets/icons/b_tools.svg',
                width: screenSize.width / 1.2,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton.icon(
                icon:
                    SvgPicture.asset("assets/icons/learnmore.svg", height: 57),
                label: Text(""),
                onPressed: StoreUrls().playStoreURL,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
