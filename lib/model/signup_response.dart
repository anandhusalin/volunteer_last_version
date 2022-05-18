import 'dart:convert';

SignupResponse signupResponseFromJson(String str) =>
    SignupResponse.fromJson(json.decode(str));

String signupResponseToJson(SignupResponse data) => json.encode(data.toJson());

class SignupResponse {
  SignupResponse({this.message, this.data, this.status});

  String? message;
  String? status;
  Data? data;
//https://app.quicktype.io/
  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
    message: json["message"],
    status: json['status'],
    data: json['data'] != null ? Data.fromJson(json["data"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.username,
    this.name,
    this.email,
    this.gender,
    this.dob,
    this.userType,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? username;
  String? name;
  String? email;
  String? gender;
  String? dob;
  String? userType;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    username: json["username"],
    name: json["name"],
    email: json["email"],
    gender: json["gender"],
    dob: json["dob"],
    userType: json["user_type"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "name": name,
    "email": email,
    "gender": gender,
    "dob": dob,
    "user_type": userType,
    "updated_at": updatedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "id": id,
  };
}
