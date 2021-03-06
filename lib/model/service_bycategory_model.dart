// To parse this JSON data, do
//
//     final getServiceByCategoryModel = getServiceByCategoryModelFromJson(jsonString);

import 'dart:convert';

GetServiceByCategoryModel getServiceByCategoryModelFromJson(String str) =>
    GetServiceByCategoryModel.fromJson(json.decode(str));

String getServiceByCategoryModelToJson(GetServiceByCategoryModel data) =>
    json.encode(data.toJson());

class GetServiceByCategoryModel {
  GetServiceByCategoryModel({
    this.status,
    this.code,
    this.message,
    this.data,
    this.misc,
  });

  int? status;
  int? code;
  String? message;
  List<Datum>? data;
  Misc? misc;

  factory GetServiceByCategoryModel.fromJson(Map<String, dynamic> json) =>
      GetServiceByCategoryModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        misc: Misc.fromJson(json["misc"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "misc": misc!.toJson(),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.imageName,
  });

  int? id;
  String? name;
  String? imageName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        imageName: json["image_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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
