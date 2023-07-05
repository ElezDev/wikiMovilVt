import 'dart:convert';

ResponseVerifyCodeChangePassword responseVerifyCodeChangePasswordFromJson(String str) => ResponseVerifyCodeChangePassword.fromJson(json.decode(str));

String responseVerifyCodeChangePasswordToJson(ResponseVerifyCodeChangePassword data) => json.encode(data.toJson());

class ResponseVerifyCodeChangePassword {
    Data data;

    ResponseVerifyCodeChangePassword({
        required this.data,
    });

    factory ResponseVerifyCodeChangePassword.fromJson(Map<String, dynamic> json) => ResponseVerifyCodeChangePassword(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
} 

class Data {
    String verifyCodeChangePassword;

    Data({
        required this.verifyCodeChangePassword,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        verifyCodeChangePassword: json["verifyCodeChangePassword"],
    );

    Map<String, dynamic> toJson() => {
        "verifyCodeChangePassword": verifyCodeChangePassword,
    };
}