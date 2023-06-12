// To parse this JSON data, do
//
//     final userOtpMode = userOtpModeFromJson(jsonString);

import 'dart:convert';

UserOtpMode userOtpModeFromJson(String str) =>
    UserOtpMode.fromJson(json.decode(str));

String userOtpModeToJson(UserOtpMode data) => json.encode(data.toJson());

class UserOtpMode {
  String? email;
  String? username;

  UserOtpMode({
    this.email,
    this.username,
  });

  factory UserOtpMode.fromJson(Map<String, dynamic> json) => UserOtpMode(
        email: json["email"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
      };
}
