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
