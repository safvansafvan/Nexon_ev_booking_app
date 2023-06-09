// To parse this JSON data, do
//
//     final userSignupModel = userSignupModelFromJson(jsonString);

import 'dart:convert';

UserSignupModel userSignupModelFromJson(String str) => UserSignupModel.fromJson(json.decode(str));

String userSignupModelToJson(UserSignupModel data) => json.encode(data.toJson());

class UserSignupModel {
    bool auth;
    String token;
    Result result;
    String status;
    String message;

    UserSignupModel({
        required this.auth,
        required this.token,
        required this.result,
        required this.status,
        required this.message,
    });

    factory UserSignupModel.fromJson(Map<String, dynamic> json) => UserSignupModel(
        auth: json["auth"],
        token: json["token"],
        result: Result.fromJson(json["result"]),
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "auth": auth,
        "token": token,
        "result": result.toJson(),
        "status": status,
        "message": message,
    };
}

class Result {
    String username;
    String email;
    String password;
    int phone;
    List<dynamic> testDriveBooking;
    bool isBanned;
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Result({
        required this.username,
        required this.email,
        required this.password,
        required this.phone,
        required this.testDriveBooking,
        required this.isBanned,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        testDriveBooking: List<dynamic>.from(json["testDriveBooking"].map((x) => x)),
        isBanned: json["isBanned"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "phone": phone,
        "testDriveBooking": List<dynamic>.from(testDriveBooking.map((x) => x)),
        "isBanned": isBanned,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
