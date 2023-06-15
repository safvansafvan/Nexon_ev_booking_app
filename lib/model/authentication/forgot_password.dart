// To parse this JSON data, do
//
//     final forgotPasswordModel = forgotPasswordModelFromJson(jsonString);

import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromJson(String str) =>
    ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordModelToJson(ForgotPasswordModel data) =>
    json.encode(data.toJson());

class ForgotPasswordModel {
  String? status;
  String? message;
  Result? result;
  String? verificationStatus;

  ForgotPasswordModel({
    this.status,
    this.message,
    this.result,
    this.verificationStatus,
  });

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordModel(
        status: json["status"],
        message: json["message"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        verificationStatus: json["verificationStatus"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": result?.toJson(),
        "verificationStatus": verificationStatus,
      };
}

class Result {
  String? id;
  String? username;
  String? email;
  List<dynamic>? testDriveBooking;
  bool? isBanned;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? password;

  Result({
    this.id,
    this.username,
    this.email,
    this.testDriveBooking,
    this.isBanned,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.password,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        testDriveBooking: json["testDriveBooking"] == null
            ? []
            : List<dynamic>.from(json["testDriveBooking"]!.map((x) => x)),
        isBanned: json["isBanned"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "testDriveBooking": testDriveBooking == null
            ? []
            : List<dynamic>.from(testDriveBooking!.map((x) => x)),
        "isBanned": isBanned,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "password": password,
      };
}
