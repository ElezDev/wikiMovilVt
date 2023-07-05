import 'dart:convert';

ResponseChangePassword responseChangePasswordFromJson(String str) => ResponseChangePassword.fromJson(json.decode(str));

String responseChangePasswordToJson(ResponseChangePassword data) => json.encode(data.toJson());

class ResponseChangePassword {
    ResponseChangePassword({
        required this.data,
    });

    Data data;

    factory ResponseChangePassword.fromJson(Map<String, dynamic> json) => ResponseChangePassword(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.changePassword,
    });

    bool changePassword;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        changePassword: json["changePassword"],
    );

    Map<String, dynamic> toJson() => {
        "changePassword": changePassword,
    };
}