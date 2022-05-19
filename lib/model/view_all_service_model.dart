// To parse this JSON data, do
//
//     final viewAllModel = viewAllModelFromJson(jsonString);

import 'dart:convert';

ViewAllModel viewAllModelFromJson(String str) =>
    ViewAllModel.fromJson(json.decode(str));

String viewAllModelToJson(ViewAllModel data) => json.encode(data.toJson());

class ViewAllModel {
  ViewAllModel({
    this.status,
    this.code,
    this.message,
    this.data,
    this.misc,
  });

  int? status;
  int? code;
  String? message;
  List<List<Datum>>? data;
  Misc? misc;

  factory ViewAllModel.fromJson(Map<String, dynamic> json) => ViewAllModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<List<Datum>>.from(json["data"]
            .map((x) => List<Datum>.from(x.map((x) => Datum.fromJson(x))))),
        misc: Misc.fromJson(json["misc"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(
            data!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "misc": misc!.toJson(),
      };
}

class Datum {
  Datum({
    this.id,
    this.taskTitle,
    this.estDuration,
    this.imageName,
  });

  int? id;
  String? taskTitle;
  int? estDuration;
  String? imageName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        taskTitle: json["task_title"],
        estDuration: json["est_duration"],
        imageName: json["image_name"] == null ? null : json["image_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "task_title": taskTitle,
        "est_duration": estDuration,
        "image_name": imageName == null ? null : imageName,
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
