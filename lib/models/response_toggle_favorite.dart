import 'dart:convert';

ResponseToggleFavorite responseToggleFavoriteFromJson(String str) => ResponseToggleFavorite.fromJson(json.decode(str));

String responseToggleFavoriteToJson(ResponseToggleFavorite data) => json.encode(data.toJson());

class ResponseToggleFavorite {
    Data data;

    ResponseToggleFavorite({
        required this.data,
    });

    factory ResponseToggleFavorite.fromJson(Map<String, dynamic> json) => ResponseToggleFavorite(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    bool toggleFavorite;

    Data({
        required this.toggleFavorite,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        toggleFavorite: json["toggleFavorite"],
    );

    Map<String, dynamic> toJson() => {
        "toggleFavorite": toggleFavorite,
    };
}