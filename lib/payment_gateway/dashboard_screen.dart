import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/payment_gateway/account/screens/account_main_screen.dart';
import 'package:ninjapay/payment_gateway/pay/screens/pay_screen.dart';
import 'package:ninjapay/payment_gateway/payment_link/screen/payment_links_screen.dart';
import 'package:ninjapay/payment_gateway/paywalls/screen/paywalls_screen.dart';
import 'package:ninjapay/responsive.dart';
import 'package:ninjapay/tipsmodule/blocs/get_user_bloc.dart';
import 'package:ninjapay/tipsmodule/screens/tips_lead_page.dart';
import '../constants.dart';
import 'home/screens/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  String? baseUrl;

  @override
  void initState() {
    super.initState();
    baseUrl = Uri.base.toString();
    print(baseUrl);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<GetUserBloc>(context).add(GetUserRefreshEvent(baseUrl!.split("/").last));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<GetUserBloc, GetUserState>(builder: (context, state) {
        if (state is GetUserSuccessState) {
          return Responsive(
            desktop: DeskTopLeadPage(state.response, baseUrl!.split("/").last),
            mobile: MobileLeadPage(state.response, baseUrl!.split("/").last),
            tablet: DeskTopLeadPage(state.response, baseUrl!.split("/").last),
          );
        }
        if (state is GetUserErrorState) {
          return Row(
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
                  : _selectedIndex == 5
                  ? Expanded(child: AccountMainScreen())
                  : Expanded(
                    child: Center(
                      child: Text('selectedIndex: $_selectedIndex'),
                    ),
              )
            ],
          );
        }
        return Container();
      })
    );
  }
}
