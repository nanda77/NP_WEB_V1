import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/common_component/alert_message.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_buttons.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_text_field.dart';
import 'package:ninjapay/payment_gateway/home/widget/table_header_text.dart';
import 'package:ninjapay/payment_gateway/home/widget/table_item_text.dart';
import 'package:ninjapay/payment_gateway/module/payment_link/bloc/create_payment/create_payment_bloc.dart';
import 'package:ninjapay/payment_gateway/module/payment_link/bloc/create_payment/create_payment_events.dart';
import 'package:ninjapay/payment_gateway/module/payment_link/bloc/create_payment/create_payment_states.dart';
import 'package:ninjapay/payment_gateway/module/payment_link/widget/your_link.dart';

class PaymentLinksUpiTab extends StatefulWidget {
  @override
  State<PaymentLinksUpiTab> createState() => _PaymentLinksUpiTabState();
}

class _PaymentLinksUpiTabState extends State<PaymentLinksUpiTab> {
  final _amountController = TextEditingController();
  final _purposeController = TextEditingController();

  late double _devWidth;
  late double _tableItemWidth;

  @override
  Widget build(BuildContext context) {
    _devWidth = MediaQuery.of(context).size.width;
    _tableItemWidth = (_devWidth - 290) / 7;

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
            _createLink(),
            const SizedBox(
              height: 10,
            ),
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

  Widget _createLink() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          color: kBgCardColor,
          border: Border.all(width: 1, color: darkCementColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create Payment Link',
            style: boldTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: kGreyTextColor,
            height: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Amount',
                      style: NormalTextStyle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    customTextField('Enter Amount',
                        textInputFormatter:
                            FilteringTextInputFormatter.digitsOnly,
                        controller: _amountController),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Purpose',
                      style: NormalTextStyle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    customTextField('Purpose of payment',
                        controller: _purposeController),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _createButton(),
          const SizedBox(
            height: 40,
          ),
        ],
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
          tableHeaderText('Link ID', _tableItemWidth),
          tableHeaderText('Amount', _tableItemWidth),
          tableHeaderText('Purpose', _tableItemWidth),
          tableHeaderText('Link', _tableItemWidth),
          tableHeaderText('Share', _tableItemWidth),
        ],
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    tableItemText('${index + 1}', _tableItemWidth),
                    tableItemText('10 Mar, 9:13 am', _tableItemWidth),
                    tableItemText('abc@', _tableItemWidth),
                    tableItemText('$inrSign 434523', _tableItemWidth),
                    tableItemText('Raw material', _tableItemWidth),
                    Container(
                      padding: tablePadding,
                      child: Row(
                        children: [
                          Text(
                            'https://bit.ly',
                            style: tabBarTextStyle,
                          ),
                          const SizedBox(
                            width: 0,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/Icons/ic_copy.svg',
                              )),
                        ],
                      ),
                      width: _tableItemWidth,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: tablePadding,
                      child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/Icons/ic_whats_app.svg',
                          )),
                      width: _tableItemWidth,
                    )
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

  Widget _createButton() {
    return BlocListener<CreatePaymentBloc, CreatePaymentStates>(
      listener: (context, state) async {
        if (state is CreatePaymentLoadingState) {
        } else if (state is CreatePaymentSuccessState) {
          _amountController.text = '';
          _purposeController.text = '';
          Fluttertoast.showToast(msg: state.data);
        } else if (state is CreatePaymentErrorState) {
          Fluttertoast.showToast(msg: state.message);
        }
      },
      child: ConnectivityBuilder(
        builder: (context, isConnected, status) =>
            blackBorderButton('CREATE', onTap: () {
          var amount = _amountController.text.toString().trim();
          var purpose = _purposeController.text.toString().trim();
          if (amount.isEmpty) {
            Fluttertoast.showToast(msg: "Please enter amount.");
          } else if (purpose.isEmpty) {
            Fluttertoast.showToast(msg: "Please enter purpose.");
          } else if (purpose.length > 30) {
            Fluttertoast.showToast(
                msg: "Purpose length must be less than or equal to 30 characters long.");
          } else if (isConnected != true) {
            Fluttertoast.showToast(msg: AlertMessages.INTERNET_ERROR);
          } else {
            BlocProvider.of<CreatePaymentBloc>(context)
                .add(CreatePaymentRefreshEvent(amount, purpose));
          }
        }),
      ),
    );
  }
}
