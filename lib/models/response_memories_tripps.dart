import 'dart:convert';

ResponseMenoriesTripps responseMenoriesTrippsFromJson(String str) =>
    ResponseMenoriesTripps.fromJson(json.decode(str));

String responseMenoriesTrippsToJson(ResponseMenoriesTripps data) =>
    json.encode(data.toJson());

class ResponseMenoriesTripps {
  Data data;

  ResponseMenoriesTripps({
    required this.data,
  });

  factory ResponseMenoriesTripps.fromJson(Map<String, dynamic> json) =>
      ResponseMenoriesTripps(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<MemoriesTripp> memoriesTripps;

  Data({
    required this.memoriesTripps,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        memoriesTripps: List<MemoriesTripp>.from(
            json["memoriesTripps"].map((x) => MemoriesTripp.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "memoriesTripps":
            List<dynamic>.from(memoriesTripps.map((x) => x.toJson())),
      };
}

class MemoriesTripp {
  DateTime date;
  int attendees;
  Hour hour;

  MemoriesTripp({
    required this.date,
    required this.attendees,
    required this.hour,
  });

  factory MemoriesTripp.fromJson(Map<String, dynamic> json) => MemoriesTripp(
        date: DateTime.parse(json["date"]),
        attendees: json["attendees"],
        hour: Hour.fromJson(json["hour"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "attendees": attendees,
        "hour": hour.toJson(),
      };
}

class Hour {
  String hour;
  String id;
  Schedule schedule;

  Hour({
    required this.hour,
    required this.id,
    required this.schedule,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        hour: json["hour"],
        id: json["id"],
        schedule: Schedule.fromJson(json["schedule"]),
      );

  Map<String, dynamic> toJson() => {
        "hour": hour,
        "id": id,
        "schedule": schedule.toJson(),
      };
}

class Schedule {
  Tripp tripp;

  Schedule({
    required this.tripp,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        tripp: Tripp.fromJson(json["tripp"]),
      );

  Map<String, dynamic> toJson() => {
        "tripp": tripp.toJson(),
      };
}

class Tripp {
  String name;
  int price;
  Language language;
  List<Gallery> gallery;
  Host host;
  City city;
  int latitude;
  int longitude;

  Tripp({
    required this.name,
    required this.price,
    required this.language,
    required this.gallery,
    required this.host,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  factory Tripp.fromJson(Map<String, dynamic> json) => Tripp(
        name: json["name"],
        price: json["price"],
        language: Language.fromJson(json["language"]),
        gallery:
            List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
        host: Host.fromJson(json["host"]),
        city: City.fromJson(json["city"]),
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "language": language.toJson(),
        "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
        "host": host.toJson(),
        "city": city.toJson(),
        "latitude": latitude,
        "longitude": longitude,
      };
}

class City {
  String name;
  Country country;

  City({
    required this.name,
    required this.country,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
        country: Country.fromJson(json["country"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "country": country.toJson(),
      };
}

class Country {
  String name;

  Country({
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Language {
  String name;

  Language({
    required this.name,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Gallery {
  String url;
  String type;

  Gallery({
    required this.url,
    required this.type,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        url: json["url"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "type": type,
      };
}

class Host {
  String? img;
  String email;

  Host({
    this.img,
    required this.email,
  });

  factory Host.fromJson(Map<String, dynamic> json) => Host(
        img: json["img"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "email": email,
      };
}
