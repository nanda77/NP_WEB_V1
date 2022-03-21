import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/tipsmodule/blocs/exchange_rate_bloc.dart';
import 'package:ninjapay/tipsmodule/blocs/get_user_bloc.dart';
import 'package:ninjapay/tipsmodule/blocs/lightning_tip_bloc.dart';
import 'package:ninjapay/tipsmodule/screens/qr_page.dart';
import 'package:ninjapay/tipsmodule/widgets/app_progress_indicator.dart';
import 'package:ninjapay/tipsmodule/widgets/button_with_icon.dart';
import 'package:ninjapay/tipsmodule/widgets/custom_textfieds.dart';

import '../../responsive.dart';

class CustomTipPage extends StatefulWidget {
  CustomTipPage({Key? key}) : super(key: key);
  @override
  State<CustomTipPage> createState() => _CustomTipPageState();
}

class _CustomTipPageState extends State<CustomTipPage> {
  TextEditingController noteController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  Map<String, dynamic>? data;
  int fiatValue = 0;
  double? btcValue;

  @override
  void initState() {
    super.initState();
    priceController.text = "\$";
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<ExchangeRateBloc, ExchangeRateState>(
            builder: (context, exchangeState) {
          if (exchangeState is ExchangeRateSuccessState) {
            (exchangeState.response?.data?.data ?? {}).forEach((key, value) {
              if (key == "BTCUSD") {
                data = value;
              }
            });
            return BlocBuilder<GetUserBloc, GetUserState>(
                builder: (context, state) {
              if (state is GetUserSuccessState) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.1),
                      CachedNetworkImage(
                        imageUrl: state.response?.image ?? '',
                        imageBuilder: (context, imageProvider) => Container(
                          height: 87,
                          width: 87,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: darkBackgroundColor,
                            border: Border.all(
                              color: cementTextColor,
                              width: 1.5,
                            ),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Container(
                          height: 87,
                          width: 87,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: darkBackgroundColor,
                            border: Border.all(
                              color: cementTextColor,
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                              child: Text(
                            '${(state.response?.username ?? "").substring(0, 2).toLowerCase()}',
                            style: GoogleFonts.montserrat(
                                fontSize: 27,
                                fontWeight: FontWeight.w400,
                                color: cementTextColor),
                          )),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("@${state.response?.username ?? " "}",
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: cementTextColor,
                              fontWeight: FontWeight.w800)),
                      SizedBox(height: 4),
                      Text(state.response?.fullName ?? "",
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: cementTextColor,
                              fontWeight: FontWeight.w400)),
                      SizedBox(height: height * 0.02),
                      SizedBox(height: height * 0.05),
                      Container(
                        width: width * 0.25,
                        child: TextField(
                          // focusNode: myFocusNode,
                          controller: priceController,
                          autofocus: true,
                          cursorColor: kBlueColor,
                          style: GoogleFonts.montserrat(
                              fontSize: 27,
                              color: kBgWorksColor,
                              fontWeight: FontWeight.w700),
                          onChanged: (val) {
                            if (val.trim().isEmpty) {
                              priceController.text = "\$";
                              priceController.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: priceController.text.length));
                              setState(() {
                                btcValue = null;
                              });
                            } else {
                              setState(() {
                                int price = int.parse(
                                    priceController.text.replaceAll("\$", ""));
                                fiatValue = price;
                                btcValue = double.parse(
                                    ((price) * (data?['BTC'] ?? 0.0))
                                        .toStringAsFixed(8));
                              });
                            }
                          },
                          textAlign: TextAlign.center,
                          maxLength: 6,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              left: 15,
                              bottom: 11,
                              top: 11,
                              right: 15,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "${btcValue ?? ""} BTC",
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: kBgWorksColor,
                            fontWeight: FontWeight.w200),
                      ),
                      SizedBox(height: height * 0.1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/Icons/plogo.svg"),
                          // Text("Powered By",
                          //     style: TextStyle(
                          //         fontSize: 10, color: kGreyTextColor)),
                          // SizedBox(width: 5),
                          // Text("NINJAPAY",
                          //     style: TextStyle(
                          //       fontSize: 12,
                          //       color: kGreyTextColor,
                          //       decoration: TextDecoration.underline,
                          //     ))
                        ],
                      ),
                      SizedBox(height: 10),
                      Responsive(
                          mobile: Container(
                            height: 45,
                            width: width * 0.5,
                            child: CustomTextField(
                              noteController,
                              hintText: "Add notes",
                              maxLength: 100,
                              maxLines: 1,
                            ),
                          ),
                          tablet: Container(
                            height: 45,
                            width: width * 0.3,
                            child: CustomTextField(
                              noteController,
                              hintText: "Add notes",
                              maxLength: 100,
                              maxLines: 1,
                            ),
                          ),
                          desktop: Container(
                            height: 45,
                            width: width * 0.3,
                            child: CustomTextField(
                              noteController,
                              hintText: "Add notes",
                              maxLength: 100,
                              maxLines: 1,
                            ),
                          )),
                      SizedBox(height: height * 0.02),
                      BlocListener<LightningTipBloc, LightningTipState>(
                        listener: (context, state) {
                          if (state is LightningTipLoadingState) {
                            showDialogLoader(context);
                          } else if (state is LightningTipSuccessState) {
                            print(state.response?.data?.toJson() ?? "");
                            Navigator.pop(context);
                           /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QRPage(
                                      state.response?.data?.transactionId ??
                                          "")),
                            );*/
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => QRPage(
                                state.response?.data?.transactionId ??
                                    "")));
                          } else if (state is LightningTipErrorState) {
                            Navigator.pop(context);
                          }
                        },
                        child: SimpleButton("NEXT", onTap: () {
                          if (btcValue == null) {
                            Fluttertoast.showToast(
                                msg: "Select btc value!",
                                webBgColor:
                                    "linear-gradient(to right, #000000, #000000)");
                          } else if (fiatValue == 0) {
                            Fluttertoast.showToast(
                                msg: "Enter right amount!",
                                webBgColor:
                                    "linear-gradient(to right, #000000, #000000)");
                          } else {
                            String notes = noteController.text.trim().isEmpty
                                ? "Tip"
                                : "Tip: ${noteController.text}";
                            BlocProvider.of<LightningTipBloc>(context).add(
                                LightningTipRefreshEvent(
                                    notes: notes,
                                    tip: btcValue ?? 0.0,
                                    btcPrice: data?['USD'] ?? 0.0,
                                    fiatvalue: fiatValue,
                                    userName: state.response?.username ?? ""));
                          }
                        }),
                      )
                    ],
                  ),
                );
              }
              if (state is GetUserLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              return Container();
            });
          }
          if (exchangeState is ExchangeRateErrorState) {
            return Container(
              child: Text("Something went wrong!"),
            );
          }
          if (exchangeState is ExchangeRateLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          return Container();
        }));
  }
}
