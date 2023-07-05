// To parse this JSON data, do
//
//     final loginErrorModel = loginErrorModelFromJson(jsonString);

import 'dart:convert';

LoginErrorModel loginErrorModelFromJson(String str) => LoginErrorModel.fromJson(json.decode(str));

String loginErrorModelToJson(LoginErrorModel data) => json.encode(data.toJson());

class LoginErrorModel {
    List<Error> errors;
    dynamic data;

    LoginErrorModel({
        required this.errors,
        this.data,
    });

    factory LoginErrorModel.fromJson(Map<String, dynamic> json) => LoginErrorModel(
        errors: List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
        "data": data,
    };
}

class Error {
    String message;

    Error({
        required this.message,
    });

    factory Error.fromJson(Map<String, dynamic> json) => Error(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
