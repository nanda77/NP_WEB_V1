import 'dart:ui';

import 'package:ninjapay/landingpage/views/components/url_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class SmallFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      constraints: BoxConstraints(maxHeight: 170, minHeight: 70),
      margin: EdgeInsets.only(left: 10, right: 10),
      // width: double.infinity,

      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  // margin: EdgeInsets.only(left: 5),
                  // width: 496,
                  child: Text(
                    "Contact Us",
                    style: GoogleFonts.montserrat(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF282F3F).withOpacity(0.97)),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  // margin: EdgeInsets.only(left: 5),
                  child: TextButton.icon(
                    icon: SvgPicture.asset("assets/Icons/contact_us.svg",
                        height: 57),
                    label: Text(""),
                    onPressed: StoreUrls().mailURL,
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
