// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

PopularServiceModel homeModelFromJson(String str) =>
    PopularServiceModel.fromJson(json.decode(str));

String homeModelToJson(PopularServiceModel data) => json.encode(data.toJson());

class PopularServiceModel {
  PopularServiceModel({
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

  factory PopularServiceModel.fromJson(Map<String, dynamic> json) =>
      PopularServiceModel(
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
        "misc": misc?.toJson(),
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
  dynamic imageName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        taskTitle: json["task_title"],
        estDuration: json["est_duration"],
        imageName: json["image_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "task_title": taskTitle,
        "est_duration": estDuration,
        "image_name": imageName,
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
