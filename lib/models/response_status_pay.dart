import 'dart:convert';

ResponseStatusPay responseStatusPayFromJson(String str) => ResponseStatusPay.fromJson(json.decode(str));

String responseStatusPayToJson(ResponseStatusPay data) => json.encode(data.toJson());

class ResponseStatusPay {
    ResponseStatusPay({
        required this.data,
    });

    Data data;

    factory ResponseStatusPay.fromJson(Map<String, dynamic> json) => ResponseStatusPay(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.createPayment,
    });

    String createPayment;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        createPayment: json["createPayment"],
    );

    Map<String, dynamic> toJson() => {
        "createPayment": createPayment,
    };
}
