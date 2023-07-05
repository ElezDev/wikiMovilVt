import 'dart:convert';

ResponseUbicationTripp responseCreateScheduleFromJson(String str) => ResponseUbicationTripp.fromJson(json.decode(str));

String responseCreateScheduleToJson(ResponseUbicationTripp data) => json.encode(data.toJson());

class ResponseUbicationTripp {
    ResponseUbicationTripp({
        required this.data,
    });

    Data data;

    factory ResponseUbicationTripp.fromJson(Map<String, dynamic> json) => ResponseUbicationTripp(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.ubicationTripp,
    });

    UbicationTripp ubicationTripp;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        ubicationTripp: UbicationTripp.fromJson(json["ubicationTripp"]),
    );

    Map<String, dynamic> toJson() => {
        "ubicationTripp": ubicationTripp.toJson(),
    };
}

class UbicationTripp {
    UbicationTripp({
        required this.id,
    });

    String id;

    factory UbicationTripp.fromJson(Map<String, dynamic> json) => UbicationTripp(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}