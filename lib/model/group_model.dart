class Group {
  Group({
    required this.id,
    required this.admin,
    required this.groupName,
    required this.members,
    required this.createdAt,
    required this.updatedAt,
    this.image,
  });

  String id;
  List<dynamic> admin;
  String groupName;
  List<dynamic> members;
  DateTime createdAt;
  DateTime updatedAt;
  String? image;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["_id"],
        admin: List<dynamic>.from(json["admin"].map((x) => x)),
        groupName: json["groupName"],
        members: List<dynamic>.from(json["members"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "admin": List<dynamic>.from(admin.map((x) => x)),
        "groupName": groupName,
        "members": List<dynamic>.from(members.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "image": image
      };
}
