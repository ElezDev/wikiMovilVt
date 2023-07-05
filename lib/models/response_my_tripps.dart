// To parse this JSON data, do
//
//     final responseMyTripps = responseMyTrippsFromJson(jsonString);

import 'dart:convert';

ResponseMyTripps responseMyTrippsFromJson(String str) => ResponseMyTripps.fromJson(json.decode(str));

String responseMyTrippsToJson(ResponseMyTripps data) => json.encode(data.toJson());

class ResponseMyTripps {
    Data data;

    ResponseMyTripps({
        required this.data,
    });

    factory ResponseMyTripps.fromJson(Map<String, dynamic> json) => ResponseMyTripps(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    List<GetTrippsByHost> getTrippsByHost;

    Data({
        required this.getTrippsByHost,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        getTrippsByHost: List<GetTrippsByHost>.from(json["getTrippsByHost"].map((x) => GetTrippsByHost.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "getTrippsByHost": List<dynamic>.from(getTrippsByHost.map((x) => x.toJson())),
    };
}

class GetTrippsByHost {
    String id;
    String name;
    bool published;
    int price;
    List<Gallery> gallery;

    GetTrippsByHost({
        required this.id,
        required this.name,
        required this.published,
        required this.price,
        required this.gallery,
    });

    factory GetTrippsByHost.fromJson(Map<String, dynamic> json) => GetTrippsByHost(
        id: json["id"],
        name: json["name"],
        published: json["published"],
        price: json["price"],
        gallery: List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "published": published,
        "price": price,
        "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
    };
}

class Gallery {
    Type type;
    String url;

    Gallery({
        required this.type,
        required this.url,
    });

    factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        type: typeValues.map[json["type"]]!,
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "url": url,
    };
}

enum Type { FRONT, PRIMARY, SECUNDARY, DEFAULT }

final typeValues = EnumValues({
    "DEFAULT": Type.DEFAULT,
    "FRONT": Type.FRONT,
    "PRIMARY": Type.PRIMARY,
    "SECUNDARY": Type.SECUNDARY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
