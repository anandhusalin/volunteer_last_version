import 'package:flutter/material.dart';

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? icon;
  final IconData? icon2;
  final VoidCallback? appbarActionButtonFunction;
  final VoidCallback? appbarLeadingButtonFunction;

  const CustomAppBar2({
    this.appbarLeadingButtonFunction,
    this.appbarActionButtonFunction,
    this.icon2,
    Key? key,
    this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          icon,
        ),
        onPressed: () {
          appbarLeadingButtonFunction!();
        },
      ),
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
