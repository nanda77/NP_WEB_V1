import 'package:flutter/material.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_buttons.dart';
import 'package:ninjapay/payment_gateway/paywalls/widget/create_paywall_link.dart';
import 'package:ninjapay/payment_gateway/paywalls/widget/paywall_link.dart';

class PaywallsBtcTab extends StatefulWidget {
  @override
  State<PaywallsBtcTab> createState() => _PaywallsBtcTabState();
}

class _PaywallsBtcTabState extends State<PaywallsBtcTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgLightColor,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            paywallLink(),
            const SizedBox(
              height: 10,
            ),
            createPaywallLink(),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              color: kBgWorksColor,
              child: Column(
                children: [
                  _headers(),
                  Divider(
                    color: kGreyTextColor,
                    height: 1,
                  ),
                  _transactionList(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 35,
                  width: 251,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      paginationButton('1'),
                      paginationButton('2'),
                      paginationButton('3'),
                      paginationButton('4'),
                      paginationButton('5'),
                      paginationButton('6'),
                      paginationButton('7'),
                      paginationButton('8'),
                      paginationButton('>'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _headers() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Text('#', style: NormalTextStyle),
              width: 20,
            ),
            SizedBox(
              child: Text('Timestamp', style: NormalTextStyle),
              width: 100,
            ),
            SizedBox(
              child: Text('Link ID', style: NormalTextStyle),
              width: 150,
            ),
            SizedBox(
              child: Text('Amount', style: NormalTextStyle),
              width: 150,
            ),
            SizedBox(
              child: Text('Purpose', style: NormalTextStyle),
              width: 150,
            ),
            SizedBox(
              child: Text('Link', style: NormalTextStyle),
              width: 200,
            ),
            SizedBox(
              child: Text('Share', style: NormalTextStyle),
              width: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget _transactionList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Text('${index + 1}', style: tabBarTextStyle),
                        width: 20,
                      ),
                      SizedBox(
                        child: Text('10 Mar, 9:13 am', style: tabBarTextStyle),
                        width: 100,
                      ),
                      SizedBox(
                        child: Text('GD68H87JSG86', style: tabBarTextStyle),
                        width: 150,
                      ),
                      SizedBox(
                        child: Text('$inrSign 434523', style: tabBarTextStyle),
                        width: 150,
                      ),
                      SizedBox(
                        child: Text('Raw material', style: tabBarTextStyle),
                        width: 150,
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              'https://bit.ly/39uje4k32mke',
                              style: tabBarTextStyle,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/Icons/ic_copy.png',
                                )),
                          ],
                        ),
                        width: 200,
                      ),
                      SizedBox(
                        width: 100,
                        child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/Icons/ic_whats_app.png',
                            )),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: kGreyTextColor,
                height: 1,
              ),
            ],
          );
        },
      ),
    );
  }
}
