class SignupModel {
  String? email;
  String? username;
  String? password;
  String? phone;
  String? otp;

  SignupModel({
    this.email,
    this.username,
    this.password,
    this.phone,
    this.otp,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        email: json["email"],
        username: json["username"],
        password: json["password"],
        phone: json["phone"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "password": password,
        "phone": phone,
        "otp": otp,
      };
}
