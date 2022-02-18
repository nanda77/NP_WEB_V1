import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/tipsmodule/blocs/get_user_bloc.dart';
import 'package:ninjapay/tipsmodule/screens/enter_tip_page.dart';
import 'package:ninjapay/tipsmodule/screens/enter_upi_tip_page.dart';
import 'package:ninjapay/tipsmodule/widgets/button_with_icon.dart';

class TipsLeadPage extends StatefulWidget {
  const TipsLeadPage({Key? key}) : super(key: key);

  @override
  _TipsLeadPageState createState() => _TipsLeadPageState();
}

class _TipsLeadPageState extends State<TipsLeadPage> {
  String baseUrl = Uri.base.toString();

  @override
  void initState() {
    super.initState();
    print(baseUrl);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<GetUserBloc>(context).add(GetUserRefreshEvent(/*baseUrl.split("/").elementAt(4)*/"robin"));
    });
/*    window.onMessage.forEach((element) {
      print('Event Received in callback: ${element.data}');
    });
    var url = window.location.href;*/
  }

  @override
  Widget build(BuildContext context) {
/*    var url = window.location.href;
    print(url);
    print(baseUrl.trim());
    print(baseUrl.trim().split("/").length);*/
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<GetUserBloc>(context).add(GetUserRefreshEvent(/*baseUrl.split("/").elementAt(4)*/"robin"));
    });

    return Scaffold(
      backgroundColor: darkBackgroundColor,

      body: BlocBuilder<GetUserBloc, GetUserState>(
        builder: (context, state){
          if(state is GetUserSuccessState){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: darkBackgroundColor,
                      border: Border.all(
                        color: kGreyTextColor,
                        width: 2,
                      ),
                      image: state.response?.image == null || state.response?.image == "" ? null : DecorationImage(
                        image:  NetworkImage(state.response?.image??""),
                        fit: BoxFit.cover
                      )
                  ),
                  child: state.response?.image == null || state.response?.image == "" ? Center(child: Text('${(state.response?.username??"").substring(0,1).toUpperCase()}', style: TextStyle(fontSize: 20, color: Colors.white),)) : null,
                ),*/

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
                    child: Center(child: Text('${(state.response?.username??"").substring(0,1).toUpperCase()}', style: TextStyle(fontSize: 20, color: Colors.white),)),
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
            );
          }
          if(state is GetUserErrorState){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: height*0.1),
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
                  child: Icon(Icons.person, size: 60, color: Colors.white),
                ),

                SizedBox(height: height*0.02),

                Text("@satoshinakamoto", style: TextStyle(fontSize: 14, color: kGreyTextColor, fontWeight: FontWeight.bold)),

                SizedBox(height: height*0.02),

                Text("Satoshi Nakamoto", style: TextStyle(fontSize: 10, color: kGreyTextColor)),

                SizedBox(height: height*0.12),

                ButtonWithIcon("Tips using BTC", "assets/Icons/bt_ic.png", onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EnterTipPage()),
                  );
                }),

                SizedBox(height: height*0.04),

                ButtonWithIcon("Tips using UPI", "assets/Icons/upi_ic.png", onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EnterTipPage()),
                  );
                }),

                SizedBox(height: height*0.02),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Powered By", style: TextStyle(fontSize: 10, color: kGreyTextColor)),
                    SizedBox(width: 5),
                    Text("NINJAPAY", style: TextStyle(fontSize: 12, color: kGreyTextColor, decoration: TextDecoration.underline,))
                  ],
                ),
              ],
            );
          }
          if(state is GetUserLoadingState){
            return Center(child: CircularProgressIndicator());
          }
          return Container();
        }
      ),
    );
  }
}
