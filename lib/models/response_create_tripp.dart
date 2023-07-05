import 'dart:convert';

ResponseCreateTripp responseCreateTrippFromJson(String str) => ResponseCreateTripp.fromJson(json.decode(str));

String responseCreateTrippToJson(ResponseCreateTripp data) => json.encode(data.toJson());

class ResponseCreateTripp {
    ResponseCreateTripp({
        required this.data,
    });

    Data data;

    factory ResponseCreateTripp.fromJson(Map<String, dynamic> json) => ResponseCreateTripp(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.createTrippOrUpdate,
    });

    CreateTrippOrUpdate createTrippOrUpdate;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        createTrippOrUpdate: CreateTrippOrUpdate.fromJson(json["createTrippOrUpdate"]),
    );

    Map<String, dynamic> toJson() => {
        "createTrippOrUpdate": createTrippOrUpdate.toJson(),
    };
}

class CreateTrippOrUpdate {
    CreateTrippOrUpdate({
        required this.id,
    });

    String id;

    factory CreateTrippOrUpdate.fromJson(Map<String, dynamic> json) => CreateTrippOrUpdate(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}