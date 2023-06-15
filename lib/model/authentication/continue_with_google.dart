import 'dart:convert';

// ignore: non_constant_identifier_names
ContinueWithGoogleModel ContinueWithGoogleModelFromJson(String str) =>
    ContinueWithGoogleModel.fromJson(json.decode(str));

// ignore: non_constant_identifier_names
String ContinueWithGoogleModelToJson(ContinueWithGoogleModel data) =>
    json.encode(data.toJson());

class ContinueWithGoogleModel {
  bool? auth;
  String? token;
  Result? result;
  String? status;
  String? message;

  ContinueWithGoogleModel({
    this.auth,
    this.token,
    this.result,
    this.status,
    this.message,
  });

  factory ContinueWithGoogleModel.fromJson(Map<String, dynamic> json) =>
      ContinueWithGoogleModel(
        auth: json["auth"],
        token: json["token"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "auth": auth,
        "token": token,
        "result": result?.toJson(),
        "status": status,
        "message": message,
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

  Result({
    this.id,
    this.username,
    this.email,
    this.testDriveBooking,
    this.isBanned,
    this.createdAt,
    this.updatedAt,
    this.v,
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
      };
}
