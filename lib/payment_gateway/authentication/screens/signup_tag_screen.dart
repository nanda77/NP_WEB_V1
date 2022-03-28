import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ninjapay/app_utils.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/authentication/bloc/register_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/bloc/user_name_check_bloc.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_buttons.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_loader.dart';
import 'package:ninjapay/payment_gateway/common_component/custom_text_field.dart';
import 'package:ninjapay/payment_gateway/dashboard_screen.dart';

class SignUpTagScreen extends StatefulWidget {
  const SignUpTagScreen({Key? key}) : super(key: key);

  @override
  _SignUpTagScreenState createState() => _SignUpTagScreenState();
}

class _SignUpTagScreenState extends State<SignUpTagScreen> {
  TextEditingController nameController = TextEditingController();

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
              child: Text("SignUp", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 27),),
            ),

            Text("Your unique name for getting paid by anyone", style: TextStyle(fontSize: 14, color: Colors.grey)),

            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(top: 40, bottom: 20, left: width*0.07, right: width*0.07),
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
                  Text("Create Ninjatag", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  SizedBox(height: 10),

                  simpleTextField(
                    "",
                    width: double.infinity,
                    controller: nameController
                  ),

                  SizedBox(height: height*0.2),

                  MultiBlocListener(
                    listeners: [
                      BlocListener<UserNameCheckBloc, UserNameCheckState>(
                        listener: (context, state){
                          if(state is UserNameCheckLoadingState){
                            loaderDialog(context);
                          }
                          if(state is UserNameCheckSuccessState){
                            if(state.response?.message?.toLowerCase()  == "username available"){
                              AppUtils().setUserName(nameController.text.trim());
                              BlocProvider.of<RegisterBloc>(context).add(RegisterRefreshEvent(nameController.text));
                              print("Available");
                            }
                            else{
                              Navigator.pop(context);
                              print("Not Available");
                              Fluttertoast.showToast(msg: state.response?.message??"");
                            }
                          }
                          if(state is UserNameCheckErrorState){
                            Navigator.pop(context);
                            Fluttertoast.showToast(msg: state.errorMessage);
                          }
                        }
                      ),

                      BlocListener<RegisterBloc, RegisterState>(
                          listener: (context, state){
                            if(state is RegisterLoadingState){
                            }
                            if(state is RegisterSuccessState){
                              Navigator.pop(context);
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) => const DashboardScreen()), (Route<dynamic> route) => false);
                            }
                            if(state is RegisterErrorState){
                              Navigator.pop(context);
                              Fluttertoast.showToast(msg: state.errorMessage);
                            }
                          }
                      )
                    ],
                    child: blueRoundButton("DONE", width: width*0.15, onTap: (){
                      if(nameController.text.trim().isEmpty){
                        Fluttertoast.showToast(msg: "Please Enter Name!");
                      }
                      else{
                        if(nameController.text.trim().length < 5 || nameController.text.trim().length > 18){
                          Fluttertoast.showToast(msg: "username length should be > 5 and < 18!");
                        }
                        else{
                          BlocProvider.of<UserNameCheckBloc>(context).add(UserNameCheckRefreshEvent(nameController.text));
                        }
                      }
                    })
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
