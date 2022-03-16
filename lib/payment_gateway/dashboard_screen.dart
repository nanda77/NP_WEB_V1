import 'package:flutter/material.dart';
import 'package:ninjapay/payment_gateway/pay/screens/pay_screen.dart';
import 'package:ninjapay/payment_gateway/paywalls/screen/paywalls_screen.dart';

import '../constants.dart';
import 'home/screens/home_screen.dart';
import 'module/payment_link/screen/payment_links_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: <Widget>[
          NavigationRail(
            extended: true,

            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedLabelTextStyle:
                sidebarTextStyle.copyWith(color: kPrimaryColor),
            unselectedLabelTextStyle: sidebarTextStyle,
            destinations: [
              NavigationRailDestination(
                icon: Row(children: [
                  Container(height: 60, width: 4, color: kBgWorksColor),
                ]),
                selectedIcon: Row(children: [
                  Container(height: 60, width: 4, color: kPrimaryColor),
                ]),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Row(children: [
                  Container(height: 60, width: 4, color: kBgWorksColor),
                ]),
                selectedIcon: Row(children: [
                  Container(height: 60, width: 4, color: kPrimaryColor),
                ]),
                label: Text('Payment Links'),
              ),
              NavigationRailDestination(
                icon: Row(children: [
                  Container(height: 60, width: 4, color: kBgWorksColor),
                ]),
                selectedIcon: Row(children: [
                  Container(height: 60, width: 4, color: kPrimaryColor),
                ]),
                label: Text('POS'),
              ),
              NavigationRailDestination(
                icon: Row(children: [
                  Container(height: 60, width: 4, color: kBgWorksColor),
                ]),
                selectedIcon: Row(children: [
                  Container(height: 60, width: 4, color: kPrimaryColor),
                ]),
                label: Text('Paywalls'),
              ),
              NavigationRailDestination(
                icon: Row(children: [
                  Container(height: 60, width: 4, color: kBgWorksColor),
                ]),
                selectedIcon: Row(children: [
                  Container(height: 60, width: 4, color: kPrimaryColor),
                ]),
                label: Text('Developers'),
              ),
              NavigationRailDestination(
                icon: Row(children: [
                  Container(height: 60, width: 4, color: kBgWorksColor),
                ]),
                selectedIcon: Row(children: [
                  Container(height: 60, width: 4, color: kPrimaryColor),
                ]),
                label: Text('Account'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          _selectedIndex == 0
              ? Expanded(child: HomeScreen())
              : _selectedIndex == 1
                  ? Expanded(child: PaymentLinksScreen())
              : _selectedIndex == 2
                  ? Expanded(child: PayScreen())
                  : _selectedIndex == 3
                      ? Expanded(child: PaywallsScreen())
                      : Expanded(
                          child: Center(
                            child: Text('selectedIndex: $_selectedIndex'),
                          ),
                        )
        ],
      ),
    );
  }
}
