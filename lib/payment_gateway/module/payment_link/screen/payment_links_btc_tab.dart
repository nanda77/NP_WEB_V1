import 'package:flutter/material.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/module/payment_link/widget/your_link.dart';

class PaymentLinksBtcTab extends StatefulWidget {
  @override
  State<PaymentLinksBtcTab> createState() => _PaymentLinksBtcTabState();
}

class _PaymentLinksBtcTabState extends State<PaymentLinksBtcTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgLightColor,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            yourLink(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
