import 'package:flutter/material.dart';

import 'message_model_tiles.dart';
import 'message_tile.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<MessageTilesModel> messageList = [
    MessageTilesModel(message: 'Hai', sender: "anandhu", sentByMe: true),
    MessageTilesModel(message: 'Hello', sender: "anandhu", sentByMe: true),
    MessageTilesModel(
        message: 'How are you', sender: "nithin", sentByMe: false),
    MessageTilesModel(message: 'fine', sender: "anandhu", sentByMe: true),
    MessageTilesModel(message: 'hai', sender: "nithin", sentByMe: false),
    MessageTilesModel(message: 'how are you', sender: "anadhu", sentByMe: true),
    MessageTilesModel(message: 'ooo', sender: "anadhu", sentByMe: true),
    MessageTilesModel(
        message:
            'oonkjfidjfskjfskjfsfuhskjdifajlfkjaofiajsifjjofksjfhoskfnasifskjfaskjfn iasifjasiuf hfiuhds o',
        sender: "anadhu",
        sentByMe: true),
    MessageTilesModel(message: 'ooo', sender: "anadhu", sentByMe: true),
    MessageTilesModel(message: 'how are you', sender: "anadhu", sentByMe: true),
    MessageTilesModel(message: 'welcome', sender: "anadhu", sentByMe: false),
    MessageTilesModel(message: 'how are you', sender: "anadhu", sentByMe: true),
    MessageTilesModel(
        message: 'what can i do for you', sender: "anadhu", sentByMe: false),
    MessageTilesModel(message: 'thank you', sender: "anadhu", sentByMe: false),
    MessageTilesModel(message: 'hai', sender: "anadhu", sentByMe: true),
    MessageTilesModel(
        message: 'Good morning', sender: "anadhu", sentByMe: false),
    MessageTilesModel(message: 'break fast', sender: "anadhu", sentByMe: true),
    MessageTilesModel(message: 'ooo', sender: "jk", sentByMe: false),
    MessageTilesModel(message: 'how are you', sender: "anadhu", sentByMe: true),
    MessageTilesModel(message: 'hello', sender: "jk", sentByMe: false),
    MessageTilesModel(message: 'fine', sender: "anadhu", sentByMe: true),
  ];

  TextEditingController messageEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[],
    );
  }
}
