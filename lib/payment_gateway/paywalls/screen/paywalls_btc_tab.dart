import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_buttons.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_loader.dart';
import 'package:ninjapay/payment_gateway/home/widget/table_header_text.dart';
import 'package:ninjapay/payment_gateway/home/widget/table_item_text.dart';
import 'package:ninjapay/payment_gateway/paywalls/bloc/delete_paywall_bloc.dart';
import 'package:ninjapay/payment_gateway/paywalls/bloc/paywall_list_bloc.dart';
import 'package:ninjapay/payment_gateway/paywalls/widget/create_paywall_link.dart';
import 'package:ninjapay/payment_gateway/paywalls/widget/paywall_link.dart';

class PaywallsBtcTab extends StatefulWidget {
  @override
  State<PaywallsBtcTab> createState() => _PaywallsBtcTabState();
}

class _PaywallsBtcTabState extends State<PaywallsBtcTab> {
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
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            paywallLink(context),
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          tableHeaderText('#', _tableItemWidth),
          tableHeaderText('Timestamp', _tableItemWidth),
          tableHeaderText('Redirect URL', _tableItemWidth),
          tableHeaderText('Price/View', _tableItemWidth),
          tableHeaderText('Title', _tableItemWidth),
          tableHeaderText('Paywall Link', _tableItemWidth),
          tableHeaderText('', _tableItemWidth),
        ],
      ),
    );
  }

  Widget _transactionList() {
    return Expanded(
      child: BlocBuilder<PaywallListBloc, PaywallListState>(
        builder: (context, state) {
          if(state is PaywallListSuccessState){
            return BlocListener<DeletePaywallBloc, DeletePaywallState>(
              listener: (context, deleteState) {
                if (deleteState is DeletePaywallLoadingState) {
                  loaderDialog(context);
                }
                if (deleteState is DeletePaywallSuccessState) {
                  BlocProvider.of<PaywallListBloc>(context).add(PaywallListRefreshEvent());
                }
                if(deleteState is DeletePaywallErrorState){
                  Navigator.pop(context);
                  Fluttertoast.showToast(msg: deleteState.errorMessage);
                }
              },
              child: ListView.builder(
                itemCount: state.response?.data?.length??0,
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
                            tableItemText(state.response?.data?[index].url??"", _tableItemWidth),
                            tableItemText('100 SAT', _tableItemWidth),
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
                                      onPressed: () {
                                        FlutterClipboard.copy("https://bit.ly").then((value) {
                                          Fluttertoast.showToast(msg: "Copied");
                                        });
                                      },
                                      icon: SvgPicture.asset(
                                        'assets/Icons/ic_copy.svg',
                                      )
                                  ),
                                ],
                              ),
                              width: _tableItemWidth,
                            ),

                            Container(
                              alignment: Alignment.centerLeft,
                              padding: tablePadding,
                              child: IconButton(
                                  onPressed: () {
                                    BlocProvider.of<DeletePaywallBloc>(context).add(DeletePaywallRefreshEvent(state.response?.data?[index].id??"", index));
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/Icons/ic_delete.svg',
                                  )
                              ),
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
          if(state is PaywallListLoadingState){
            return Center(child: CircularProgressIndicator());
          }
          else{
            return Container();
          }
        },
      ),
    );
  }

}
