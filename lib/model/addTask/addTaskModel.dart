// To parse this JSON data, do
//
//     final addTaskModel = addTaskModelFromJson(jsonString);

import 'dart:convert';

AddTaskModel addTaskModelFromJson(String str) =>
    AddTaskModel.fromJson(json.decode(str));

String addTaskModelToJson(AddTaskModel data) => json.encode(data.toJson());

class AddTaskModel {
  AddTaskModel({
    this.serviceId,
    this.subtaskTitle,
    this.subtaskDesc,
    this.taskRequirement,
  });

  String? serviceId;
  String? subtaskTitle;
  String? subtaskDesc;
  List<TaskRequirement>? taskRequirement;

  factory AddTaskModel.fromJson(Map<String, dynamic> json) => AddTaskModel(
        serviceId: json["service_id"],
        subtaskTitle: json["subtask_title"],
        subtaskDesc: json["subtask_desc"],
        taskRequirement: List<TaskRequirement>.from(
            json["task_requirement"].map((x) => TaskRequirement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "service_id": serviceId,
        "subtask_title": subtaskTitle,
        "subtask_desc": subtaskDesc,
        "task_requirement":
            List<dynamic>.from(taskRequirement!.map((x) => x.toJson())),
      };
}

class TaskRequirement {
  TaskRequirement({
    this.requirement,
    this.quantity,
    this.qtyUnit,
  });

  String? requirement;
  int? quantity;
  int? qtyUnit;

  factory TaskRequirement.fromJson(Map<String, dynamic> json) =>
      TaskRequirement(
        requirement: json["requirement"],
        quantity: json["quantity"],
        qtyUnit: json["qty_unit"],
      );

  Map<String, dynamic> toJson() => {
        "requirement": requirement,
        "quantity": quantity,
        "qty_unit": qtyUnit,
      };
}
