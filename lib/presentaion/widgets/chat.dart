// import 'dart:async';

// import 'package:bloc_volunteer_service/presentaion/infoPage/screen_info.dart';
// import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
// import 'package:bloc_volunteer_service/presentaion/widgets/drowerpage.dart';
// import 'package:bloc_volunteer_service/presentaion/widgets/message_model_tiles.dart';
// import 'package:bloc_volunteer_service/presentaion/widgets/message_tile.dart';
// import 'package:bloc_volunteer_service/provider/chat/ChatProvider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../core/colors/colors.dart';
// import 'chat_page.dart';

// class Chat extends StatefulWidget {
//   final serviceTitle;
//   final serviceId;
//   const Chat({Key? key, required this.serviceTitle, required this.serviceId})
//       : super(key: key);

//   @override
//   _ChatState createState() => _ChatState();
// }

// class _ChatState extends State<Chat> {
//   final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();

//   Timer? timer;
//   ScrollController _controller = ScrollController();
//   TextEditingController messageEditingController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     // loadData();
//     // timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
//     //   print('hello');
//     //   loadData();
//     // });
//   }

//   loadData() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<ChatProvider>(context, listen: false)
//           .getChat(widget.serviceId);
//       if (_controller.hasClients) {
//         _controller.jumpTo(_controller.position.maxScrollExtent + 35);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     timer!.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: _scaffoldState,
//         appBar: buildAppBar(),
//         backgroundColor: backgroundColor,
//         body: Consumer<ChatProvider>(builder: (context, value, child) {
//           return value.chatList != null
//               ? Column(
//                   children: [
//                     Expanded(
//                       child: ListView.builder(
//                         controller: _controller,
//                         itemCount: value.chatList!.data!.length,
//                         itemBuilder: (context, index) {
//                           return MessageTiles(
//                               obj: value.chatList!.data![index]);
//                         },
//                       ),
//                     ),
//                     buildChatTyping(value),
//                   ],
//                 )
//               : Center();
//         }));
//   }

//   buildAppBar() {
//     return AppBar(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           bottom: Radius.circular(20),
//         ),
//       ),
//       backgroundColor: Colors.blue,
//       title: Text(
//         widget.serviceTitle,
//         style: const TextStyle(
//             color: backgroundColor, fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//       elevation: 0,
//       actions: [
//         IconButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => InfoScreen(
//                             serviceId: widget.serviceId,
//                           )));
//             },
//             icon: Icon(
//               Icons.info_outline,
//               color: Colors.white,
//               size: 30,
//             )),
//       ],
//     );
//   }

//   buildChatTyping(provider) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
//         color: Colors.white,
//         child: Row(
//           children: <Widget>[
//             Expanded(
//               child: Material(
//                 borderRadius: const BorderRadius.all(Radius.circular(50)),
//                 elevation: 10,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(100)),
//                   child: TextField(
//                     controller: messageEditingController,
//                     style: const TextStyle(
//                       color: Colors.black,
//                     ),
//                     decoration: const InputDecoration(
//                         contentPadding: EdgeInsets.only(left: 10),
//                         hintText: "Send a message...",
//                         hintStyle: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16,
//                         ),
//                         border: InputBorder.none),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12.0),
//             InkWell(
//               onTap: () async {
//                 FocusScope.of(context).requestFocus(FocusNode());
//                 if (messageEditingController.text.isEmpty) return;
//                 var res = await provider.sendMessage(
//                     widget.serviceId, messageEditingController.text.trim());
//                 if (res) {
//                   messageEditingController.clear();
//                   loadData();
//                 }
//               },
//               child: Container(
//                 height: 50.0,
//                 width: 50.0,
//                 decoration: BoxDecoration(
//                     color: Colors.blueAccent,
//                     borderRadius: BorderRadius.circular(50)),
//                 child: Center(
//                     child: provider.busy
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Icon(Icons.send, color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/presentaion/infoPage/screen_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Chat extends StatelessWidget {
  final serviceTitle;
  final serviceId;
  const Chat({Key? key, this.serviceTitle, this.serviceId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.blue,
        title: Text(
          serviceTitle,
          style: const TextStyle(
              color: backgroundColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InfoScreen(
                              serviceId: serviceId,
                            )));
              },
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 30,
              )),
        ],
      ),
    );
  }
}
