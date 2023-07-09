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
  String? accessToken;
  bool? registered;
  Userlog user;

  Login({
    this.accessToken,
    this.registered,
    required this.user,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        accessToken: json["access_token"],
        registered: json["registered"],
        user: Userlog.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "registered": registered,
        "user": user.toJson(),
      };
}

class Userlog {
  String? name;
  String? email;

  Userlog({
    this.name,
    this.email,
  });

  factory Userlog.fromJson(Map<String, dynamic> json) => Userlog(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };
}
