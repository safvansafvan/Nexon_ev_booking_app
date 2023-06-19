class TestDriveBookingModel {
  String? name;
  String? email;
  String? phone;
  String? city;
  String? state;
  String? model;
  String? dealerShip;

  TestDriveBookingModel({
    this.name,
    this.email,
    this.phone,
    this.city,
    this.state,
    this.model,
    this.dealerShip,
  });

  factory TestDriveBookingModel.fromJson(Map<String, dynamic> json) =>
      TestDriveBookingModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        city: json["city"],
        state: json["state"],
        model: json["model"],
        dealerShip: json["dealerShip"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "city": city,
        "state": state,
        "model": model,
        "dealerShip": dealerShip,
      };
}
