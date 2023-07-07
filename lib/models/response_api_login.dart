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
    bool registered;


  Login({
    required this.accessToken,
    required this.registered,

  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        accessToken: json["access_token"],
        registered: json["registered"],


      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "registered": registered,
      };
}
