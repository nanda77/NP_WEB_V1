import 'dart:ui';

import 'package:ninjapay/landingpage/views/components/url_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(left: 80, right: 20, top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
              ),
              // Image.asset("assets/images/ic_logo_4x.png",
              //     width: 74, height: 67),
              SizedBox(
                width: 20,
              ),
              SvgPicture.asset(
                "assets/Icons/logo_txt.svg",
                // width: 102.86,
                height: 15,
              ),
              // Text(
              //   "ninjapay",
              //   style: GoogleFonts.montserrat(
              //       fontSize: 28, fontWeight: FontWeight.bold),
              // ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: screenSize.width / 8),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'FEATURES',
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF88A1AC).withOpacity(1)),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                    SizedBox(width: screenSize.width / 30),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'BUSINESS',
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF88A1AC).withOpacity(1)),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                    SizedBox(width: screenSize.width / 30),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'CONTACT',
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF88A1AC).withOpacity(1)),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                    SizedBox(width: screenSize.width / 20),
                  ],
                ),
              ),
              // SizedBox(width: screenSize.width / 40),
            ],
          ),
        ),
      ),
    );
  }
}
