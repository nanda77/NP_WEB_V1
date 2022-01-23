import 'dart:ui';

import 'package:ninjapay/landingpage/views/components/url_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class SmallLandingSection1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      constraints: BoxConstraints(maxHeight: 320, minHeight: 200),
      margin: EdgeInsets.only(left: 20, right: 0, top: 100, bottom: 0),
      // width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/images/f1.png"),
        ),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,

        children: [
          Expanded(
            // flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/t1.png',
                  // width: screenSize.width / 1.8,
                ),
                // Container(
                //   width: 450,
                //   constraints: BoxConstraints(maxWidth: 450),
                //   alignment: Alignment.bottomCenter,
                //   // margin: EdgeInsets.only(left: 0),
                //   // width: 496,
                //   child: Text(
                //     "Global",
                //     style: GoogleFonts.montserrat(
                //         fontSize: 42,
                //         fontWeight: FontWeight.bold,
                //         color: Color(0xFF282F3F).withOpacity(0.77)),
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                // Container(
                //   width: 450,
                //   constraints: BoxConstraints(maxWidth: 450),
                //   // alignment: Alignment.topCenter,
                //   margin: EdgeInsets.only(bottom: 40),
                //   // width: 496,
                //   child: Text(
                //     "Payments, \nfor the\nNextgen",
                //     style: GoogleFonts.montserrat(
                //         fontSize: 42,
                //         fontWeight: FontWeight.bold,
                //         color: Color(0xFF282F3F)),
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                Container(
                  // constraints: BoxConstraints(maxWidth: 450),
                  margin: EdgeInsets.only(left: 0, right: 0, top: 30),
                  // padding: EdgeInsets.all(4),
                  // margin: EdgeInsets.symmetric(horizontal: 20),
                  // decoration: BoxDecoration(
                  //     // color: Colors.white,
                  //     borderRadius: BorderRadius.circular(4),
                  //     boxShadow: [
                  //       BoxShadow(
                  //           color: Colors.black.withOpacity(0.1),
                  //           offset: Offset(0, 40),
                  //           blurRadius: 80)
                  //     ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
          // Image.asset(
          //   'assets/images/s1.png',
          // ),
        ],
      ),
    );
  }
}
