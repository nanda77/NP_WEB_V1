import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ninjapay/constants.dart';
import 'package:ninjapay/payment_gateway/home/bloc/upi/home_upi_bloc.dart';

class CommonProfileName extends StatelessWidget {
  const CommonProfileName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeUpiBloc, HomeUpiStates>(
      builder: (context, state){
        if (state is HomeUpiLoadingState) {
          return Text('loading');
        } else if (state is HomeUpiSuccessState) {
          return Row(
            children: [
              Text("Welcome, @${state.data.data?.merchantDetails?.username??""}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: VerticalDivider(width: 1, color: Colors.grey),
              ),

              CachedNetworkImage(
                imageUrl: state.data.data?.merchantDetails?.image ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  height: 50,
                  width: 50,
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
                  height: 50,
                  width: 50,
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
                  state.data.data?.merchantDetails?.fullName == null ? "" : '${(state.data.data?.merchantDetails?.fullName ?? "na").substring(0, 2).toLowerCase()}',
                      style: GoogleFonts.montserrat(
                          fontSize: 27,
                          fontWeight: FontWeight.w400,
                          color: cementTextColor),
                    )
                  ),
                ),
              )
            ],
          );
        } else if (state is HomeUpiErrorState) {
          return Row(
            children: [
              Text("Welcome, ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: VerticalDivider(width: 1, color: Colors.grey),
              ),

              CachedNetworkImage(
                imageUrl: '',
                imageBuilder: (context, imageProvider) => Container(
                  height: 50,
                  width: 50,
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
                  height: 50,
                  width: 50,
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
                      "",
                      // '${(state.response?.username ?? "").substring(0, 2).toLowerCase()}',
                      style: GoogleFonts.montserrat(
                          fontSize: 27,
                          fontWeight: FontWeight.w400,
                          color: cementTextColor),
                    )
                  ),
                ),
              )
            ],
          );
        } else {
          return Text('else');
        }
      }
    );
  }
}
