class MapDataModel {
  String? username;
  String? email;
  String? title;
  String? desc;
  String? type;
  double? long;
  double? lat;
  bool? isBanned;
  DateTime? createdAt;

  MapDataModel({
    this.username,
    this.email,
    this.title,
    this.desc,
    this.type,
    this.long,
    this.lat,
    this.isBanned,
    this.createdAt,
  });

  factory MapDataModel.fromJson(Map<String, dynamic> json) => MapDataModel(
        username: json["username"],
        email: json["email"],
        title: json["title"],
        desc: json["desc"],
        type: json["type"],
        long: json["long"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
        isBanned: json["isBanned"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "title": title,
        "desc": desc,
        "type": type,
        "long": long,
        "lat": lat,
        "isBanned": isBanned,
        "createdAt": createdAt?.toIso8601String(),
      };
}
