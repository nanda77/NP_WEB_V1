import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

        body: BlocBuilder<GetUserBloc, GetUserState>(
            builder: (context, state){
              if(state is GetUserSuccessState){
                return SingleChildScrollView(
                  child: Column(
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

                      Text("@${state.response?.username??" "}", style: TextStyle(fontSize: 14, color: kGreyTextColor, fontWeight: FontWeight.bold)),

                      SizedBox(height: height*0.02),

                      Text(state.response?.fullName??"", style: TextStyle(fontSize: 10, color: kGreyTextColor)),

                      SizedBox(height: height*0.02),

                      SizedBox(height: height*0.05),

                      Container(
                        width: width*0.25,
                        child: TextField(
                          // focusNode: myFocusNode,
                          controller: priceController,
                          autofocus: true,
                          cursorColor: Colors.blueAccent,
                          style: TextStyle(
                              color: kBgWorksColor,
                              fontSize: 22
                          ),
                          onChanged: (val){
                            if(val.trim().isEmpty){
                              priceController.text = "₹";
                              priceController.selection = TextSelection.fromPosition(TextPosition(offset: priceController.text.length));
                            }
                          },
                          textAlign: TextAlign.center,
                          maxLength: 6,
                          maxLines: 1,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
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

                      Text("Enter amount", style: TextStyle(color: kBgWorksColor, fontSize: 11)),

                      SizedBox(height: height*0.05),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Powered By", style: TextStyle(fontSize: 10, color: kGreyTextColor)),
                          SizedBox(width: 5),
                          Text("NINJAPAY", style: TextStyle(fontSize: 12, color: kGreyTextColor, decoration: TextDecoration.underline,))
                        ],
                      ),

                      SizedBox(height: height*0.04),

                      Container(
                        height: 45,
                        width: width*0.3,
                        child: CustomTextField(
                          noteController,
                          hintText: "Add notes",
                        ),
                      ),

                      SizedBox(height: height*0.02),

                      SimpleButton("NEXT", onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UpiQrPage(notes: noteController.text, tipPrice: priceController.text.replaceAll("₹", ""), upiId: state.response?.upi??"", name: state.response?.fullName??"")),
                        );
                      })

                    ],
                  ),
                );
              }
              if(state is GetUserLoadingState){
                return Center(child: CircularProgressIndicator());
              }
              return Container();
            }
        )

    );
  }
}
