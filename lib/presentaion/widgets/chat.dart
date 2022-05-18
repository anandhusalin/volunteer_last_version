import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import 'chat_page.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      // drawer: DrowerPage(),
      backgroundColor: backgroundColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Container(
            height: 110,
            color: primaryColor,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: backgroundColor,
                            size: 25,
                          )),
                      const SizedBox(),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Anandhu',
                            style: TextStyle(
                                color: backgroundColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(),
                      IconButton(
                        onPressed: () {
                          _scaffoldState.currentState?.openDrawer();
                        },
                        icon: const Icon(Icons.menu_outlined),
                        iconSize: 24,
                        color: backgroundColor,
                      ),
                      const SizedBox(),
                    ]),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                height: 50,
                color: primaryColor,
              ),
              Positioned(
                  child: Container(
                decoration: const BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                height: MediaQuery.of(context).size.height - 110,
                width: MediaQuery.of(context).size.width,
                child: const ChatPage(),
              ))
            ],
          )
        ]),
      ),
    );
  }
}
