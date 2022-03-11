import 'package:flutter/material.dart';
import 'package:ninjapay/payment_gateway/payment_link/screen/payment_links_btc_tab.dart';
import 'package:ninjapay/payment_gateway/payment_link/screen/payment_links_upi_tab.dart';

import '../../constants.dart';

class PaymentLinksScreen extends StatefulWidget {
  @override
  State<PaymentLinksScreen> createState() => _PaymentLinksScreenState();
}

class _PaymentLinksScreenState extends State<PaymentLinksScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgLightColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _tabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [PaymentLinksUpiTab(), PaymentLinksBtcTab()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: double.infinity,
      color: darkCementColor,
      child: SizedBox(
        height: 30,
        child: TabBar(
            isScrollable: true,
            controller: _tabController,
            unselectedLabelStyle: tabBarTextStyle,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              gradient: LinearGradient(colors: [kBgLightColor, kBgLightColor]),
              borderRadius: BorderRadius.circular(30),
              color: darkBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  // spreadRadius: 10,
                  // blurRadius: 5,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            tabs: [
              Tab(
                  child: Container(
                width: 40,
                child: Align(
                    alignment: Alignment.center,
                    child: Text("UPI", style: tabBarTextStyle)),
              )),
              Tab(
                  child: Container(
                width: 40,
                child: Align(
                    alignment: Alignment.center,
                    child: Text("BTC", style: tabBarTextStyle)),
              ))
            ]),
      ),
    );
  }
}
