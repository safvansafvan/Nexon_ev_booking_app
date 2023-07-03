class AddPlotModel {
  String? type;
  String? desc;
  String? title;
  String? lat;
  String? long;
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
        "lat": lat,
        "long": long,
        "email": email,
        "username": username,
      };
}
