import 'dart:async';
import 'package:ninjapay/responsive.dart';
import 'package:flutter/material.dart';
import 'landingpage/views/landing_page.dart';
import 'landingpage/views/smalllanding_page.dart'; //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

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: LandingPage(),
      tablet: LandingPage(),
      mobile: SmallLandingPage(),
    );
  }
}
