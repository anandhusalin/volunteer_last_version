import 'package:bloc_volunteer_service/presentaion/infoPage/screen_info.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/drowerpage.dart';
import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import 'chat_page.dart';

class Chat extends StatefulWidget {
  final serviceTitle;
  final serviceId;
  const Chat({Key? key, required this.serviceTitle, required this.serviceId})
      : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: buildAppBar(),
      // drawer: DrowerPage(),
      backgroundColor: backgroundColor,
      body: ChatPage(),
    );
  }

  buildAppBar() {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.blue,
      title: Text(
        widget.serviceTitle,
        style: const TextStyle(
            color: backgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InfoScreen()));
            },
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 30,
            )),
      ],
    );
  }
}
