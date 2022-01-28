import 'dart:ui';

import 'package:ninjapay/landingpage/views/components/url_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      constraints: BoxConstraints(maxHeight: 70, minHeight: 40),
      margin: EdgeInsets.only(left: 100, right: 100),
      // width: double.infinity,

      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 5),
                  // width: 496,
                  child: Text(
                    "Contact Us",
                    style: GoogleFonts.montserrat(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF88A1AC).withOpacity(0.97)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      TextButton.icon(
                        icon: Image.asset(
                          "assets/images/contact_us.png",
                          height: 57,
                          color: Color(0xFF88A1AC),
                        ),
                        label: Text(""),
                        onPressed: StoreUrls().mailURL,
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
