import 'dart:convert';

ResponseResetPassword responseResetPasswordFromJson(String str) => ResponseResetPassword.fromJson(json.decode(str));

String responseResetPasswordToJson(ResponseResetPassword data) => json.encode(data.toJson());

class ResponseResetPassword {
    Data data;

    ResponseResetPassword({
        required this.data,
    });

    factory ResponseResetPassword.fromJson(Map<String, dynamic> json) => ResponseResetPassword(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}
 
class Data {
    bool resetPassword;

    Data({
        required this.resetPassword,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        resetPassword: json["resetPassword"],
    );

    Map<String, dynamic> toJson() => {
        "resetPassword": resetPassword,
    };
}