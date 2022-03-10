import 'package:flutter/material.dart';
import 'package:ninjapay/constants.dart';

class PaywallsUpiTab extends StatefulWidget {
  @override
  State<PaywallsUpiTab> createState() => _PaywallsUpiTabState();
}

class _PaywallsUpiTabState extends State<PaywallsUpiTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgLightColor,
      body: Center(
        child: Text('PAYWALLS UPI'),
      ),
    );
  }
}
