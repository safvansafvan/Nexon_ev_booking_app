class GetUserBookingDetails {
  String? id;
  String? names;
  String? lastName;
  String? email;
  int? phone;
  int? pincode;
  String? city;
  String? model;
  int? bookingPrice;
  String? address1;
  String? address2;
  String? state;
  String? dealer;
  String? status;
  bool? isBanned;
  DateTime? createdAt;
  DateTime? updatedAt;

  GetUserBookingDetails({
    this.id,
    this.names,
    this.lastName,
    this.email,
    this.phone,
    this.pincode,
    this.city,
    this.model,
    this.bookingPrice,
    this.address1,
    this.address2,
    this.state,
    this.dealer,
    this.status,
    this.isBanned,
    this.createdAt,
    this.updatedAt,
  });

  factory GetUserBookingDetails.fromJson(Map<String, dynamic> json) =>
      GetUserBookingDetails(
        id: json["_id"],
        names: json["names"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        pincode: json["pincode"],
        city: json["city"],
        model: json["model"],
        bookingPrice: json["bookingPrice"],
        address1: json["address1"],
        address2: json["address2"],
        state: json["state"],
        dealer: json["dealer"],
        status: json["status"],
        isBanned: json["isBanned"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "names": names,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "pincode": pincode,
        "city": city,
        "model": model,
        "bookingPrice": bookingPrice,
        "address1": address1,
        "address2": address2,
        "state": state,
        "dealer": dealer,
        "status": status,
        "isBanned": isBanned,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
