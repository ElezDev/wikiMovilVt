import 'dart:convert';

ResponseSuggestionTripp responseSuggestionTrippFromJson(String str) =>
    ResponseSuggestionTripp.fromJson(json.decode(str));

String responseSuggestionTrippToJson(ResponseSuggestionTripp data) =>
    json.encode(data.toJson());

class ResponseSuggestionTripp {
  ResponseSuggestionTripp({
    required this.data,
  });

  Data data;

  factory ResponseSuggestionTripp.fromJson(Map<String, dynamic> json) =>
      ResponseSuggestionTripp(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.suggestionsTripps,
  });

  List<SuggestionsTripp> suggestionsTripps;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        suggestionsTripps: List<SuggestionsTripp>.from(
            json["SuggestionsTripps"].map((x) => SuggestionsTripp.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "SuggestionsTripps":
            List<dynamic>.from(suggestionsTripps.map((x) => x.toJson())),
      };
}

class SuggestionsTripp {
  SuggestionsTripp({
    required this.id,
    required this.name,
    required this.host,
    required this.city,
    required this.gallery,
  });

  String id;
  String name;
  Host host;
  City city;
  List<Gallery> gallery;

  factory SuggestionsTripp.fromJson(Map<String, dynamic> json) =>
      SuggestionsTripp(
        id: json["id"],
        name: json["name"],
        host: Host.fromJson(json["host"]),
        city: City.fromJson(json["city"]),
        gallery:
            List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "host": host.toJson(),
        "city": city.toJson(),
        "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
      };
}

class City {
  City({
    required this.name,
  });

  String name;

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Gallery {
  Gallery({
    required this.url,
  });

  String url;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Host {
  Host({
    required this.name,
    required this.lastname,
    required this.id,
    this.img,
  });

  String name;
  String lastname;
  String id;
  String? img;

  factory Host.fromJson(Map<String, dynamic> json) => Host(
        name: json["name"],
        lastname: json["lastname"],
        id: json["id"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "id": id,
        "img": img,
      };
}
