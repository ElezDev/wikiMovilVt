import 'dart:convert';
import 'package:wiki_virtualt/models/response_api_login.dart';

ResponseApiRegister responseApiRegisterFromJson(String str) =>
    ResponseApiRegister.fromJson(json.decode(str));

String responseApiRegisterToJson(ResponseApiRegister data) =>
    json.encode(data.toJson());

class ResponseApiRegister {
  ResponseApiRegister({
    required this.data,
  });

  Data data;

  factory ResponseApiRegister.fromJson(Map<String, dynamic> json) =>
      ResponseApiRegister(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.register,
  });

  Register register;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        register: Register.fromJson(json["register"]),
      );

  Map<String, dynamic> toJson() => {
        "register": register.toJson(),
      };
}

class Register {
  Register({
    required this.accessToken,
    required this.registered,
    required this.name,
    required this.username,
  });

  String accessToken;
  bool registered;
  String name;
  String username;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        accessToken: json["access_token"],
        registered: true,
        name: json["name"] as String? ?? "",
        username: json["username"]  as String? ?? "",
       
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "registered": registered,
        "name": name,
        "username": username,
      
      };
}
