import 'dart:convert';

ResponseBookings responseBookingsFromJson(String str) => ResponseBookings.fromJson(json.decode(str));

String responseBookingsToJson(ResponseBookings data) => json.encode(data.toJson());

class ResponseBookings {
    ResponseBookings({
        required this.data,
    });

    Data data;

    factory ResponseBookings.fromJson(Map<String, dynamic> json) => ResponseBookings(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.bookings,
    });

    List<Booking> bookings;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        bookings: List<Booking>.from(json["bookings"].map((x) => Booking.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "bookings": List<dynamic>.from(bookings.map((x) => x.toJson())),
    };
}

class Booking {
    Booking({
        required this.id,
        required this.attendees,
        required this.date,
        required this.hour,
    });

    String id;
    int attendees;
    DateTime date;
    Hour hour;

    factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        attendees: json["attendees"],
        date: DateTime.parse(json["date"]),
        hour: Hour.fromJson(json["hour"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attendees": attendees,
        "date": date.toIso8601String(),
        "hour": hour.toJson(),
    };
}

class Hour {
    Hour({
        required this.hour,
        required this.schedule,
    });

    String hour;
    Schedule schedule;

    factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        hour: json["hour"],
        schedule: Schedule.fromJson(json["schedule"]),
    );

    Map<String, dynamic> toJson() => {
        "hour": hour,
        "schedule": schedule.toJson(),
    };
}

class Schedule {
    Schedule({
        required this.tripp,
    });

    Tripp tripp;

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        tripp: Tripp.fromJson(json["tripp"]),
    );

    Map<String, dynamic> toJson() => {
        "tripp": tripp.toJson(),
    };
}

class Tripp {
    Tripp({
        required this.name,
        required this.price,
        required this.city,
        required this.host,
    });

    String name;
    int price;
    City city;
    Host host;

    factory Tripp.fromJson(Map<String, dynamic> json) => Tripp(
        name: json["name"],
        price: json["price"],
        city: City.fromJson(json["city"]),
        host: Host.fromJson(json["host"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "city": city.toJson(),
        "host": host.toJson(),
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

class Host {
    Host({
        this.img,
    });

    String? img;

    factory Host.fromJson(Map<String, dynamic> json) => Host(
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "img": img,
    };
}

