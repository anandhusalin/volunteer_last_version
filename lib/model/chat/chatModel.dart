// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  ChatModel({
    this.message,
    this.data,
  });

  String? message;
  List<ChatDatum>? data;

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        message: json["message"],
        data: List<ChatDatum>.from(
            json["data"].map((x) => ChatDatum.fromJson(x))),
      );

  get length => null;

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ChatDatum {
  ChatDatum({
    this.userId,
    this.name,
    this.message,
    this.attachment,
    this.sentOn,
    this.readbyAll,
    this.markAsSpam,
    this.active,
    this.isUser,
  });

  int? userId;
  String? name;
  String? message;
  String? attachment;
  String? sentOn;
  int? readbyAll;
  int? markAsSpam;
  int? active;
  bool? isUser;

  factory ChatDatum.fromJson(Map<String, dynamic> json) => ChatDatum(
        userId: json["userId"],
        name: json["name"],
        message: json["message"],
        attachment: json["attachment"] == null ? null : json["attachment"],
        sentOn: json["sent_on"],
        readbyAll: json["readby_all"],
        markAsSpam: json["mark_as_spam"],
        active: json["active"],
        isUser: json["isUser"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "message": message,
        "attachment": attachment == null ? null : attachment,
        "sent_on": sentOn,
        "readby_all": readbyAll,
        "mark_as_spam": markAsSpam,
        "active": active,
        "isUser": isUser,
      };
}
