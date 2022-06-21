// To parse this JSON data, do
//
//     final serviceInfoModel = serviceInfoModelFromJson(jsonString);

import 'dart:convert';

ServiceInfoModel serviceInfoModelFromJson(String str) =>
    ServiceInfoModel.fromJson(json.decode(str));

String serviceInfoModelToJson(ServiceInfoModel data) =>
    json.encode(data.toJson());

class ServiceInfoModel {
  ServiceInfoModel({
    this.status,
    this.code,
    this.message,
    this.data,
    this.taskData,
    this.misc,
  });

  int? status;
  int? code;
  String? message;
  List<Datum>? data;
  TaskData? taskData;
  Misc? misc;

  factory ServiceInfoModel.fromJson(Map<String, dynamic> json) =>
      ServiceInfoModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        taskData: TaskData.fromJson(json["task_data"]),
        misc: Misc.fromJson(json["misc"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "task_data": taskData!.toJson(),
        "misc": misc!.toJson(),
      };
}

class Datum {
  Datum({
    this.id,
    this.taskTitle,
    this.taskDesc,
    this.volunteerLimit,
    this.estDuration,
    this.catId,
    this.locId,
    this.subId,
    this.isPopular,
    this.images,
  });

  int? id;
  String? taskTitle;
  String? taskDesc;
  int? volunteerLimit;
  int? estDuration;
  int? catId;
  dynamic locId;
  dynamic subId;
  int? isPopular;
  List<dynamic>? images;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        taskTitle: json["task_title"],
        taskDesc: json["task_desc"],
        volunteerLimit: json["volunteer_limit"],
        estDuration: json["est_duration"],
        catId: json["cat_id"],
        locId: json["loc_id"],
        subId: json["sub_id"],
        isPopular: json["is_popular"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "task_title": taskTitle,
        "task_desc": taskDesc,
        "volunteer_limit": volunteerLimit,
        "est_duration": estDuration,
        "cat_id": catId,
        "loc_id": locId,
        "sub_id": subId,
        "is_popular": isPopular,
        "images": List<dynamic>.from(images!.map((x) => x)),
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

class TaskData {
  TaskData({
    this.task,
  });

  Task? task;

  factory TaskData.fromJson(Map<String, dynamic> json) => TaskData(
        task: Task.fromJson(json["task"]),
      );

  Map<String, dynamic> toJson() => {
        "task": task!.toJson(),
      };
}

class Task {
  Task({
    this.pageCount,
    this.taskList,
  });

  int? pageCount;
  List<List<TaskList>>? taskList;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        pageCount: json["pageCount"],
        taskList: List<List<TaskList>>.from(json["taskList"].map(
            (x) => List<TaskList>.from(x.map((x) => TaskList.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "pageCount": pageCount,
        "taskList": List<dynamic>.from(
            taskList!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class TaskList {
  TaskList({
    this.taskId,
    this.serviceId,
    this.assigneeId,
    this.progress,
    this.subtaskTitle,
    this.subtaskDesc,
    this.assignName,
  });

  int? taskId;
  int? serviceId;
  int? assigneeId;
  int? progress;
  String? subtaskTitle;
  String? subtaskDesc;
  String? assignName;

  factory TaskList.fromJson(Map<String, dynamic> json) => TaskList(
        taskId: json["task_id"],
        serviceId: json["service_id"],
        assigneeId: json["assignee_id"] == null ? null : json["assignee_id"],
        progress: json["progress"] == null ? null : json["progress"],
        subtaskTitle: json["subtask_title"],
        subtaskDesc: json["subtask_desc"],
        assignName: json["assignName"] == null ? null : json["assignName"],
      );

  Map<String, dynamic> toJson() => {
        "task_id": taskId,
        "service_id": serviceId,
        "assignee_id": assigneeId == null ? null : assigneeId,
        "progress": progress == null ? null : progress,
        "subtask_title": subtaskTitle,
        "subtask_desc": subtaskDesc,
        "assignName": assignName == null ? null : assignName,
      };
}
