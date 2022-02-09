import 'dart:ui';

import 'package:ninjapay/landingpage/views/components/url_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class SmallLandingSection6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      constraints: BoxConstraints(maxHeight: 850, minHeight: 700),
      margin: EdgeInsets.only(left: 20, right: 20, top: 50),
      // width: double.infinity,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     fit: BoxFit.fill,
      //     image: AssetImage("assets/images/bg3.png"),
      //   ),
      // ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            'assets/icons/t6.1.svg',
            height: 16,
            // width: 118,
          ),
          SizedBox(height: 100),
          Expanded(
            child: SvgPicture.asset(
              'assets/icons/s6.svg',
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 40),
                child: SvgPicture.asset(
                  'assets/icons/t6.svg',
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
        ],
      ),
    );
  }
}
