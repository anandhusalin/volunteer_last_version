import 'package:bloc_volunteer_service/presentaion/nottifications/text_input.dart';
import 'package:flutter/material.dart';

class WithIconWidget extends StatelessWidget {
  final String text2;
  final Color color1;
  final String? image1;
  final String parabold;
  final String paragraph;
  final String time;

  const WithIconWidget({
    required this.time,
    required this.parabold,
    required this.paragraph,
    this.image1,
    required this.color1,
    required this.text2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
                backgroundColor: color1,
                radius: 20,
                child: Image.asset(image1!)),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width - 107,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextInput(text1: text2, colorOfText: Colors.red, size: 18),
                  TextInput(text1: time, colorOfText: Colors.grey, size: 10),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: parabold,
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
                  ),
                  // Expanded(child: TextInput(text1: textonparagraph))
                ],
              ),
            ),
          ],
        ),
        const Icon(Icons.more_horiz)
      ],
    );
  }
}
