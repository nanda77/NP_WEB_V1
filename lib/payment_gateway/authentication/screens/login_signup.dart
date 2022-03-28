import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ninjapay/app_utils.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/authentication/bloc/google_auth_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/bloc/send_email_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/bloc/send_otp_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/screens/main_sent_screen.dart';
import 'package:ninjapay/payment_gateway/authentication/screens/otp_screen.dart';
import 'package:ninjapay/payment_gateway/authentication/screens/signup_tag_screen.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_buttons.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_loader.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_text_field.dart';
import 'package:ninjapay/payment_gateway/dashboard_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? country, phoneCode;
  AppUtils appUtils = AppUtils();

  @override
  void initState() {
    super.initState();
    getCountry();
  }

  getCountry() async {
    await appUtils.getCountry().then((value) {
      setState(() {
        print(value);
        country = value;
      });
    });
    await appUtils.getPhoneCode().then((value) {
      setState(() {
        print(value);
        phoneCode = "+$value";
      });
    });
  }

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

            Text("Welcome!", style: TextStyle(fontSize: 14, color: kGreyText)),

            Container(
              width: width*0.5,
              height: height*0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 1,
                  color: kGreyTextColor
                )
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text("Phone Number or", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: kGreyText)),
                          ),

                          simpleTextField(
                            "number",
                            controller: phoneController,
                            width: double.infinity,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(top: 12, left: 5, right: 5, bottom: 12),
                              child: Text("$phoneCode", style: TextStyle(color: Colors.black, fontSize: 14),),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(top: 50, bottom: 10),
                            child: Text("Email", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: kGreyText)),
                          ),

                          simpleTextField(
                            "",
                            controller: emailController,
                            width: double.infinity,
                          ),

                          MultiBlocListener(
                            listeners: [
                              BlocListener<GoogleAuthBloc, GoogleAuthState>(
                                listener: (context, state) {
                                  if (state is GoogleAuthLoadingState) {
                                    loaderDialog(context);
                                  }
                                  if (state is GoogleAuthSuccessState) {
                                    BlocProvider.of<GoogleAuthBloc>(context).add(GoogleUserExistEvent(false));
                                  }
                                  if(state is GoogleAuthErrorState){
                                    Navigator.pop(context);
                                    Fluttertoast.showToast(msg: state.errorResponse?.message ?? '');
                                  }
                                },
                              ),

                              BlocListener<GoogleAuthBloc, GoogleAuthState>(
                                listener: (context, state) {
                                  if (state is GoogleUserExistSuccessState) {
                                    try{
                                      Navigator.pop(context);
                                      if(state.response?.userExist!=null && state.response?.userExist==true){
                                        print("old user");
                                        Navigator.of(context).pushAndRemoveUntil(
                                            MaterialPageRoute(builder: (context) => const DashboardScreen()), (Route<dynamic> route) => false);
                                      }
                                      else{
                                        print("new user");
                                        Navigator.of(context).pushAndRemoveUntil(
                                            MaterialPageRoute(builder: (context) => const SignUpTagScreen()), (Route<dynamic> route) => false);
                                      }
                                    }
                                    catch(e){
                                      print(e);
                                    }
                                  }
                                  if(state is GoogleUserExistErrorState){
                                    Navigator.pop(context);
                                    Fluttertoast.showToast(msg: state.errorResponse.message ?? '');
                                  }
                                },
                              ),
                            ],
                            child: InkWell(
                              onTap: (){
                                BlocProvider.of<GoogleAuthBloc>(context).add(GoogleLoginEvent());
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 30),
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: kGreyTextColor,
                                        width: 1
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/google_logo.png", height: 25, width: 25),
                                    SizedBox(width: 10),
                                    Text("Use Google", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),)
                                  ],
                                ),
                              ),
                            ),
                          ),


                          MultiBlocListener(
                            listeners: [
                              BlocListener<OtpBloc, OtpState>(
                                listener: (context, state) {
                                  if (state is SendOtpLoadingState) {
                                    loaderDialog(context);
                                  }
                                  if (state is SendOtpSuccessState) {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (context) => OtpScreen("$phoneCode${phoneController.text.trim()}", /*state.response?.verificationId??*/"")), (Route<dynamic> route) => false);
                                  }
                                  if(state is SendOtpErrorState){
                                    Navigator.pop(context);
                                    Fluttertoast.showToast(msg: state.errorResponse?.message ?? '');
                                  }
                                },
                              ),

                              BlocListener<EmailBloc, EmailState>(
                                listener: (context, state) {
                                  if (state is SendEmailLoadingState) {
                                    loaderDialog(context);
                                  }
                                  if (state is SendEmailSuccessState) {
                                    Navigator.pop(context);
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (context) => MailSentScreen(emailController.text.trim())), (Route<dynamic> route) => false);
                                  }
                                  if(state is SendEmailErrorState){
                                    Navigator.pop(context);
                                    Fluttertoast.showToast(msg: state.errorResponse?.message ?? '');
                                  }
                                }
                              )
                            ],
                            child: blueRoundButton(
                              "NEXT",
                              onTap: (){
                                if(phoneController.text.trim().isNotEmpty){
                                  BlocProvider.of<OtpBloc>(context).add(SendOtpRefreshEvent("$phoneCode"+phoneController.text.trim()));
                                }
                                else if(emailController.text.trim().isNotEmpty){
                                  BlocProvider.of<EmailBloc>(context).add(SendEmailRefreshEvent(emailController.text.trim()));
                                }
                                else{
                                  Fluttertoast.showToast(msg: "Please enter phone or email!");
                                }
                              }
                            )
                          ),

                        ],
                      ),
                    )
                  ),

                  Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBgWorksColor,
                          border: Border(
                            left: BorderSide(width: 1, color: kGreyTextColor)
                          )
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Text("Login with Qr code", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                            ),

                            QrImage(
                              data: "something went wrong!",
                              version: QrVersions.auto,
                              size: 220,
                              gapless: false,
                              backgroundColor: Colors.white,
                              errorStateBuilder: (cxt, err) {
                                return Container(
                                  child: Center(
                                    child: Text(
                                      "Uh oh! Something went wrong...",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              },
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text("Scan the code using the inapp\nQr code reader", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400), textAlign: TextAlign.center,),
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kGreyTextColor,
                                  width: 2
                                ),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text("Download the App", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                            ),
                            
                          ],
                        ),
                      )
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
