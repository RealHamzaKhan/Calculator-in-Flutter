import 'package:flutter/material.dart';
import 'package:calculator/constants.dart';
class MyButton extends StatelessWidget {
  MyButton(this.text,this.buttonColor,this.onPress);
  final String text;
  final Color buttonColor;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: buttonBackgroundColor,
        ),
        child: Center(child: Text(text,style:  TextStyle(color: buttonColor,fontSize: 25,fontWeight: FontWeight.w600),)),
      ),
    );
  }
}
