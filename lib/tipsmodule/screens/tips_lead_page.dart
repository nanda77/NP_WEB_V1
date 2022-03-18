import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/main.dart';
import 'package:ninjapay/responsive.dart';
import 'package:ninjapay/tipsmodule/blocs/get_user_bloc.dart';
import 'package:ninjapay/tipsmodule/models/user_name_model.dart';
import 'package:ninjapay/tipsmodule/screens/enter_tip_page.dart';
import 'package:ninjapay/tipsmodule/screens/enter_upi_tip_page.dart';
import 'package:ninjapay/tipsmodule/widgets/button_with_icon.dart';

class TipsLeadPage extends StatefulWidget {
  static const String route = '/leadPage';
  const TipsLeadPage({Key? key}) : super(key: key);

  @override
  _TipsLeadPageState createState() => _TipsLeadPageState();
}

class _TipsLeadPageState extends State<TipsLeadPage> {
  String? baseUrl;

  @override
  void initState() {
    super.initState();
    baseUrl = Uri.base.toString();
    print(baseUrl);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<GetUserBloc>(context)
          .add(GetUserRefreshEvent(baseUrl!.split("/").last /*"robin"*/));
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocBuilder<GetUserBloc, GetUserState>(builder: (context, state) {
        if (state is GetUserSuccessState) {
          return Responsive(
            desktop: DeskTopLeadPage(state.response),
            mobile: MobileLeadPage(state.response),
            tablet: DeskTopLeadPage(state.response),
          );
          /*return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: height*0.1),

                CachedNetworkImage(
                  imageUrl: state.response?.image??'',
                  imageBuilder: (context, imageProvider) => Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: darkBackgroundColor,
                      border: Border.all(
                        color: kGreyTextColor,
                        width: 2,
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
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: darkBackgroundColor,
                        border: Border.all(
                          color: kGreyTextColor,
                          width: 2,
                        ),
                    ),
                    child: Center(child: Text('${(state.response?.username??"").substring(0,2).toUpperCase()}', style: TextStyle(fontSize: 20, color: Colors.white),)),
                  ),
                ),

                SizedBox(height: height*0.02),

                Text(state.response?.username??"", style: TextStyle(fontSize: 14, color: kGreyTextColor, fontWeight: FontWeight.bold)),

                SizedBox(height: height*0.02),

                Text(state.response?.fullName??"", style: TextStyle(fontSize: 10, color: kGreyTextColor)),

                SizedBox(height: height*0.12),

                ButtonWithIcon("Tips using BTC", "assets/Icons/bt_ic.png", onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EnterTipPage()),
                  );
                }),

                SizedBox(height: height*0.04),

                state.response?.upiEnabled == true ? ButtonWithIcon("Tips using UPI", "assets/Icons/upi_ic.png", onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EnterUpiTipPage()),
                  );
                }) : Container(),

                state.response?.upiEnabled == true ? SizedBox(height: height*0.02) : Container(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Powered By", style: TextStyle(fontSize: 10, color: kGreyTextColor)),
                    SizedBox(width: 5),
                    Text("NINJAPAY", style: TextStyle(fontSize: 12, color: kGreyTextColor, decoration: TextDecoration.underline,))
                  ],
                ),
              ],
            );*/
        }
        if (state is GetUserErrorState) {
          return HomePage();
        }
        if (state is GetUserLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        //   return Container();
        // }
        if (state is GetUserErrorState) {
          return Center(
              child: Text(
            "User Not Found!",
            style: TextStyle(color: Colors.white),
            textScaleFactor: 1.8,
          ));
        }
        if (state is GetUserLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        return Container();
      }),
    );
  }
}

class DeskTopLeadPage extends StatefulWidget {
  UserData? response;
  DeskTopLeadPage(this.response, {Key? key}) : super(key: key);
  @override
  _DeskTopLeadPageState createState() => _DeskTopLeadPageState();
}

class _DeskTopLeadPageState extends State<DeskTopLeadPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: height * 0.1),
        CachedNetworkImage(
          imageUrl: widget.response?.image ?? '',
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
              '${(widget.response?.username ?? "").substring(0, 2).toLowerCase()}',
              style: GoogleFonts.montserrat(
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                  color: cementTextColor),
            )),
          ),
        ),
        SizedBox(height: 10),
        Text("@${widget.response?.username ?? " "}",
            style: GoogleFonts.montserrat(
                fontSize: 16,
                color: cementTextColor,
                fontWeight: FontWeight.w800)),
        SizedBox(height: 4),
        Text(widget.response?.fullName ?? "",
            style: GoogleFonts.montserrat(
                fontSize: 12,
                color: cementTextColor,
                fontWeight: FontWeight.w400)),
        SizedBox(height: height * 0.12),
        ButtonWithIcon("Tip using BTC", "assets/Icons/bt_ic.png", onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EnterTipPage()),
          );
        }),
        SizedBox(height: height * 0.04),
        widget.response?.upiEnabled == true
            ? ButtonWithIcon("Tip using UPI", "assets/Icons/upi_ic.png",
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EnterUpiTipPage()),
                );
              })
            : Container(),
        widget.response?.upiEnabled == true
            ? SizedBox(height: height * 0.01)
            : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/Icons/plogo.svg"),
            // Text("Powered By",
            //     style: TextStyle(
            //         fontSize: 10, color: cementTextColor.withOpacity(0.7))),
            // SizedBox(width: 5),
            // Text("NINJAPAY",
            //     style: TextStyle(
            //       fontSize: 12,
            //       color: cementTextColor,
            //       decoration: TextDecoration.underline,
            //     ))
          ],
        ),
      ],
    );
  }
}

class MobileLeadPage extends StatefulWidget {
  UserData? response;
  MobileLeadPage(this.response, {Key? key}) : super(key: key);
  @override
  _MobileLeadPageState createState() => _MobileLeadPageState();
}

class _MobileLeadPageState extends State<MobileLeadPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: height * 0.1),
        CachedNetworkImage(
          imageUrl: widget.response?.image ?? '',
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
              '${(widget.response?.username ?? "").substring(0, 2).toLowerCase()}',
              style: GoogleFonts.montserrat(
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                  color: cementTextColor),
            )),
          ),
        ),
        SizedBox(height: 10),
        Text(widget.response?.username ?? "",
            style: GoogleFonts.montserrat(
                fontSize: 16,
                color: cementTextColor,
                fontWeight: FontWeight.w800)),
        SizedBox(height: 4),
        Text(widget.response?.fullName ?? "",
            style: GoogleFonts.montserrat(
                fontSize: 12,
                color: cementTextColor,
                fontWeight: FontWeight.w400)),
        SizedBox(height: height * 0.12),
        ButtonWithIcon("Tips using BTC", "assets/Icons/bt_ic.png", onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EnterTipPage()),
          );
        }),
        widget.response?.upiEnabled == true
            ? SizedBox(height: height * 0.04)
            : SizedBox(height: height * 0.01),
        widget.response?.upiEnabled == true
            ? ButtonWithIcon("Tips using UPI", "assets/Icons/upi_ic.png",
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EnterUpiTipPage()),
                );
              })
            : Container(),
        widget.response?.upiEnabled == true
            ? SizedBox(height: height * 0.01)
            : Container(),
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
      ],
    );
  }
}
