import 'package:flutter/material.dart';
import 'package:ninjapay/constants.dart';

class ButtonWithIcon extends StatelessWidget {
  String text, icon;
  GestureTapCallback? onTap;
  ButtonWithIcon(this.text, this.icon, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: width*0.3,
        height: 45,
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Colors.black87,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: TextStyle(fontSize: 17, color: kBgWorksColor),),

            Image.asset(icon, height: 25, width: 25,)
          ],
        ),
      ),
    );
  }
}

class SimpleButton extends StatelessWidget {
  String text;
  SimpleButton(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: 45,
      width: width*0.3,
      decoration: BoxDecoration(
        color: kBlueColor,
        borderRadius: BorderRadius.circular(35)
      ),
      child: Center(child: Text(text, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: kBgWorksColor))),
    );

  }
}

class BorderButton extends StatelessWidget {
  String text;
  BorderButton(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: 45,
      width: width*0.3,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(35),
        border: Border.all(
          color: kBlueColor,
          width: 1
        )
      ),
      child: Center(child: Text(text, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: kBlueColor))),
    );

  }
}
