import 'dart:convert';

ResponseGetTypeGallery responseGetTypeGalleryFromJson(String str) => ResponseGetTypeGallery.fromJson(json.decode(str));

String responseGetTypeGalleryToJson(ResponseGetTypeGallery data) => json.encode(data.toJson());

class ResponseGetTypeGallery {
    ResponseGetTypeGallery({
        required this.data,
    });

    Data data;

    factory ResponseGetTypeGallery.fromJson(Map<String, dynamic> json) => ResponseGetTypeGallery(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.getTypeGallery,
    });

    List<GetTypeGallery> getTypeGallery;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        getTypeGallery: List<GetTypeGallery>.from(json["getTypeGallery"].map((x) => GetTypeGallery.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "getTypeGallery": List<dynamic>.from(getTypeGallery.map((x) => x.toJson())),
    };
}

class GetTypeGallery {
    GetTypeGallery({
        required this.id,
        required this.url,
    });

    String id;
    String url;

    factory GetTypeGallery.fromJson(Map<String, dynamic> json) => GetTypeGallery(
        url: json["url"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
    };
}
