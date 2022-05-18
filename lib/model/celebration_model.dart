// To parse this JSON data, do
//
//     final celebrationModel = celebrationModelFromJson(jsonString);

import 'dart:convert';

List<CelebrationModel> celebrationModelFromJson(String str) => List<CelebrationModel>.from(json.decode(str).map((x) => CelebrationModel.fromJson(x)));

String celebrationModelToJson(List<CelebrationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CelebrationModel {
  CelebrationModel({
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

  factory CelebrationModel.fromJson(Map<String, dynamic> json) => CelebrationModel(
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
