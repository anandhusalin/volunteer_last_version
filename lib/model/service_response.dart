// To parse this JSON data, do
//
//     final serviceResponse = serviceResponseFromJson(jsonString);

import 'dart:convert';

ServiceResponse serviceResponseFromJson(String str) =>
    ServiceResponse.fromJson(json.decode(str));

String serviceResponseToJson(ServiceResponse data) =>
    json.encode(data.toJson());

class ServiceResponse {
  ServiceResponse({
    this.message,
    this.taskId,
  });

  String? message;
  int? taskId;

  factory ServiceResponse.fromJson(Map<String, dynamic> json) =>
      ServiceResponse(
        message: json["message"],
        taskId: json["task_id"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "task_id": taskId,
      };
}
