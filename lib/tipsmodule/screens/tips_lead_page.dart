import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class TipsLeadPage extends StatefulWidget {
  static const String route = '/leadPage';
  const TipsLeadPage({Key? key}) : super(key: key);

  @override
  _TipsLeadPageState createState() => _TipsLeadPageState();
}

class _TipsLeadPageState extends State<TipsLeadPage> {
  String? baseUrl;
  var uuid = Uuid();

  @override
  void initState() {
    super.initState();
    var v1 = uuid.v1(); // -> '6c84fb90-12c4-11e1-840d-7b25c5ee775a'

    var v1_exact = uuid.v1(options: {
      'node': [0x01, 0x23, 0x45, 0x67, 0x89, 0xab],
      'clockSeq': 0x1234,
      'mSecs': DateTime.utc(2011, 11, 01).millisecondsSinceEpoch,
      'nSecs': 5678
    }); // -> '710b962e-041c-11e1-9234-0123456789ab'

    // Generate a v4 (random) id
    var v4 = uuid.v4(); // -> '110ec58a-a0f2-4ac4-8393-c866d813b8d1'

    // Generate a v4 (crypto-random) id
    var v4_crypto = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
    // -> '110ec58a-a0f2-4ac4-8393-c866d813b8d1'

    // Generate a v5 (namespace-name-sha1-based) id
    var v5 = uuid.v5(Uuid.NAMESPACE_OID, 'www.google.com');

    print(v1);
    print(v1_exact);
    print(v4);
    print(v4_crypto);
    print(v5);

    baseUrl = Uri.base.toString();
    print(baseUrl);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<GetUserBloc>(context).add(GetUserRefreshEvent(baseUrl!.split("/").last));
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
            desktop: DeskTopLeadPage(state.response, baseUrl!.split("/").last),
            mobile: MobileLeadPage(state.response, baseUrl!.split("/").last),
            tablet: DeskTopLeadPage(state.response, baseUrl!.split("/").last),
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
  String userName;
  DeskTopLeadPage(this.response, this.userName, {Key? key}) : super(key: key);
  @override
  _DeskTopLeadPageState createState() => _DeskTopLeadPageState();
}

class _DeskTopLeadPageState extends State<DeskTopLeadPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print("vivel: ${widget.response?.image ?? ''}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: height * 0.1),
        CachedNetworkImage(
          // imageUrl: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
          imageUrl: widget.response?.image ?? '',
          height: 87,
          width: 87,
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
            MaterialPageRoute(builder: (context) => EnterTipPage(widget.userName)),
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
  String userName;
  MobileLeadPage(this.response, this.userName, {Key? key}) : super(key: key);
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
            MaterialPageRoute(builder: (context) => EnterTipPage(widget.userName)),
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
