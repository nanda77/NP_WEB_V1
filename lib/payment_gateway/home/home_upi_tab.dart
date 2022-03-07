import 'package:flutter/material.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_buttons.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_text_field.dart';
import 'package:ninjapay/payment_gateway/home/widget/amountCard.dart';

class HomeUpiTab extends StatefulWidget {
  @override
  State<HomeUpiTab> createState() => _HomeUpiTabState();
}

class _HomeUpiTabState extends State<HomeUpiTab> {
  String filterValue = 'Filter by';
  String sortValue = 'Sort by';

  var items = [
    'Sort by',
    'Filter by',
    'Apple',
    'Banana',
    'Grapes',
    'Orange',
    'watermelon',
    'Pineapple'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgLightColor,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                paymentStatusCard(orangeLightColor, orangeColor, 'Pending',
                    '$inrSign 7327832'),
                SizedBox(width: 15),
                paymentStatusCard(greenLightColor, greenColor, 'Approved',
                    '$inrSign 7327832'),
                SizedBox(width: 15),
                paymentStatusCard(
                    redLightColor, redColor, 'Declined', '$inrSign 7327832'),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customTextField('Search transactions...',
                    suffixIcon: Icon(
                      Icons.search,
                      size: 25,
                      color: kGreyTextColor,
                    )),
                Row(
                  children: [
                    _filterDropDown(),
                    SizedBox(width: 15),
                    _sortDropDown(),
                    SizedBox(width: 15),
                    _addButton()
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: Container(
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
            // DashboardUPIDataPage()
          ],
        ),
      ),
    );
  }

  Widget _filterDropDown() {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(width: 0.5, color: kGrayColor)),

      // dropdown below..
      child: DropdownButton<String>(
        value: filterValue,
        onChanged: (newValue) =>
            setState(() => filterValue = newValue as String),
        items: items
            .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
            .toList(),

        // add extra sugar..
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 42,
        underline: SizedBox(),
      ),
    );
  }

  Widget _sortDropDown() {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(width: 0.5, color: kGrayColor)),

      // dropdown below..
      child: DropdownButton<String>(
        value: sortValue,
        onChanged: (newValue) => setState(() => sortValue = newValue as String),
        items: items
            .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
            .toList(),

        // add extra sugar..
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 42,
        underline: SizedBox(),
      ),
    );
  }

  Widget _addButton() {
    return Container(
      height: 50,
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(width: 0.5, color: darkBackgroundColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('+ ', style: boldTextStyle),
          Text('Add New', style: boldTextStyle)
        ],
      ),
    );
  }

  Widget _transactionList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                      child:
                          Text('7437878434788@icici', style: tabBarTextStyle),
                      width: 150,
                    ),
                    SizedBox(
                      child: Text('Raw material', style: tabBarTextStyle),
                      width: 150,
                    ),
                    SizedBox(
                      child: Text('GD68H87JSG86', style: tabBarTextStyle),
                      width: 150,
                    ),
                    SizedBox(
                      child: index == 5
                          ? Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/Icons/ic_accept.png',
                                    height: 28,
                                  ),
                                ),
                                SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/Icons/ic_decline.png',
                                    height: 28,
                                  ),
                                ),
                              ],
                            )
                          : Text('Approved', style: tabBarTextStyle),
                      width: 150,
                    ),
                  ],
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

  Widget _headers() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
            child: Text('UTR', style: NormalTextStyle),
            width: 150,
          ),
          SizedBox(
            child: Text('Price', style: NormalTextStyle),
            width: 150,
          ),
          SizedBox(
            child: Text('UPI', style: NormalTextStyle),
            width: 150,
          ),
          SizedBox(
            child: Text('Purpose', style: NormalTextStyle),
            width: 150,
          ),
          SizedBox(
            child: Text('Order ID', style: NormalTextStyle),
            width: 150,
          ),
          SizedBox(
            child: Text('Status', style: NormalTextStyle),
            width: 150,
          )
        ],
      ),
    );
  }
}
