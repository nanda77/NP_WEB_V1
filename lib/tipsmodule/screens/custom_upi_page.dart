import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/tipsmodule/blocs/get_user_bloc.dart';
import 'package:ninjapay/tipsmodule/screens/upi_qr_page.dart';
import 'package:ninjapay/tipsmodule/widgets/button_with_icon.dart';
import 'package:ninjapay/tipsmodule/widgets/custom_textfieds.dart';

class CustomUpiTip extends StatefulWidget {
  const CustomUpiTip({Key? key}) : super(key: key);

  @override
  _CustomUpiTipState createState() => _CustomUpiTipState();
}

class _CustomUpiTipState extends State<CustomUpiTip> {
  TextEditingController priceController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  String? tipUpi;

  @override
  void initState() {
    super.initState();
    priceController.text = "₹";
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<GetUserBloc, GetUserState>(builder: (context, state) {
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
                    placeholder: (context, url) => CircularProgressIndicator(),
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
                          priceController.text = "₹";
                          priceController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: priceController.text.length));
                        }
                      },
                      textAlign: TextAlign.center,
                      maxLength: 6,
                      maxLines: 1,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
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
                    "Enter amount",
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
                      //     style:
                      //         TextStyle(fontSize: 10, color: kGreyTextColor)),
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
                  Container(
                    height: 45,
                    width: width * 0.5,
                    child: CustomTextField(
                      noteController,
                      hintText: "Add notes",
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  SimpleButton("NEXT", onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpiQrPage(
                              notes: noteController.text,
                              tipPrice:
                                  priceController.text.replaceAll("₹", ""),
                              upiId: state.response?.upi ?? "",
                              name: state.response?.fullName ?? "")),
                    );
                  })
                ],
              ),
            );
          }
          if (state is GetUserLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          return Container();
        }));
  }
}
