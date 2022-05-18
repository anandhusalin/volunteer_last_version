import 'dart:convert';

SignupRequest signupRequestFromJson(String str) =>
    SignupRequest.fromJson(json.decode(str));

String signupRequestToJson(SignupRequest data) => json.encode(data.toJson());

class SignupRequest {
  SignupRequest({
    this.username,
    this.name,
    this.password,
    this.email,
    this.usertype,
    this.gender,
    this.dob,
    this.phone,
  });

  String? username;
  String? name;
  String? password;
  String? email;
  String? usertype;
  String? gender;
  String? dob;
  String? phone;

  factory SignupRequest.fromJson(Map<String, dynamic> json) => SignupRequest(
        username: json["username"],
        name: json["name"],
        password: json["password"],
        email: json["email"],
        usertype: json["usertype"],
        gender: json["gender"],
        dob: json["dob"],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "name": name,
        "password": password,
        "email": email,
        "usertype": usertype,
        "gender": gender,
        "dob": dob,
        "phone": phone,
      };
}
