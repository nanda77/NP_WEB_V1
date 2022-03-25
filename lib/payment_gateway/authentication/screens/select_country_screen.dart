import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninjapay/app_utils.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/authentication/screens/country_bottomsheet.dart';
import 'package:ninjapay/payment_gateway/authentication/screens/login_signup.dart';
import 'package:ninjapay/tipsmodule/widgets/button_with_icon.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  _SelectCountryScreenState createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBgLightColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              width: double.infinity,
              color: darkCementColor,
              child: SvgPicture.asset(
                'assets/images/img_ninja_pay_text.svg',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //img_profile.svg

            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 50),
              child: Text("Login/SignUp", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 27),),
            ),

            Container(
              padding: EdgeInsets.only(top: 40, bottom: height*0.3, left: 50, right: 50),
              width: width*0.35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      width: 1,
                      color: kGreyTextColor
                  )
              ),
              child: Column(
                children: [
                  Text("Select Country", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  SizedBox(height: 30),

                  /*InkWell(
                    onTap: (){
                      print("vivek");
                      showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                          flagSize: 25,
                          backgroundColor: Colors.white,
                          textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
                          //Optional. Sets the border radius for the bottomsheet.
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          //Optional. Styles the search field.
                          inputDecoration: InputDecoration(
                            labelText: 'Search',
                            hintText: 'Start typing to search',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFF8C98A8).withOpacity(0.2),
                              ),
                            ),
                          ),
                        ),
                        onSelect: (Country country) => print('Select country: ${country.displayName}'),
                      );
                    },
                    child: simpleTextField(
                      "--Select country--",
                      width: double.infinity,
                      enabled: false
                    ),
                  ),*/

                  /*CountryCodePicker(
                    onChanged: print,
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: 'IT',
                    favorite: ['+39','FR'],
                    // optional. Shows only country name and flag
                    showCountryOnly: false,
                    // optional. Shows only country name and flag when popup is closed.
                    showOnlyCountryWhenClosed: false,
                    // optional. aligns the flag and the Text left
                    alignLeft: false,
                  )*/

                  SizedBox(
                    width: width * 0.6,
                    child: SimpleButton(
                      "GET STARTED",
                      onTap: () {
                        _showCountry();
                      },
                    ),
                  ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  void _showCountry() {
    AppUtils appUtils = AppUtils();
    countryBottomSheet(context, onClosed: () {
      Future.delayed(const Duration(milliseconds: 100), () async {
        appUtils.getCountry().then((countryName) {
          if (countryName.isNotEmpty) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginSignUpScreen()));
          }
        });
      });
    });
  }

}
