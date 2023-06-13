// import 'dart:convert';

// UserOtpVerifyModel userOtpVerifyModelFromJson(String str) =>
//     UserOtpVerifyModel.fromJson(json.decode(str));

// String userOtpVerifyModelToJson(UserOtpVerifyModel data) =>
//     json.encode(data.toJson());

// class UserOtpVerifyModel {
//   String? message;
//   String? status;
//   String otp;

//   UserOtpVerifyModel({
//     this.message,
//     this.status,
//     required this.otp,
//   });

//   factory UserOtpVerifyModel.fromJson(Map<String, dynamic> json) =>
//       UserOtpVerifyModel(
//         message: json["message"],
//         status: json["status"],
//         otp: json["otp"],
//       );

//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "status": status,
//         "otp": otp,
//       };
// }
