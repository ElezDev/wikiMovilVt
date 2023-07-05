import 'dart:convert';

ResponseNextTripps responseNextTrippsFromJson(String str) => ResponseNextTripps.fromJson(json.decode(str));

String responseNextTrippsToJson(ResponseNextTripps data) => json.encode(data.toJson());

class ResponseNextTripps {
    Data data;

    ResponseNextTripps({
        required this.data,
    });

    factory ResponseNextTripps.fromJson(Map<String, dynamic> json) => ResponseNextTripps(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    List<NextTripp> nextTripps;

    Data({
        required this.nextTripps,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        nextTripps: List<NextTripp>.from(json["nextTripps"].map((x) => NextTripp.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nextTripps": List<dynamic>.from(nextTripps.map((x) => x.toJson())),
    };
}

class NextTripp {
    DateTime date;
    int attendees;
    Hour hour;

    NextTripp({
        required this.date,
        required this.attendees,
        required this.hour,
    });

    factory NextTripp.fromJson(Map<String, dynamic> json) => NextTripp(
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
    String locationDescription;
    String locationName;
    double latitude;
    double longitude;
    String name;
    int price;
    Language language;
    List<Gallery> gallery;
    Host host;
    City city;

    Tripp({
        required this.locationDescription,
        required this.locationName,
        required this.latitude,
        required this.longitude,
        required this.name,
        required this.price,
        required this.language,
        required this.gallery,
        required this.host,
        required this.city,
    });

    factory Tripp.fromJson(Map<String, dynamic> json) => Tripp(
        locationDescription: json["locationDescription"],
        locationName: json["locationName"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        name: json["name"],
        price: json["price"],
        language: Language.fromJson(json["language"]),
        gallery: List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
        host: Host.fromJson(json["host"]),
        city: City.fromJson(json["city"]),
    );

    Map<String, dynamic> toJson() => {
        "locationDescription": locationDescription,
        "locationName": locationName,
        "latitude": latitude,
        "longitude": longitude,
        "name": name,
        "price": price,
        "language": language.toJson(),
        "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
        "host": host.toJson(),
        "city": city.toJson(),
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
