// To parse this JSON data, do
//
//     final responseApiProfile = responseApiProfileFromJson(jsonString);

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
  Profile profile;

  Data({
    required this.profile,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        profile: Profile.fromJson(json["Profile"]),
      );

  Map<String, dynamic> toJson() => {
        "Profile": profile.toJson(),
      };
}

class Profile {
  String id;
  String name;
  String lastname;
  String profession;
  String bio;
  Country country;
  dynamic img;
  int totalFavorites;
  int totalFollows;
  String gender;
  int phone;
  List<Role> roles;
  Host? host;

  Profile({
    required this.id,
    required this.name,
    required this.lastname,
    required this.profession,
    required this.bio,
    required this.country,
    this.img,
    required this.totalFavorites,
    required this.totalFollows,
    required this.gender,
    required this.phone,
    required this.roles,
    this.host,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        profession: json["profession"],
        bio: json["bio"] ?? "",
        country: Country.fromJson(json["country"]),
        img: json["img"],
        totalFavorites: json["totalFavorites"],
        totalFollows: json["totalFollows"],
        gender: json["gender"],
        phone: json["phone"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        host:json["host"]!=null? Host.fromJson(json["host"]):Host(ratingAverage: 0),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "profession": profession,
        "bio": bio,
        "country": country.toJson(),
        "img": img,
        "totalFavorites": totalFavorites,
        "totalFollows": totalFollows,
        "gender": gender,
        "phone": phone,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "host": host!.toJson(),
      };
}

class Country {
  String id;
  String name;

  Country({
    required this.id,
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Role {
  String id;
  String rol;

  Role({
    required this.id,
    required this.rol,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        rol: json["rol"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rol": rol,
      };
}

class Host {
  int ratingAverage;

  Host({
    required this.ratingAverage,
  });

  factory Host.fromJson(Map<String, dynamic> json) => Host(
        ratingAverage: json["ratingAverage"],
      );

  Map<String, dynamic> toJson() => {
        "ratingAverage": ratingAverage,
      };
}
