import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_buttons.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_text_field.dart';
import 'package:ninjapay/payment_gateway/home/widget/amountCard.dart';
import 'package:ninjapay/payment_gateway/home/widget/table_header_text.dart';
import 'package:ninjapay/payment_gateway/home/widget/table_item_text.dart';
import '../bloc/upi/home_upi_bloc.dart';

class HomeUpiTab extends StatefulWidget {
  @override
  State<HomeUpiTab> createState() => _HomeUpiTabState();
}

class _HomeUpiTabState extends State<HomeUpiTab> {
  String filterValue = 'Filter by';
  String sortValue = 'Sort by';
  late double _devWidth;
  late double _tableItemWidth;
  double _containerWidth = 150;

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
      body: BlocBuilder<HomeUpiBloc, HomeUpiStates>(
          builder: (context, state) {
            if (state is HomeUpiLoadingState) {
              return Text('loading');
            } else if (state is HomeUpiSuccessState) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: paymentStatusCard(orangeLightColor, orangeColor,
                              'Pending', '$inrSign ${state.data.data?.balanceStatus?.pending ?? 0}'),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: paymentStatusCard(greenLightColor, greenColor,
                              'Approved', '$inrSign ${state.data.data?.balanceStatus?.approved ?? 0}'),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: paymentStatusCard(
                              redLightColor, redColor, 'Declined', '$inrSign ${state.data.data?.balanceStatus?.declined ?? 0}'),
                        ),
                      ],
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
                          // Spacer(),
                          SizedBox(width: _devWidth * 0.3),
                          _filterDropDown(),
                          SizedBox(width: 15),
                          _sortDropDown(),
                          SizedBox(width: 15),
                          _addButton()
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
                              _transactionList(state.data.data?.transactionRecords??[]),
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
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              );
            } else if (state is HomeUpiErrorState) {
              return Text(state.data);
            } else {
              return Text('else');
            }
        }
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
      width: _containerWidth,
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
      width: _containerWidth,
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

  Widget _transactionList(List<String> list) {
        return Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        tableItemText('${index + 1}', _tableItemWidth),
                        tableItemText('10 Mar, 9:13 am', _tableItemWidth),
                        tableItemText('GD68H87JSG86', _tableItemWidth),
                        tableItemText('$inrSign 434523', _tableItemWidth),
                        tableItemText('7437878434788@icici', _tableItemWidth),
                        tableItemText('Raw material', _tableItemWidth),
                        tableItemText('GD68H87JSG86', _tableItemWidth),
                        Container(
                          padding: tablePadding,
                          child: index == 5
                              ? Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/Icons/ic_accept.png',
                                        height: 24,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/Icons/ic_decline.png',
                                        height: 24,
                                      ),
                                    ),
                                  ],
                                )
                              : tableItemText('Approved', _devWidth),
                          width: (_devWidth - 290) / 8,
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          tableHeaderText('#', _tableItemWidth),
          tableHeaderText('Timestamp', _tableItemWidth),
          tableHeaderText('UTR', _tableItemWidth),
          tableHeaderText('Price', _tableItemWidth),
          tableHeaderText('UPI', _tableItemWidth),
          tableHeaderText('Purpose', _tableItemWidth),
          tableHeaderText('Order ID', _tableItemWidth),
          tableHeaderText('Status', _tableItemWidth),
        ],
      ),
    );
  }
}
