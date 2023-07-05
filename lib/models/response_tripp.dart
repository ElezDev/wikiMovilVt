import 'dart:convert';

ResponseTripp responseTrippFromJson(String str) => ResponseTripp.fromJson(json.decode(str));

String responseTrippToJson(ResponseTripp data) => json.encode(data.toJson());

class ResponseTripp {
    ResponseTripp({
        required this.data,
    });

    Data data;

    factory ResponseTripp.fromJson(Map<String, dynamic> json) => ResponseTripp(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.tripp,
    });

    Tripp tripp;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        tripp: Tripp.fromJson(json["tripp"]),
    );

    Map<String, dynamic> toJson() => {
        "tripp": tripp.toJson(),
    };
}

class Tripp {
    Tripp({
        required this.name,
        required this.languages,
        required this.city,
        required this.host,
        required this.gallery,
        required this.price,
        required this.schedule,
    });

    String name;
    List<Country> languages;
    City city;
    Host host;
    List<Gallery> gallery;
    int price;
    List<Schedule> schedule;

    factory Tripp.fromJson(Map<String, dynamic> json) => Tripp(
        name: json["name"],
        languages: List<Country>.from(json["languages"].map((x) => Country.fromJson(x))),
        city: City.fromJson(json["city"]),
        host: Host.fromJson(json["host"]),
        gallery: List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
        price: json["price"],
        schedule: List<Schedule>.from(json["schedule"].map((x) => Schedule.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "city": city.toJson(),
        "host": host.toJson(),
        "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
        "price": price,
        "schedule": List<dynamic>.from(schedule.map((x) => x.toJson())),
    };
}

class City {
    City({
        required this.name,
        required this.country,
    });

    String name;
    Country country;

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
    Country({
        required this.name,
    });

    String name;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
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
        required this.profession,
        required this.img,
    });

    String name;
    String lastname;
    String profession;
    String img;

    factory Host.fromJson(Map<String, dynamic> json) => Host(
        name: json["name"],
        lastname: json["lastname"],
        profession: json["profession"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "profession": profession,
        "img": img,
    };
}

class Schedule {
    Schedule({
        required this.id,
    });

    String id;

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}