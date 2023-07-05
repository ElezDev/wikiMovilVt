import 'dart:convert';

ResponseSendCodeChangePassword responseSendCodeChangePasswordFromJson(String str) => ResponseSendCodeChangePassword.fromJson(json.decode(str));

String responseSendCodeChangePasswordToJson(ResponseSendCodeChangePassword data) => json.encode(data.toJson());

class ResponseSendCodeChangePassword {
    Data data;

    ResponseSendCodeChangePassword({
        required this.data,
    });

    factory ResponseSendCodeChangePassword.fromJson(Map<String, dynamic> json) => ResponseSendCodeChangePassword(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    bool sendCodeChangePassword;

    Data({
        required this.sendCodeChangePassword,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        sendCodeChangePassword: json["sendCodeChangePassword"],
    );

    Map<String, dynamic> toJson() => {
        "sendCodeChangePassword": sendCodeChangePassword,
    };
}
 