import 'dart:ui';

import 'package:ninjapay/landingpage/views/components/url_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ninjapay/landingpage/views/utils/gradient_text.dart';

import '../../../constants.dart';

class LandingSection5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      constraints: BoxConstraints(maxHeight: 1000, minHeight: 400),
      margin: EdgeInsets.only(left: 140, right: 0, top: 70),
      // width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/images/f5.png"),
        ),
      ),

      child: Container(
        margin: EdgeInsets.only(top: 270),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(
              'assets/icons/t5.svg',
              width: screenSize.width / 3,
            ),
            // Container(
            //   alignment: Alignment.topLeft,
            //   margin: EdgeInsets.only(left: 75, bottom: 70),
            //   // width: 496,
            //   // child: Text(
            //   //   "Global\nPayments\nfor the Nextgen",
            //   //   style: GoogleFonts.montserrat(
            //   //       fontSize: 67,
            //   //       fontWeight: FontWeight.w900,
            //   //       color: Color(0xFF88A1AC)),
            //   // ),
            //   child: GradientText(
            //     "Global\nPayments\nfor the Nextgen",
            //     style: GoogleFonts.montserrat(
            //         fontSize: 67,
            //         fontWeight: FontWeight.w900,
            //         color: Color(0xFF88A1AC)),
            //     gradient: LinearGradient(colors: [
            //       Color(0xff88A1AC),
            //       Color(0xff282F3F),
            //     ]),
            //   ),
            // ),
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Row(
                children: [
                  TextButton.icon(
                    icon: SvgPicture.asset("assets/icons/download_store.svg",
                        height: 57),
                    label: Text(""),
                    onPressed: StoreUrls().playStoreURL,
                    // onPressed: () {
                    //   Navigator.of(context).pop();
                    // },
                  ),
                  // TextButton.icon(
                  //   icon:
                  //       Image.asset("assets/images/app_store.png", height: 57),
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
    );
  }
}
