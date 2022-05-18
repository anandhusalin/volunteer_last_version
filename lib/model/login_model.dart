import 'dart:convert';

LoginRequestModel loginModelFromJson(String str) =>
    LoginRequestModel.fromJson(json.decode(str));

String loginModelToJson(LoginRequestModel data) => json.encode(data.toJson());

class LoginRequestModel {
  LoginRequestModel({
    this.password,
    this.email,
  });

  String? password;
  String? email;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
    "password": password,
    "email": email,
  };
}
