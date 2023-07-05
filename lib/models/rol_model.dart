// To parse this JSON data, do
//
//     final rolModel = rolModelFromJson(jsonString);

import 'dart:convert';

RolModel rolModelFromJson(String str) => RolModel.fromJson(json.decode(str));

String rolModelToJson(RolModel data) => json.encode(data.toJson());

class RolModel {
  Data data;

  RolModel({
    required this.data,
  });

  factory RolModel.fromJson(Map<String, dynamic> json) => RolModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<Role> roles;

  Data({
    required this.roles,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
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
