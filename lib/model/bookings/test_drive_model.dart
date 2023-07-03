class TestDriveBookingModel {
  String? name;
  String? email;
  String? phone;
  String? city;
  String? state;
  String? model;
  String? dealership;
  bool? checked;

  TestDriveBookingModel({
    this.name,
    this.email,
    this.phone,
    this.city,
    this.state,
    this.model,
    this.dealership,
    this.checked,
  });

  factory TestDriveBookingModel.fromJson(Map<String, dynamic> json) =>
      TestDriveBookingModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        city: json["city"],
        state: json["state"],
        model: json["model"],
        dealership: json["dealership"],
        checked: json["checked"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "city": city,
        "state": state,
        "model": model,
        "dealership": dealership,
        "checked": checked,
      };
}
