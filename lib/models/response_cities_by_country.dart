import 'dart:convert';

ResponseCitiesByCountry responseCitiesByCountryFromJson(String str) => ResponseCitiesByCountry.fromJson(json.decode(str));

String responseCitiesByCountryToJson(ResponseCitiesByCountry data) => json.encode(data.toJson());

class ResponseCitiesByCountry {
    ResponseCitiesByCountry({
        required this.data,
    });

    Data data;

    factory ResponseCitiesByCountry.fromJson(Map<String, dynamic> json) => ResponseCitiesByCountry(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.findCitiesByCountry,
    });

    List<FindCitiesByCountry> findCitiesByCountry;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        findCitiesByCountry: List<FindCitiesByCountry>.from(json["findCitiesByCountry"].map((x) => FindCitiesByCountry.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "findCitiesByCountry": List<dynamic>.from(findCitiesByCountry.map((x) => x.toJson())),
    };
}

class FindCitiesByCountry {
    FindCitiesByCountry({
        required this.name,
        required this.id,
    });

    String name;
    String id;

    factory FindCitiesByCountry.fromJson(Map<String, dynamic> json) => FindCitiesByCountry(
        name: json["name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}