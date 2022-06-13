// To parse this JSON data, do
//
//     final serviceInformationModel = serviceInformationModelFromJson(jsonString);

import 'dart:convert';

ServiceInformationModel serviceInformationModelFromJson(String str) =>
    ServiceInformationModel.fromJson(json.decode(str));

String serviceInformationModelToJson(ServiceInformationModel data) =>
    json.encode(data.toJson());

class ServiceInformationModel {
  ServiceInformationModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  int? status;
  int? code;
  String? message;
  Data? data;

  factory ServiceInformationModel.fromJson(Map<String, dynamic> json) =>
      ServiceInformationModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.volunteers,
    this.task,
  });

  Volunteers? volunteers;
  Task? task;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        volunteers: Volunteers.fromJson(json["volunteers"]),
        task: Task.fromJson(json["task"]),
      );

  Map<String, dynamic> toJson() => {
        "volunteers": volunteers?.toJson(),
        "task": task?.toJson(),
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
        assigneeId: json["assignee_id"],
        progress: json["progress"],
        subtaskTitle: json["subtask_title"],
        subtaskDesc: json["assignName"],
        assignName: json["assignName"],
      );

  Map<String, dynamic> toJson() => {
        "task_id": taskId,
        "service_id": serviceId,
        "assignee_id": assigneeId,
        "progress": progress,
        "subtask_title": subtaskTitle,
        "subtask_desc": subtaskDesc,
        "assignName": subtaskDesc,
      };
}

class Volunteers {
  Volunteers({
    this.pageCount,
    this.voluteerList,
  });

  int? pageCount;
  List<List<VoluteerList>>? voluteerList;

  factory Volunteers.fromJson(Map<String, dynamic> json) => Volunteers(
        pageCount: json["pageCount"],
        voluteerList: List<List<VoluteerList>>.from(json["voluteerList"].map(
            (x) => List<VoluteerList>.from(
                x.map((x) => VoluteerList.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "pageCount": pageCount,
        "voluteerList": List<dynamic>.from(voluteerList!
            .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class VoluteerList {
  VoluteerList({
    this.userSerId,
    this.userId,
    this.name,
    this.imageName,
  });

  int? userSerId;
  int? userId;
  String? name;
  String? imageName;

  factory VoluteerList.fromJson(Map<String, dynamic> json) => VoluteerList(
        userSerId: json["user_ser_id"],
        userId: json["user_id"],
        name: json["name"],
        imageName: json["image_name"],
      );

  Map<String, dynamic> toJson() => {
        "user_ser_id": userSerId,
        "user_id": userId,
        "name": name,
        "image_name": imageName,
      };
}
