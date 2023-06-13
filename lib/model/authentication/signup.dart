class OtpVerificationAndSignUpModel {
  bool? auth;
  String? token;
  UserResult? result;
  String? status;
  String? message;
  String? verificationStatus;

  OtpVerificationAndSignUpModel({
    this.auth,
    this.token,
    this.result,
    this.status,
    this.message,
    this.verificationStatus,
  });

  factory OtpVerificationAndSignUpModel.fromJson(Map<String, dynamic> json) {
    return OtpVerificationAndSignUpModel(
      auth: json['auth'],
      token: json['token'],
      result: UserResult.fromJson(json['result']),
      status: json['status'],
      message: json['message'],
      verificationStatus: json['verificationStatus'],
    );
  }
}

class UserResult {
  String username;
  String email;
  String password;
  int phone;
  List<dynamic> testDriveBooking;
  bool isBanned;
  String id;
  String createdAt;
  String updatedAt;
  int v;

  UserResult({
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

  factory UserResult.fromJson(Map<String, dynamic> json) {
    return UserResult(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      testDriveBooking: json['testDriveBooking'],
      isBanned: json['isBanned'],
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
