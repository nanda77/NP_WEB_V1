import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_buttons.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_text_field.dart';
import 'package:ninjapay/payment_gateway/home/widget/amountCard.dart';
import 'package:ninjapay/payment_gateway/home/widget/table_header_text.dart';
import 'package:ninjapay/payment_gateway/home/widget/table_item_text.dart';

import '../../constants.dart';

class HomeBtcTab extends StatefulWidget {
  @override
  State<HomeBtcTab> createState() => _HomeBtcTabState();
}

class _HomeBtcTabState extends State<HomeBtcTab> {
  late double _devWidth;
  late double _tableItemWidth;
  double _containerWidth = 150;
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
    _devWidth = MediaQuery.of(context).size.width;
    _tableItemWidth = (_devWidth - 290) / 8;

    return Scaffold(
      backgroundColor: kBgLightColor,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  paymentStatusCard(orangeLightColor, orangeColor,
                      'BTC Balance', '7327832 SAT'),
                  SizedBox(width: 15),
                  paymentStatusCard(greenLightColor, greenColor, 'USDT Balance',
                      '7327832 USDT'),
                ],
              ),
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customTextField('Search transactions...',
                      width: _containerWidth + _containerWidth,
                      suffixIcon:
                          Icon(Icons.search, size: 25, color: kGreyTextColor)),
                  SizedBox(width: _devWidth * 0.41),
                  // Spacer(),
                  _filterDropDown(),
                  SizedBox(width: 15),
                  _sortDropDown(),
                ],
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 420,
              child: Expanded(
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
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 35,
                  width: 251,
                  color: Colors.white,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
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

  Widget _filterDropDown() {
    return Container(
      height: 50,
      width: _containerWidth,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(width: 1, color: kGrayColor)),

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
      width: _containerWidth,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(width: 1, color: kGrayColor)),

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

  Widget _headers() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              tableHeaderText('#', _tableItemWidth),
              tableHeaderText('Timestamp', _tableItemWidth),
              tableHeaderText('From/To', _tableItemWidth),
              tableHeaderText('Amount', _tableItemWidth),
              tableHeaderText('AMount(btc)', _tableItemWidth),
              tableHeaderText('Note', _tableItemWidth),
              tableHeaderText('Fee', _tableItemWidth),
              tableHeaderText('Status', _tableItemWidth),
            ],
          ),
        ),
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: tablePadding,
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(
                          'assets/Icons/ic_pending.svg',
                        ),
                        width: _tableItemWidth,
                      ),
                      tableItemText('10 Mar, 9:13 am', _tableItemWidth),
                      tableItemText('@pankaj', _tableItemWidth),
                      tableItemText('$inrSign 434523', _tableItemWidth),
                      tableItemText('+376727 SAT', _tableItemWidth),
                      tableItemText('Raw material', _tableItemWidth),
                      tableItemText('0%', _tableItemWidth),
                      tableItemText('Pending', _tableItemWidth),
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
