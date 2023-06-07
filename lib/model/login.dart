import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) => UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
    bool auth;
    String token;
    Result result;
    String status;
    String message;

    UserLoginModel({
        required this.auth,
        required this.token,
        required this.result,
        required this.status,
        required this.message,
    });

    factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
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
    String id;
    String username;
    String email;
    String password;
    int phone;
    List<dynamic> testDriveBooking;
    bool isBanned;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Result({
        required this.id,
        required this.username,
        required this.email,
        required this.password,
        required this.phone,
        required this.testDriveBooking,
        required this.isBanned,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        testDriveBooking: List<dynamic>.from(json["testDriveBooking"].map((x) => x)),
        isBanned: json["isBanned"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "password": password,
        "phone": phone,
        "testDriveBooking": List<dynamic>.from(testDriveBooking.map((x) => x)),
        "isBanned": isBanned,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}