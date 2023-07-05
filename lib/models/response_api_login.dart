// To parse this JSON data, do
//
//     final responseApiLogin = responseApiLoginFromJson(jsonString);

import 'dart:convert';

ResponseApiLogin responseApiLoginFromJson(String str) =>
    ResponseApiLogin.fromJson(json.decode(str));

String responseApiLoginToJson(ResponseApiLogin data) =>
    json.encode(data.toJson());

class ResponseApiLogin {
  Data data;

  ResponseApiLogin({
    required this.data,
  });

  factory ResponseApiLogin.fromJson(Map<String, dynamic> json) =>
      ResponseApiLogin(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Login login;

  Data({
    required this.login,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        login: Login.fromJson(json["login"]),
      );

  Map<String, dynamic> toJson() => {
        "login": login.toJson(),
      };
}

class Login {
  String accessToken;
  bool emailVerified;
  bool registered;
  List<Role> roles;

  Login({
    required this.accessToken,
    required this.emailVerified,
    required this.registered,
    required this.roles,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        accessToken: json["accessToken"],
        emailVerified: json["emailVerified"],
        registered: json["registered"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "emailVerified": emailVerified,
        "registered": registered,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
      };
}

class Role {
  String rol;

  Role({
    required this.rol,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        rol: json["rol"],
      );

  Map<String, dynamic> toJson() => {
        "rol": rol,
      };
}
