import 'dart:convert';

ResponseTrippsNearby responseTrippsNearbyFromJson(String str) =>
    ResponseTrippsNearby.fromJson(json.decode(str));

String responseTrippsNearbyToJson(ResponseTrippsNearby data) =>
    json.encode(data.toJson());

class ResponseTrippsNearby {
  Data data;

  ResponseTrippsNearby({
    required this.data,
  });

  factory ResponseTrippsNearby.fromJson(Map<String, dynamic> json) =>
      ResponseTrippsNearby(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<TrippsNearby> trippsNearby;

  Data({
    required this.trippsNearby,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        trippsNearby: List<TrippsNearby>.from(
            json["trippsNearby"].map((x) => TrippsNearby.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "trippsNearby": List<dynamic>.from(trippsNearby.map((x) => x.toJson())),
      };
}

class TrippsNearby {
  String city;
  String name;
  List<String> images;

  TrippsNearby({
    required this.city,
    required this.name,
    required this.images,
  });

  factory TrippsNearby.fromJson(Map<String, dynamic> json) => TrippsNearby(
        city: json["city"],
        name: json["name"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "name": name,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
