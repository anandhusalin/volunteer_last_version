import 'dart:convert';

import 'package:bloc_volunteer_service/model/chat/chatModel.dart';
import 'package:bloc_volunteer_service/services/apiService.dart';
import 'package:flutter/cupertino.dart';

class ChatProvider with ChangeNotifier {
  var _chatList = null;
  ChatModel get chatList => _chatList;

  bool _busy = false;
  bool get busy => _busy;
  setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  // get chat list
  Future<ChatModel> getChat(serviceId) async {
    setBusy(true);
    var response = await ApiService().gatData('/get-chat/$serviceId');
    if (response.statusCode == 200) {
      var jsonMap = jsonDecode(response.body);
      _chatList = ChatModel.fromJson(jsonMap);

      notifyListeners();
      setBusy(false);
    }
    return _chatList;
  }

//send msg
  Future<bool> sendMessage(service_id, message) async {
    var now = DateTime.now();
    var data = {
      'service_id': service_id.toString(),
      'message': message,
      'sent_on': now.toIso8601String()
    };
    setBusy(true);
    var response = await ApiService().postData(data, '/start-chat');
    var body = json.decode(response.body);
    if (response.statusCode == 200 && body['status'] == 1) {
      setBusy(false);
      return true;
    } else {
      setBusy(false);
      return false;
    }
  }
}
