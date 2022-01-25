import 'dart:ui';

import 'package:ninjapay/landingpage/views/components/url_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class LandingSection3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      constraints: BoxConstraints(maxHeight: 620, minHeight: 500),
      margin: EdgeInsets.only(left: 100, right: 100, top: 50),
      // width: double.infinity,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     fit: BoxFit.fill,
      //     image: AssetImage("assets/images/bg3.png"),
      //   ),
      // ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/images/s2.png',
          ),
          Expanded(
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/t2.svg',
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      TextButton.icon(
                        icon: Image.asset("assets/images/play_store.png",
                            height: 57),
                        label: Text(""),
                        onPressed: StoreUrls().playStoreURL,
                      ),
                      TextButton.icon(
                        icon: Image.asset("assets/images/app_store.png",
                            height: 57),
                        label: Text(""),
                        onPressed: StoreUrls()
                            .appStoreURL, // https://apps.apple.com/in/app/ninjapay-manage-construction/id1547753533
                      ),
                    ],
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
