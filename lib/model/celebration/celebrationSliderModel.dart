// To parse this JSON data, do
//
//     final celebrationSliderModel = celebrationSliderModelFromJson(jsonString);

import 'dart:convert';

CelebrationSliderModel celebrationSliderModelFromJson(String str) =>
    CelebrationSliderModel.fromJson(json.decode(str));

String celebrationSliderModelToJson(CelebrationSliderModel data) =>
    json.encode(data.toJson());

class CelebrationSliderModel {
  CelebrationSliderModel({
    this.status,
    this.code,
    this.message,
    this.data,
    this.misc,
  });

  int? status;
  int? code;
  String? message;
  List<Datum>? data;
  Misc? misc;

  factory CelebrationSliderModel.fromJson(Map<String, dynamic> json) =>
      CelebrationSliderModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        misc: Misc.fromJson(json["misc"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "misc": misc!.toJson(),
      };
}

class Datum {
  Datum({
    this.userId,
    this.name,
    this.serviceId,
    this.taskTitle,
    this.taskDesc,
  });

  int? userId;
  String? name;
  int? serviceId;
  String? taskTitle;
  String? taskDesc;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["user_id"],
        name: json["name"],
        serviceId: json["service_id"],
        taskTitle: json["task_title"],
        taskDesc: json["task_desc"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "service_id": serviceId,
        "task_title": taskTitle,
        "task_desc": taskDesc,
      };
}

class Misc {
  Misc({
    this.imagePlaceholder,
  });

  String? imagePlaceholder;

  factory Misc.fromJson(Map<String, dynamic> json) => Misc(
        imagePlaceholder: json["image_placeholder"],
      );

  Map<String, dynamic> toJson() => {
        "image_placeholder": imagePlaceholder,
      };
}
