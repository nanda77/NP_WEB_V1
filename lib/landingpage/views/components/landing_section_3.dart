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
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/bg3.png"),
        ),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/images/s3.png',
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  margin:
                      EdgeInsets.only(left: 50, right: 70, bottom: 20, top: 70),
                  child: Text(
                    "Save upto 42% in project costs",
                    style: GoogleFonts.montserrat(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF282F3F)),
                  ),
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
          // Container(
          //   constraints: BoxConstraints(maxHeight: 750, minHeight: 500),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     // mainAxisSize: MainAxisSize.max,
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Image.asset(
          //         'assets/images/s1.png',
          //         // width: 1000.0,
          //         // height: 730.0,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),

      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   mainAxisSize: MainAxisSize.max,
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Image.asset(
      //       "assets/images/s1.png",
      //       width: 1331,
      //       height: 750,
      //     ),
      //   ],
      // ),
    );
  }
}
