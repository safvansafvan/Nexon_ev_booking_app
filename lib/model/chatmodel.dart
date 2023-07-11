// class ChatModel {
//   List<dynamic> name;
//   String text;
//   String id;
//   String? email;
//   DateTime? time;
//   ChatModel(
//       {required this.name,
//       required this.text,
//       required this.id,
//       this.email,
//       this.time});
//   factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
//       name: List<dynamic>.from(json["name"].map((x) => x)),
//       text: json["text"],
//       id: json["group"],
//       time: DateTime.parse(json["createdAt"]));
//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "text": text,
//         "group": id,
//       };
// }
