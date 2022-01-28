import 'dart:ui';

import 'package:ninjapay/landingpage/views/components/url_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class LandingSection4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      constraints: BoxConstraints(maxHeight: 740, minHeight: 500),
      margin: EdgeInsets.only(left: 100, right: 100, top: 0),
      // width: double.infinity,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     fit: BoxFit.fill,
      //     image: AssetImage("assets/images/bg3.png"),
      //   ),
      // ),

      child: Expanded(
        child: Container(
          // margin: EdgeInsets.only(top: 142),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.string(
                'assets/icons/s4.svg',
                width: screenSize.width / 2.5,
              ),
              Expanded(
                child: Container(
                  margin:
                      EdgeInsets.only(left: screenSize.width / 12, top: 307),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.string(
                        'assets/icons/t4.svg',
                        width: screenSize.width / 2.5,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton.icon(
                              icon: SvgPicture.asset(
                                  "assets/icons/download_store.svg",
                                  height: 57),
                              label: Text(""),
                              onPressed: StoreUrls().playStoreURL,
                            ),
                            // TextButton.icon(
                            //   icon: SvgPicture.asset(
                            //       "assets/icons/girl_shopping.svg",
                            //       height: 200),
                            //   label: Text(""),
                            //   onPressed: StoreUrls()
                            //       .appStoreURL, // https://apps.apple.com/in/app/ninjapay-manage-construction/id1547753533
                            // ),
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
    );
  }
}
