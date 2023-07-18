class AddPlotModel {
  String? type;
  String? desc;
  String? title;
  double? lat;
  double? long;
  String? email;
  String? username;

  AddPlotModel({
    this.type,
    this.desc,
    this.title,
    this.lat,
    this.long,
    this.email,
    this.username,
  });

  Map<String, dynamic> toJson() => {
        "type": type,
        "desc": desc,
        "title": title,
        "lat": lat.toString(),
        "long": long.toString(),
        "email": email,
        "username": username,
      };
}
