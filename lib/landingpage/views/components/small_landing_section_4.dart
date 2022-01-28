import 'dart:ui';

import 'package:ninjapay/landingpage/views/components/url_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class SmallLandingSection4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      constraints: BoxConstraints(maxHeight: 650, minHeight: 300),
      margin: EdgeInsets.only(left: 20, right: 20, top: 50),
      // width: double.infinity,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     fit: BoxFit.fill,
      //     image: AssetImage("assets/images/bg3.png"),
      //   ),
      // ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 40),
          Expanded(
            child: SvgPicture.asset(
              'assets/icons/s4.svg',
              width: screenSize.width / 1.5,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 40),
                  child: SvgPicture.asset(
                    'assets/icons/t4.svg',
                  ),
                ),
                Container(
                  child: TextButton.icon(
                    icon: SvgPicture.asset("assets/icons/download_store.svg",
                        height: 47),
                    label: Text(""),
                    onPressed: StoreUrls().playStoreURL,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
