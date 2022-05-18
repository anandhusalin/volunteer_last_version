import 'package:flutter/material.dart';

import 'text_input.dart';

class WithoutIconWidget extends StatelessWidget {
  final String text2;

  final String time;

  final String? paraBold;
  final String? paragraph;

  const WithoutIconWidget({
    required this.time,
    this.paragraph,
    this.paraBold,
    required this.text2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextInput(text1: text2, colorOfText: Colors.red, size: 18),
                TextInput(text1: time, colorOfText: Colors.grey, size: 10),
              ],
            ),
            const Icon(Icons.more_horiz)
          ],
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: paraBold,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: "Poppins")),
              TextSpan(
                  text: paragraph,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: "Poppins")),
            ],
          ),
        )
      ],
    );
  }
}
