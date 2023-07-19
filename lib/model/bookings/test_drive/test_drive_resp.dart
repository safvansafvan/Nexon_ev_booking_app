class GetTestDriveStatus {
  String? id;
  String? name;
  String? email;
  int? phone;
  String? city;
  String? state;
  String? model;
  String? dealership;
  bool? checked;
  bool? isBanned;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  GetTestDriveStatus({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.city,
    this.state,
    this.model,
    this.dealership,
    this.checked,
    this.isBanned,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory GetTestDriveStatus.fromJson(Map<String, dynamic> json) =>
      GetTestDriveStatus(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        city: json["city"],
        state: json["state"],
        model: json["model"],
        dealership: json["dealership"],
        checked: json["checked"],
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
        "name": name,
        "email": email,
        "phone": phone,
        "city": city,
        "state": state,
        "model": model,
        "dealership": dealership,
        "checked": checked,
        "isBanned": isBanned,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
