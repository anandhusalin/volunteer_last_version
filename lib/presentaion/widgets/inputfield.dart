import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  Inputfield({
    Key? key,
    required this.height,
    required this.controller,
    required this.title,
    required this.hint,
    this.keyBoardType = TextInputType.multiline,
  }) : super(key: key);
  final double height;
  final TextEditingController controller;
  final String title;
  final String hint;
  TextInputType keyBoardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(width: 2, color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextFormField(
              keyboardType: keyBoardType,
              maxLines: null,
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
