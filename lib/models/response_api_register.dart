import 'dart:convert';

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
    required this.emailVerified,
    required this.registered,
    this.roles,
  });

  String accessToken;
  bool emailVerified;
  bool registered;
  List<Role>? roles;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        accessToken: json["accessToken"],
        emailVerified: json["emailVerified"],
        registered: json["registered"],
        //roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "emailVerified": emailVerified,
        "registered": registered,
        //"roles": List<dynamic>.from(roles.map((x) => x.toJson())),
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
