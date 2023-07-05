import 'dart:convert';

ResponseSearchEngine responseSearchEngineFromJson(String str) => ResponseSearchEngine.fromJson(json.decode(str));

String responseSearchEngineToJson(ResponseSearchEngine data) => json.encode(data.toJson());

class ResponseSearchEngine {
    Data data;

    ResponseSearchEngine({
        required this.data,
    });

    factory ResponseSearchEngine.fromJson(Map<String, dynamic> json) => ResponseSearchEngine(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    List<Experience> experiences;

    Data({
        required this.experiences,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        experiences: List<Experience>.from(json["experiences"].map((x) => Experience.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "experiences": List<dynamic>.from(experiences.map((x) => x.toJson())),
    };
}

class Experience {
    String id;
    String name;
    City city;
    int price;
    Host host;

    Experience({
        required this.id,
        required this.name,
        required this.city,
        required this.price,
        required this.host,
    });

    factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        id: json["id"],
        name: json["name"],
        city: City.fromJson(json["city"]),
        price: json["price"],
        host: Host.fromJson(json["host"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city.toJson(),
        "price": price,
        "host": host.toJson(),
    };
}

class City {
    String id;
    String name;
    Country country;

    City({
        required this.id,
        required this.name,
        required this.country,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        country: Country.fromJson(json["country"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country.toJson(),
    };
}

class Country {
    String id;
    String name;

    Country({
        required this.id,
        required this.name,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Host {
    String id;
    String name;
    dynamic img;

    Host({
        required this.id,
        required this.name,
        this.img,
    });

    factory Host.fromJson(Map<String, dynamic> json) => Host(
        id: json["id"],
        name: json["name"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
    };
}
