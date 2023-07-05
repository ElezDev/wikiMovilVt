import 'dart:convert';

ResponseReservas responseReservasFromJson(String str) => ResponseReservas.fromJson(json.decode(str));

String responseReservasToJson(ResponseReservas data) => json.encode(data.toJson());

class ResponseReservas {
    ResponseReservas({
        required this.data,
    });

    Data data;

    factory ResponseReservas.fromJson(Map<String, dynamic> json) => ResponseReservas(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.bookingsByHost,
    });

    List<BookingsByHost> bookingsByHost;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        bookingsByHost: List<BookingsByHost>.from(json["bookingsByHost"].map((x) => BookingsByHost.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "bookingsByHost": List<dynamic>.from(bookingsByHost.map((x) => x.toJson())),
    };
}

class BookingsByHost {
    BookingsByHost({
         this.date,
         this.reservas,
         this.hour,
         this.name,
         this.city,
         this.country,
         this.price,
         this.language,
         this.url,
         this.users,
    });

    DateTime? date;
    int? reservas;
    String? hour;
    String? name;
    String? city;
    String? country;
    int? price;
    String? language;
    String? url;
    List<User>? users;


  
    factory BookingsByHost.fromJson(Map<String, dynamic> json) => BookingsByHost(
        date: DateTime.parse(json["date"]),
        reservas: json["reservas"],
        hour: json["hour"],
        name: json["name"],
        city: json["city"],
        country: json["country"],
        price: json["price"],
        language: json["language"],
        url: json["url"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    );



    Map<String, dynamic> toJson() => {
        "date": date!.toIso8601String(),
        "reservas": reservas,
        "hour": hour,
        "name": name,
        "city": city,
        "country": country,
        "price": price,
        "language": language,
        "url": url,
        "users": List<dynamic>.from(users!.map((x) => x.toJson())),
    };
}

class User {
    User({
        this.image,
         this.host,
    });

    String? image;
    bool? host;

    factory User.fromJson(Map<String, dynamic> json) => User(
        image: json["image"],
        host: json["host"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "host": host,
    };
}
