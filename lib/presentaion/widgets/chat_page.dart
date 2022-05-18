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

  Widget _chatMessages() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return SizedBox(
          height: 600,
          child: ListView.builder(
              itemCount: messageList.length,
              itemBuilder: (context, index) {
                return MessageTiles(obj: messageList[index]);
              }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _chatMessages(),
        Container(
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Material(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(100)),
                      child: TextField(
                        controller: messageEditingController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            hintText: "    Send a message...",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                      child: Icon(Icons.send, color: Colors.white)),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
