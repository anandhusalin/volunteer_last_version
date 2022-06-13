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
    this.service_id,
  });

  String? message;
  int? service_id;

  factory ServiceResponse.fromJson(Map<String, dynamic> json) =>
      ServiceResponse(
        message: json["message"],
        service_id: json["service_id"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "service_id": service_id,
      };
}
