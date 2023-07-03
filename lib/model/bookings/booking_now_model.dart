class BookingNowModel {
  String? names;
  String? lastName;
  String? address1;
  String? address2;
  String? pincode;
  String? email;
  String? phone;
  String? city;
  String? state;
  String? model;
  String? dealer;
  String? bookingPrice;

  BookingNowModel({
    this.names,
    this.lastName,
    this.address1,
    this.address2,
    this.pincode,
    this.email,
    this.phone,
    this.city,
    this.state,
    this.model,
    this.dealer,
    this.bookingPrice,
  });

  factory BookingNowModel.fromJson(Map<String, dynamic> json) =>
      BookingNowModel(
        names: json["names"],
        lastName: json["lastName"],
        address1: json["address1"],
        address2: json["address2"],
        pincode: json["pincode"],
        email: json["email"],
        phone: json["phone"],
        city: json["city"],
        state: json["state"],
        model: json["model"],
        dealer: json["dealer"],
        bookingPrice: json["bookingPrice"],
      );

  Map<String, dynamic> toJson() => {
        "names": names,
        "lastName": lastName,
        "address1": address1,
        "address2": address2,
        "pincode": pincode,
        "email": email,
        "phone": phone,
        "city": city,
        "state": state,
        "model": model,
        "dealer": dealer,
        "bookingPrice": bookingPrice,
      };
}
