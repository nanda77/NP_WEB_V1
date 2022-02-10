import 'dart:async';
import 'package:ninjapay/responsive.dart';
import 'package:flutter/material.dart';
import 'package:ninjapay/tipsmodule/screens/enter_tip_page.dart';
import 'package:ninjapay/tipsmodule/screens/qr_page.dart';
import 'package:ninjapay/tipsmodule/screens/tips_lead_page.dart';
import 'landingpage/views/landing_page.dart';
import 'landingpage/views/mediumlanding_page.dart';
import 'landingpage/views/smalllanding_page.dart'; //flutter build web --web-renderer canvaskit

StreamController<int> streamController = StreamController<int>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome Ninja',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: const Color(0xff000000)),
      // home: MainScreen(),
      home: EnterTipPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: LandingPage(),
      tablet: MediumLandingPage(),
      mobile: SmallLandingPage(),
    );
  }
}
