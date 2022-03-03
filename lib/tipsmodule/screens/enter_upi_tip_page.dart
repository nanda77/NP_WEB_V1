import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/responsive.dart';
import 'package:ninjapay/tipsmodule/blocs/get_user_bloc.dart';
import 'package:ninjapay/tipsmodule/screens/custom_upi_page.dart';
import 'package:ninjapay/tipsmodule/screens/enter_tip_page.dart';
import 'package:ninjapay/tipsmodule/screens/upi_qr_page.dart';
import 'package:ninjapay/tipsmodule/widgets/button_with_icon.dart';
import 'package:ninjapay/tipsmodule/widgets/custom_textfieds.dart';

class EnterUpiTipPage extends StatefulWidget {
  const EnterUpiTipPage({Key? key}) : super(key: key);

  @override
  _EnterUpiTipPageState createState() => _EnterUpiTipPageState();
}

class _EnterUpiTipPageState extends State<EnterUpiTipPage> {
  TextEditingController noteController = TextEditingController();
  int? index, tipUpi;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: darkBackgroundColor,
        body: BlocBuilder<GetUserBloc, GetUserState>(builder: (context, state) {
          if (state is GetUserSuccessState) {
            return Column(
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
                Responsive(
                    mobile: Container(
                      width: width * 0.5,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: height * 0.03,
                        spacing: width * 0.04,
                        children: [
                          ...list.map((e) {
                            if (e.id == 6) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    index = e.id;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CustomUpiTip()),
                                  );
                                },
                                child: customIcon("Custom",
                                    color: index != null && index == e.id
                                        ? darkCementColor
                                        : Colors.transparent),
                              );
                            }
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  index = e.id;
                                  tipUpi = e.value;
                                });
                              },
                              child: icon("₹${e.value}",
                                  color: index != null && index == e.id
                                      ? darkCementColor
                                      : Colors.transparent),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    tablet: Container(
                      width: width * 0.3,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: height * 0.03,
                        spacing: width * 0.06,
                        children: [
                          ...list.map((e) {
                            if (e.id == 6) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    index = e.id;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CustomUpiTip()),
                                  );
                                },
                                child: customIcon("Custom",
                                    color: index != null && index == e.id
                                        ? darkCementColor
                                        : Colors.transparent),
                              );
                            }
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  index = e.id;
                                  tipUpi = e.value;
                                });
                              },
                              child: icon("₹${e.value}",
                                  color: index != null && index == e.id
                                      ? darkCementColor
                                      : Colors.transparent),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    desktop: Container(
                      width: width * 0.3,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: height * 0.03,
                        spacing: width * 0.06,
                        children: [
                          ...list.map((e) {
                            if (e.id == 6) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    index = e.id;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CustomUpiTip()),
                                  );
                                },
                                child: customIcon("Custom",
                                    color: index != null && index == e.id
                                        ? darkCementColor
                                        : Colors.transparent),
                              );
                            }
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  index = e.id;
                                  tipUpi = e.value;
                                });
                              },
                              child: icon("₹${e.value}",
                                  color: index != null && index == e.id
                                      ? darkCementColor
                                      : Colors.transparent),
                            );
                          }).toList(),
                        ],
                      ),
                    )),
                SizedBox(height: height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/Icons/plogo.svg"),
                    // Text("Powered By",
                    //     style: TextStyle(fontSize: 10, color: kGreyTextColor)),
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
                SimpleButton("NEXT", onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpiQrPage(
                            notes: noteController.text,
                            tipPrice: tipUpi.toString(),
                            upiId: state.response?.upi ?? "",
                            name: state.response?.fullName ?? "")),
                  );
                })
              ],
            );
          }
          if (state is GetUserLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          return Container();
        }));
  }

  icon(String label, {Color color = Colors.transparent}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // color: color ? Colors.grey.shade800 : null
        color: color,
      ),
      child: Column(
        children: [
          Image.asset("assets/Icons/upi_ic.png", height: 40, width: 40),
          SizedBox(height: 10),
          Text(
            label,
            style: GoogleFonts.montserrat(
                fontSize: 18,
                color: kBgWorksColor,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  customIcon(String label, {Color color = Colors.transparent}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // color: Colors.grey.shade800
          color: color),
      child: Column(
        children: [
          Image.asset("assets/Icons/menu.png", height: 40, width: 40),
          SizedBox(height: 10),
          Text(
            label,
            style: GoogleFonts.montserrat(
                fontSize: 18,
                color: kBgWorksColor,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  List<Tip> list = [
    Tip(1, 1),
    Tip(2, 2),
    Tip(3, 5),
    Tip(4, 7),
    Tip(5, 10),
    Tip(6, 0)
  ];
}
