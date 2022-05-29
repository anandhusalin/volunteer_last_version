// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
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

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
    this.id,
    this.name,
    this.email,
    this.image,
    this.username,
    this.password,
    this.phone,
    this.location,
    this.emailVerifiedAt,
    this.userType,
    this.loginType,
    this.bio,
    this.gender,
    this.dob,
    this.playerId,
    this.status,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.imageName,
  });

  int? id;
  String? name;
  String? email;
  String? image;
  String? username;
  String? password;
  dynamic phone;
  dynamic location;
  dynamic emailVerifiedAt;
  String? userType;
  dynamic loginType;
  dynamic bio;
  String? gender;
  DateTime? dob;
  dynamic playerId;
  int? status;
  dynamic rememberToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? imageName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
        username: json["username"],
        password: json["password"],
        phone: json["phone"],
        location: json["location"],
        emailVerifiedAt: json["email_verified_at"],
        userType: json["user_type"],
        loginType: json["login_type"],
        bio: json["bio"],
        gender: json["gender"],
        dob: DateTime.parse(json["dob"]),
        playerId: json["player_id"],
        status: json["status"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        imageName: json["image_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
        "username": username,
        "password": password,
        "phone": phone,
        "location": location,
        "email_verified_at": emailVerifiedAt,
        "user_type": userType,
        "login_type": loginType,
        "bio": bio,
        "gender": gender,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "player_id": playerId,
        "status": status,
        "remember_token": rememberToken,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
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
