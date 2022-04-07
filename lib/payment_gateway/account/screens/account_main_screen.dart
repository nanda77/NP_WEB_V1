import 'package:flutter/material.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_buttons.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_text_field.dart';
import 'package:ninjapay/payment_gateway/home/widget/common_profile.dart';

class AccountMainScreen extends StatefulWidget {
  const AccountMainScreen({Key? key}) : super(key: key);
  @override
  _AccountMainScreenState createState() => _AccountMainScreenState();
}

class _AccountMainScreenState extends State<AccountMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgLightColor,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            width: double.infinity,
            color: darkCementColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [kBgLightColor, kBgLightColor]),
                    borderRadius: BorderRadius.circular(30),
                    color: darkBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        // spreadRadius: 10,
                        // blurRadius: 5,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text("7 days left", style: tabBarTextStyle),
                ),

                CommonProfileName()
              ],
            ),
          ),

          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("UPI Settings", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),

                Divider(),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("UPI ID", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: kGreyText),),

                        simpleTextField(
                          "eg. 0000000000@icici",
                          width: double.infinity,
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("UPI Type", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: kGreyText),),

                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                              items: [
                                DropdownMenuItem(
                                    value: "abc",
                                    child: Text("Abc")
                                )
                              ],
                              value: "abc",
                              hint: Text("Select"),
                              onChanged: (value){

                              }
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                blackBorderButton(
                    "UPDATE",
                    onTap: (){

                    }
                )

              ],
            ),
          ),

          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Profile Settings", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),

                Divider(),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your @Ninjatag", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: kGreyText),),

                        simpleTextField(
                          "@ninja",
                          width: double.infinity,
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Full Name/Business Name", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: kGreyText),),

                        simpleTextField(
                          "Enter",
                          width: double.infinity,
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Country", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: kGreyText),),

                        simpleTextField(
                          "India",
                          width: double.infinity,
                        ),
                      ],
                    ),

                  ],
                ),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email ID", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: kGreyText),),

                        simpleTextField(
                          "@ninja",
                          width: double.infinity,
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone Number", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: kGreyText),),

                        simpleTextField(
                          "Add phone",
                          width: double.infinity,
                        ),
                      ],
                    ),

                  ],
                ),

              ],
            ),
          )

        ],
      ),
    );
  }

}
