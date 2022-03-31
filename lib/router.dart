import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ninjapay/payment_gateway/dashboard_screen.dart';
import 'package:ninjapay/payment_gateway/pay/screens/pay_screen.dart';
import 'package:ninjapay/tipsmodule/screens/tips_lead_page.dart';

class Routes{
  static void configureRoutes(FluroRouter router){
    router.notFoundHandler = Handler(handlerFunc: (context, params){
      debugPrint("ROUTE WAS NOT FOUND!!");
      return RouteNotFound();
    });
    router.define(
      '/',
      handler: Handler(handlerFunc: (_, params) => TipsLeadPage())
    );
    router.define(
      '/linkid',
      handler: Handler(handlerFunc: (_, params) => PayScreen())
    );
  }
}

class RouteNotFound extends StatelessWidget {
  const RouteNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("404", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),),
        ),
      ),
    );
  }
}
