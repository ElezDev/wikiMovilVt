import 'dart:convert';

ResponseApiProfile responseApiProfileFromJson(String str) =>
    ResponseApiProfile.fromJson(json.decode(str));

String responseApiProfileToJson(ResponseApiProfile data) =>
    json.encode(data.toJson());

class ResponseApiProfile {
  Data data;

  ResponseApiProfile({
    required this.data,
  });

  factory ResponseApiProfile.fromJson(Map<String, dynamic> json) =>
      ResponseApiProfile(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<User> users;

  Data({
    required this.users,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  int id;
  String name;
  String username;
  String biography;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.biography,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        biography: json["biography"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "biography": biography,
      };
}