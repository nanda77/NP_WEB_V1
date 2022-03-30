import 'dart:async';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/payment_gateway/account/screens/aadhar_kyc_screen.dart';
import 'package:ninjapay/payment_gateway/account/screens/account_main_screen.dart';
import 'package:ninjapay/payment_gateway/account/screens/upload_selfie_screen.dart';
import 'package:ninjapay/payment_gateway/account/screens/verify_kyc_screen.dart';
import 'package:ninjapay/payment_gateway/authentication/bloc/google_auth_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/bloc/register_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/bloc/send_email_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/bloc/send_otp_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/bloc/user_exist_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/bloc/user_name_check_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/services/auth_repo.dart';
import 'package:ninjapay/payment_gateway/dashboard_screen.dart';
import 'package:ninjapay/payment_gateway/home/bloc/upi/home_btc_bloc.dart';
import 'package:ninjapay/payment_gateway/home/bloc/upi/home_upi_bloc.dart';
import 'package:ninjapay/payment_gateway/pay/bloc/complete_payment_bloc.dart';
import 'package:ninjapay/payment_gateway/payment_link/bloc/create_payment/create_payment_bloc.dart';
import 'package:ninjapay/payment_gateway/payment_link/bloc/payment_link_list/get_link_payment_bloc.dart';
import 'package:ninjapay/responsive.dart';
import 'package:ninjapay/tipsmodule/blocs/exchange_rate_bloc.dart';
import 'package:ninjapay/tipsmodule/blocs/get_user_bloc.dart';
import 'package:ninjapay/tipsmodule/blocs/lightning_tip_bloc.dart';
import 'package:ninjapay/tipsmodule/blocs/timer_bloc.dart';
import 'package:ninjapay/tipsmodule/blocs/transaction_status_bloc.dart';
import 'package:ninjapay/tipsmodule/screens/tips_lead_page.dart';
import 'package:url_strategy/url_strategy.dart';
import 'landingpage/views/landing_page.dart';
import 'landingpage/views/mediumlanding_page.dart';
import 'landingpage/views/smalllanding_page.dart'; //flutter build web --web-renderer canvaskit


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyANGC5anfuJDeSnGaPHj3iJex1qfV68TGs",
      authDomain: "ninjapay-192c0.firebaseapp.com",
      projectId: "ninjapay-192c0",
      storageBucket: "ninjapay-192c0.appspot.com",
      messagingSenderId: "558327185849",
      appId: "1:558327185849:web:9865cd9e4fc3246f1f7668"
    ),
  );
  setPathUrlStrategy();
  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(), // Wrap your app
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepo = AuthRepository.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => HomeUpiBloc()),
          BlocProvider(create: (BuildContext context) => CreatePaymentBloc()),
          BlocProvider(create: (BuildContext context) => GetLinkPaymentBloc()),
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
          BlocProvider<HomeBtcBloc>(
            create: (context) => HomeBtcBloc(),
          ),
          BlocProvider<CompletePaymentBloc>(
            create: (context) => CompletePaymentBloc(),
          ),
          BlocProvider<UserExistBloc>(
            create: (context) => UserExistBloc(),
          ),
          BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(),
          ),
          BlocProvider<GoogleAuthBloc>(
            create: (context) => GoogleAuthBloc(authRepo),
          ),
          BlocProvider<OtpBloc>(
            create: (context) => OtpBloc(authRepo),
          ),
          BlocProvider<UserNameCheckBloc>(
            create: (context) => UserNameCheckBloc(),
          ),
          BlocProvider<EmailBloc>(
            create: (context) => EmailBloc(authRepo),
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
            scaffoldBackgroundColor: const Color(0xff000000)
          ),
          home: TipsLeadPage(),
          // home: TipsLeadPage(),
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
