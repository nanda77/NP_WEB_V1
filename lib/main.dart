import 'dart:async';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/payment_gateway/dashboard_screen.dart';
import 'package:ninjapay/responsive.dart';
import 'package:flutter/material.dart';
import 'package:ninjapay/tipsmodule/blocs/exchange_rate_bloc.dart';
import 'package:ninjapay/tipsmodule/blocs/get_user_bloc.dart';
import 'package:ninjapay/tipsmodule/blocs/lightning_tip_bloc.dart';
import 'package:ninjapay/tipsmodule/blocs/timer_bloc.dart';
import 'package:ninjapay/tipsmodule/blocs/transaction_status_bloc.dart';
import 'package:ninjapay/tipsmodule/screens/enter_tip_page.dart';
import 'package:ninjapay/tipsmodule/screens/enter_upi_tip_page.dart';
import 'package:ninjapay/tipsmodule/screens/qr_page.dart';
import 'package:ninjapay/tipsmodule/screens/tips_lead_page.dart';
import 'package:ninjapay/tipsmodule/screens/upi_qr_page.dart';
import 'package:url_strategy/url_strategy.dart';
import 'landingpage/views/landing_page.dart';
import 'landingpage/views/mediumlanding_page.dart';
import 'landingpage/views/smalllanding_page.dart'; //flutter build web --web-renderer canvaskit

StreamController<int> streamController = StreamController<int>();

void main() {
  setPathUrlStrategy();
  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(), // Wrap your app
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<GetUserBloc>(
            create: (context) => GetUserBloc(),
          ),
          BlocProvider<LightningTipBloc>(
            create: (context) => LightningTipBloc(),
          ),
          BlocProvider<ExchangeRateBloc>(
            create: (context) => ExchangeRateBloc(),
          ),
          BlocProvider<TransactionStatusBloc>(
            create: (context) => TransactionStatusBloc(),
          ),
          BlocProvider<CounterBloc>(
            create: (context) => CounterBloc(0),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'Welcome Ninja',
          theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              scaffoldBackgroundColor: const Color(0xff000000)),
          // home: MainScreen(),
          // home: DashboardScreen(),
          home: TipsLeadPage(),
          /*initialRoute: HomePage.route,
        routes: {
          HomePage.route: (context) => HomePage(),
          TipsLeadPage.route: (context) => TipsLeadPage(),
        },*/
        ));
  }
}

class HomePage extends StatelessWidget {
  static const String route = '/home';
  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: LandingPage(),
      tablet: MediumLandingPage(),
      mobile: SmallLandingPage(),
    );
  }
}
