import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? icon2;
  final VoidCallback? appbarActionButtonFunction;

  const CustomAppBar({
    this.appbarActionButtonFunction,
    this.icon2,
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.blue,
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 23,
            fontFamily: 'Poppins'),
      ),
      centerTitle: true,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              appbarActionButtonFunction;
            },
            icon: Icon(
              icon2,
              color: Colors.white,
              size: 30,
            )),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
