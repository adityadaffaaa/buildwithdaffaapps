import 'package:flutter/material.dart';
import '../style/colors.dart';
import '../style/textStyle.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {super.key, this.color, this.text, this.bgcolor, this.borderColor});
  final color;
  final text;
  final bgcolor;
  final borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
          color: bgcolor,
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(32)),
      child: Center(
        child: Text(
          text,
          style: paragraph1.copyWith(color: color),
        ),
      ),
    );
  }
}
