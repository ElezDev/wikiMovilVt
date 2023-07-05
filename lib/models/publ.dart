import 'dart:convert';

ResponseApiCrearPrublicacion responseApiCrearPrublicacion(String str) =>
    ResponseApiCrearPrublicacion.fromJson(json.decode(str));

String responseApiCrearPrublicacionToJson(ResponseApiCrearPrublicacion data) =>
    json.encode(data.toJson());

class ResponseApiCrearPrublicacion {
  ResponseApiCrearPrublicacion({
    required this.data,
  });

  Data data;

  factory ResponseApiCrearPrublicacion.fromJson(Map<String, dynamic> json) =>
      ResponseApiCrearPrublicacion(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.publications,
  });

  Publications publications;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        publications: Publications.fromJson(json["publications"]),
      );

  Map<String, dynamic> toJson() => {
        "publications": publications.toJson(),
      };
}

class Publications {
  Publications({
    required this.description,
    required this.longitude,
    required this.latitude,
    required this.id
  });

    String description;
    String id;
    String longitude;
    String latitude;




  factory Publications.fromJson(Map<String, dynamic> json) => Publications(
        description: json["description"],
        id: json["id"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
          "id": id
      };
}
