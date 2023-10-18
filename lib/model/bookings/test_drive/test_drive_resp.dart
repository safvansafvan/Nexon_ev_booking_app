class GetTestDriveStatus {
  String? status;
  String? id;
  String? name;
  String? email;
  int? phone;
  String? city;
  String? state;
  String? model;
  String? dealership;
  DateTime? createdAt;
  DateTime? updatedAt;

  GetTestDriveStatus({
    this.status,
    this.id,
    this.name,
    this.email,
    this.phone,
    this.city,
    this.state,
    this.model,
    this.dealership,
    this.createdAt,
    this.updatedAt,
  });

  factory GetTestDriveStatus.fromJson(Map<String, dynamic> json) =>
      GetTestDriveStatus(
        status: json["status"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        city: json["city"],
        state: json["state"],
        model: json["model"],
        dealership: json["dealership"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "city": city,
        "state": state,
        "model": model,
        "dealership": dealership,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
