// To parse this JSON data, do
//
//     final userSignUpModel = userSignUpModelFromJson(jsonString);

import 'dart:convert';

UserSignUpModel userSignUpModelFromJson(String str) => UserSignUpModel.fromJson(json.decode(str));

String userSignUpModelToJson(UserSignUpModel data) => json.encode(data.toJson());

class UserSignUpModel {
    bool? auth;
    String? token;
    Result? result;
    String? status;
    String? message;

    UserSignUpModel({
        this.auth,
        this.token,
        this.result,
        this.status,
        this.message,
    });

    factory UserSignUpModel.fromJson(Map<String, dynamic> json) => UserSignUpModel(
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
    String? username;
    String? email;
    String? password;
    int? phone;
    List<dynamic>? testDriveBooking;
    bool? isBanned;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Result({
        this.username,
        this.email,
        this.password,
        this.phone,
        this.testDriveBooking,
        this.isBanned,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        testDriveBooking: json["testDriveBooking"] == null ? [] : List<dynamic>.from(json["testDriveBooking"]!.map((x) => x)),
        isBanned: json["isBanned"],
        id: json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "phone": phone,
        "testDriveBooking": testDriveBooking == null ? [] : List<dynamic>.from(testDriveBooking!.map((x) => x)),
        "isBanned": isBanned,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
