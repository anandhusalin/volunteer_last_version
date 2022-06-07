import 'package:bloc_volunteer_service/model/chat/chatModel.dart';
import 'package:flutter/material.dart';

import 'message_model_tiles.dart';

class MessageTiles extends StatelessWidget {
  const MessageTiles({
    Key? key,
    required this.obj,
  }) : super(key: key);
  final obj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: obj.isUser ? 0 : 28,
          right: obj.isUser ? 28 : 0),
      alignment: obj.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: obj.isUser
            ? const EdgeInsets.only(left: 30)
            : const EdgeInsets.only(right: 30),
        padding: const EdgeInsets.only(top: 6, bottom: 6, left: 20, right: 40),
        decoration: BoxDecoration(
          borderRadius: obj.isUser
              ? const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))
              : const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
          color: obj.isUser ? Colors.blueAccent : Colors.grey[700],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(obj.name.toUpperCase(),
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: -0.5)),
            const SizedBox(height: 7.0),
            Text(obj.message,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 15.0, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
