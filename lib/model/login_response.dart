// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.data,
  });

  Data? data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.username,
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
    this.createdAt,
    this.updatedAt,
    this.apiToken,
    this.profileImage,
  });

  int? id;
  String? name;
  String? email;
  String? username;
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
  DateTime? createdAt;
  DateTime? updatedAt;
  String? apiToken;
  String? profileImage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        apiToken: json["api_token"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
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
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "api_token": apiToken,
        "profile_image": profileImage,
      };
}
