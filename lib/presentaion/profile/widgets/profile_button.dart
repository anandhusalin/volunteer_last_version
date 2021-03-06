import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String text1;
  final IconData? icon;
  final void Function() buttonAction;
  const ProfileButton({
    this.icon,
    required this.text1,
    Key? key,
    required this.buttonAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonAction,
      child: Container(
        height: 45,
        width: 150,
        child: Center(
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(icon),
              const SizedBox(
                width: 10,
              ),
              Text(
                text1,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(color: Colors.grey)),
      ),
    );
  }
}
