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
    this.misc,
  });

  int? status;
  int? code;
  String? message;
  List<Datum>? data;
  Misc? misc;

  factory ServiceInfoModel.fromJson(Map<String, dynamic> json) =>
      ServiceInfoModel(
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
  dynamic catId;
  dynamic locId;
  dynamic subId;
  int? isPopular;
  List<Image>? images;

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
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
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
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    this.id,
    this.serviceId,
    this.imageName,
  });

  int? id;
  int? serviceId;
  String? imageName;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        serviceId: json["service_id"],
        imageName: json["image_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_id": serviceId,
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
