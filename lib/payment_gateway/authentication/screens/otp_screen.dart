import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/authentication/bloc/google_auth_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/bloc/send_otp_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/screens/signup_tag_screen.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_loader.dart';
import 'package:ninjapay/payment_gateway/dashboard_screen.dart';

class OtpScreen extends StatefulWidget {
  String number, verificationCode;
  OtpScreen(this.number, this.verificationCode);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
              padding: EdgeInsets.only(top: 40, bottom: height*0.3),
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
                  Text("Enter 6-digit OTP", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  SizedBox(height: 10),
                  MultiBlocListener(
                    listeners: [
                      BlocListener<OtpBloc, OtpState>(
                        listener: (context, state) {
                          if(state is VerifyOtpLoadingState){
                            loaderDialog(context);
                          }
                          if(state is VerifyOtpSuccessState){
                            BlocProvider.of<GoogleAuthBloc>(context).add(GoogleUserExistEvent(false));
                          }
                          if(state is VerifyOtpErrorState){
                            Navigator.pop(context);
                            Fluttertoast.showToast(msg: state.errorResponse?.message ?? '');
                          }
                        },
                      ),
                      BlocListener<GoogleAuthBloc, GoogleAuthState>(
                        listener: (context, state) {
                          if (state is GoogleUserExistSuccessState) {
                            Navigator.pop(context);
                            if(state.response?.userExist!=null && state.response?.userExist==true){
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) => const DashboardScreen()), (Route<dynamic> route) => false);
                            }
                            else{
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) => const SignUpTagScreen()), (Route<dynamic> route) => false);
                            }
                          }
                          if(state is GoogleUserExistErrorState){
                            Navigator.pop(context);
                            Fluttertoast.showToast(msg: state.errorResponse.message ?? '');
                          }
                        },
                      ),
                    ],
                    child: OtpTextField(
                      numberOfFields: 6,
                      borderColor: Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      obscureText: true,
                      //runs when a code is typed in
                      enabledBorderColor: Colors.blue,
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode){
                        BlocProvider.of<OtpBloc>(context).add(VerifyOtpRefreshEvent(verificationCode, widget.verificationCode));
                        /*showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Verification Code"),
                                content: Text('Code entered is $verificationCode'),
                              );
                            }
                        );*/
                      }, // end onSubmit
                    )
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
