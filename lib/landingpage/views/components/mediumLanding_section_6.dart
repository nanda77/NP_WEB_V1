import 'dart:ui';

import 'package:ninjapay/landingpage/views/components/url_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class MediumLandingSection6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      constraints: BoxConstraints(maxHeight: 600, minHeight: 300),
      margin: EdgeInsets.only(left: 60, right: 0, top: 70),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/icons/t6.1.svg',
            height: 16,
            // width: 118,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 42),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset(
                    'assets/icons/s6.svg',
                    width: screenSize.width / 3.4,
                  ),
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.only(left: screenSize.width / 8, top: 127),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/t6.svg',
                            width: screenSize.width / 2.7,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 40),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton.icon(
                                  icon: SvgPicture.asset(
                                      "assets/icons/learnmore.svg",
                                      height: 57),
                                  label: Text(""),
                                  onPressed: StoreUrls().playStoreURL,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
