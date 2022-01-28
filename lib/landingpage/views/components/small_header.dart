import 'dart:ui';

import 'package:ninjapay/landingpage/views/components/url_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

class SmallHeader extends StatefulWidget {
  @override
  _SmallHeaderState createState() => _SmallHeaderState();
}

class _SmallHeaderState extends State<SmallHeader> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset("assets/images/ic_logo_4x.png", width: 74, height: 67),
            SizedBox(
              width: 20,
            ),
            Image.asset("assets/images/logo_txt.png", width: 150),
            // Text(
            //   "ninjapay",
            //   style: GoogleFonts.montserrat(
            //       fontSize: 28, fontWeight: FontWeight.bold),
            // ),
          ],
        ),
      ),
    );
  }
}
