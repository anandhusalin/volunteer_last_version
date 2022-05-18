// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'dart:convert';

ServiceModel serviceModelFromJson(String str) =>
    ServiceModel.fromJson(json.decode(str));

String serviceModelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
  ServiceModel({
    this.estimatedTime,

    this.taskTitle,
    this.taskDesc,
    this.volunteerLimit,
    this.issueTitle,
    this.issueLoc,
    this.issueDesc,

  });

  String? taskTitle;
  String? taskDesc;
  int? volunteerLimit;
  String? issueTitle;
  String? issueLoc;
  String? issueDesc;
  int? estimatedTime;



  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        taskTitle: json["task_title"],
    estimatedTime: json["est_duration"],
        taskDesc: json["task_desc"],
        volunteerLimit: json["volunteer_limit"],
        issueTitle: json["issue_title"],
        issueLoc: json["issue_loc"],
        issueDesc: json["issue_desc"],
      );

  Map<String, dynamic> toJson() => {
        "task_title": taskTitle,
         "est_duration": estimatedTime,

        "task_desc": taskDesc,
        "volunteer_limit": volunteerLimit,
        "issue_title": issueTitle,
        "issue_loc": issueLoc,
        "issue_desc": issueDesc,
      };
}
