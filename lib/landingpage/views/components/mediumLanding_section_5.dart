import 'dart:ui';

import 'package:ninjapay/landingpage/views/components/url_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ninjapay/landingpage/views/utils/gradient_text.dart';

import '../../../constants.dart';

class MediumLandingSection5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      constraints: BoxConstraints(maxHeight: 600, minHeight: 300),
      margin: EdgeInsets.only(left: 60, right: 0, top: 0),
      // width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/images/f5.png"),
        ),
      ),

      child: Container(
        margin: EdgeInsets.only(top: 170),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(
              'assets/icons/t5.svg',
              width: screenSize.width / 3,
            ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
