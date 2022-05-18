import 'package:flutter/material.dart';

import 'message_model_tiles.dart';

class MessageTiles extends StatelessWidget {
  const MessageTiles({
    Key? key,
    required this.obj,
  }) : super(key: key);
  final MessageTilesModel obj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: obj.sentByMe ? 0 : 28,
          right: obj.sentByMe ? 28 : 0),
      alignment: obj.sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: obj.sentByMe
            ? const EdgeInsets.only(left: 30)
            : const EdgeInsets.only(right: 30),
        padding: const EdgeInsets.only(top: 6, bottom: 6, left: 20, right: 40),
        decoration: BoxDecoration(
          borderRadius: obj.sentByMe
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
          color: obj.sentByMe ? Colors.blueAccent : Colors.grey[700],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(obj.sender.toUpperCase(),
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
