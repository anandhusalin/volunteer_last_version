// To parse this JSON data, do
//
//     final celebrationDetailModel = celebrationDetailModelFromJson(jsonString);

import 'dart:convert';

CelebrationDetailModel celebrationDetailModelFromJson(String str) =>
    CelebrationDetailModel.fromJson(json.decode(str));

String celebrationDetailModelToJson(CelebrationDetailModel data) =>
    json.encode(data.toJson());

class CelebrationDetailModel {
  CelebrationDetailModel({
    this.status,
    this.code,
    this.message,
    this.data,
    this.misc,
  });

  int? status;
  int? code;
  String? message;
  Data? data;
  Misc? misc;

  factory CelebrationDetailModel.fromJson(Map<String, dynamic> json) =>
      CelebrationDetailModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        misc: Misc.fromJson(json["misc"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": data!.toJson(),
        "misc": misc!.toJson(),
      };
}

class Data {
  Data({
    this.sId,
    this.taskTitle,
    this.taskDesc,
    this.serImage,
    this.startDate,
    this.endDate,
    this.nofDateTaken,
    this.taskList,
  });

  int? sId;
  String? taskTitle;
  String? taskDesc;
  dynamic? serImage;
  DateTime? startDate;
  DateTime? endDate;
  String? nofDateTaken;
  List<TaskList>? taskList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sId: json["sId"],
        taskTitle: json["task_title"],
        taskDesc: json["task_desc"],
        serImage: json["ser_image"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        nofDateTaken: json["nof_date_taken"],
        taskList: List<TaskList>.from(
            json["task_list"].map((x) => TaskList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sId": sId,
        "task_title": taskTitle,
        "task_desc": taskDesc,
        "ser_image": serImage,
        "start_date": startDate!.toIso8601String(),
        "end_date": endDate!.toIso8601String(),
        "nof_date_taken": nofDateTaken,
        "task_list": List<dynamic>.from(taskList!.map((x) => x.toJson())),
      };
}

class TaskList {
  TaskList({
    this.taskId,
    this.comments,
    this.subtaskTitle,
    this.subtaskDesc,
  });

  int? taskId;
  String? comments;
  String? subtaskTitle;
  String? subtaskDesc;

  factory TaskList.fromJson(Map<String, dynamic> json) => TaskList(
        taskId: json["task_id"],
        comments: json["comments"],
        subtaskTitle: json["subtask_title"],
        subtaskDesc: json["subtask_desc"],
      );

  Map<String, dynamic> toJson() => {
        "task_id": taskId,
        "comments": comments,
        "subtask_title": subtaskTitle,
        "subtask_desc": subtaskDesc,
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
