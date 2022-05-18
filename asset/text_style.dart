import 'package:flutter/material.dart';
class TextStyleWidget extends StatelessWidget {
  final String text ;
  final double fontSize;



   TextStyleWidget({Key? key,
     required this.fontSize,
  required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      fontFamily: 'Poppins'
    ),);
  }
}
