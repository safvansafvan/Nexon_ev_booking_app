class ChatModel {
  String? id;
  Name? name;
  String? text;
  String? group;
  DateTime? createdAt;
  DateTime? updatedAt;

  ChatModel({
    this.id,
    this.name,
    this.text,
    this.group,
    this.createdAt,
    this.updatedAt,
  });
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json["_id"],
      name: json["name"] is Map<String, dynamic>
          ? Name.fromJson(json["name"])
          : Name(name: json["name"]),
      text: json["text"],
      group: json["group"],
      createdAt:
          json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      updatedAt:
          json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name?.toJson(),
        "text": text,
        "group": group,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Name {
  String? name;
  String? id;

  Name({
    this.name,
    this.id,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
