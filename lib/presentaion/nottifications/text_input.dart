import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String text1;
  final double? size;
  final Color? colorOfText;
  final bool? maxlines;
  const TextInput({
    this.maxlines,
    this.colorOfText,
    required this.text1,
    this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text1,
      textWidthBasis: TextWidthBasis.longestLine,
      maxLines: 2,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: colorOfText,
        fontSize: size,
        fontFamily: "Poppins",
      ),
      softWrap: maxlines,
    );
  }
}
