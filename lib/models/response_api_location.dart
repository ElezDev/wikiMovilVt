import 'dart:convert';

ResponseApiLocationPost responseApiLocationPost(String str) =>
    ResponseApiLocationPost.fromJson(json.decode(str));

String responseApiLocationPostToJson(ResponseApiLocationPost data) =>
    json.encode(data.toJson());

class ResponseApiLocationPost {
  ResponseApiLocationPost({
    required this.data,
  });

  Data data;

  factory ResponseApiLocationPost.fromJson(Map<String, dynamic> json) =>
      ResponseApiLocationPost(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.locations,
  });

  Locations locations;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        locations: Locations.fromJson(json["locations"]),
      );

  Map<String, dynamic> toJson() => {
        "locations": locations.toJson(),
      };
}

class Locations {
  Locations({
    required this.location
  });

  String location;


  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "location": location,
      };
}

