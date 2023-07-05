// To parse this JSON data, do
//
//     final responsePreviewTripp = responsePreviewTrippFromJson(jsonString);

import 'dart:convert';

ResponsePreviewTripp responsePreviewTrippFromJson(String str) => ResponsePreviewTripp.fromJson(json.decode(str));

String responsePreviewTrippToJson(ResponsePreviewTripp data) => json.encode(data.toJson());

class ResponsePreviewTripp {
    Data data;

    ResponsePreviewTripp({
        required this.data,
    });

    factory ResponsePreviewTripp.fromJson(Map<String, dynamic> json) => ResponsePreviewTripp(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Tripp tripp;

    Data({
        required this.tripp,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        tripp: Tripp.fromJson(json["tripp"]),
    );

    Map<String, dynamic> toJson() => {
        "tripp": tripp.toJson(),
    };
}

class Tripp {
    String name;
    Language language;
    String contents;
    String recommendations;
    City city;
    List<Gallery> gallery;
    int price;
    Schedule schedule;
    Host host;

    Tripp({
        required this.name,
        required this.language,
        required this.contents,
        required this.recommendations,
        required this.city,
        required this.gallery,
        required this.price,
        required this.schedule,
        required this.host,
    });

    factory Tripp.fromJson(Map<String, dynamic> json) => Tripp(
        name: json["name"],
        language: Language.fromJson(json["language"]),
        contents: json["contents"],
        recommendations: json["recommendations"],
        city: City.fromJson(json["city"]),
        gallery: List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
        price: json["price"],
        schedule: Schedule.fromJson(json["schedule"]),
        host: Host.fromJson(json["host"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "language": language.toJson(),
        "contents": contents,
        "recommendations": recommendations,
        "city": city.toJson(),
        "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
        "price": price,
        "schedule": schedule.toJson(),
        "host": host.toJson(),
    };
}

class City {
    String name;
    Language country;

    City({
        required this.name,
        required this.country,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
        country: Language.fromJson(json["country"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "country": country.toJson(),
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

    Gallery({
        required this.url,
    });

    factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}

class Host {
    String id;
    String name;
    String lastname;
    String profession;
    String? img;

    Host({
        required this.id,
        required this.name,
        required this.lastname,
        required this.profession,
        this.img,
    });

    factory Host.fromJson(Map<String, dynamic> json) => Host(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        profession: json["profession"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "profession": profession,
        "img": img,
    };
}

class Schedule {
    String id;
    String duration;
    List<Hour> hours;

    Schedule({
        required this.id,
        required this.duration,
        required this.hours,
    });

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        duration: json["duration"],
        hours: List<Hour>.from(json["hours"].map((x) => Hour.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "duration": duration,
        "hours": List<dynamic>.from(hours.map((x) => x.toJson())),
    };
}

class Hour {
    String hour;
    int day;
    int quotas;

    Hour({
        required this.hour,
        required this.day,
        required this.quotas,
    });

    factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        hour: json["hour"],
        day: json["day"],
        quotas: json["quotas"],
    );

    Map<String, dynamic> toJson() => {
        "hour": hour,
        "day": day,
        "quotas": quotas,
    };
}
