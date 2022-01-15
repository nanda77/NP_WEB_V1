import 'dart:ui';

import 'package:ninjapay/landingpage/views/components/url_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ninjapay/landingpage/views/utils/gradient_text.dart';

import '../../../constants.dart';

class LandingSection1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      constraints: BoxConstraints(maxHeight: 1333, minHeight: 400),
      margin: EdgeInsets.only(left: 100, right: 0, top: 70),
      // width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/images/f1.png"),
        ),
      ),

      child: Expanded(
        // flex: 2,
        child: Container(
          margin: EdgeInsets.only(bottom: 200),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton.icon(
                icon: Image.asset("assets/images/play_store.png", height: 57),
                label: Text(""),
                onPressed: StoreUrls().playStoreURL,
              ),
              TextButton.icon(
                icon: Image.asset("assets/images/app_store.png", height: 57),
                label: Text(""),
                onPressed: StoreUrls()
                    .appStoreURL, // https://apps.apple.com/in/app/ninjapay-manage-construction/id1547753533
              ),
            ],
          ),
        ),
      ),
    );
  }
}
