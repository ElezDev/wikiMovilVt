// To parse this JSON data, do
//
//     final cartShoppingModel = cartShoppingModelFromJson(jsonString);

import 'dart:convert';

CartShoppingModel cartShoppingModelFromJson(String str) =>
    CartShoppingModel.fromJson(json.decode(str));

String cartShoppingModelToJson(CartShoppingModel data) =>
    json.encode(data.toJson());

class CartShoppingModel {
  Data data;

  CartShoppingModel({
    required this.data,
  });

  factory CartShoppingModel.fromJson(Map<String, dynamic> json) =>
      CartShoppingModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<GetCart> getCart;

  Data({
    required this.getCart,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        getCart:
            List<GetCart>.from(json["getCart"].map((x) => GetCart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getCart": List<dynamic>.from(getCart.map((x) => x.toJson())),
      };
}

class GetCart {
  String id;
  int attendees;
  DateTime date;
  Hour hour;
  bool isSelect;

  GetCart({
    required this.id,
    required this.attendees,
    required this.date,
    required this.hour,
    required this.isSelect,
  });

  factory GetCart.fromJson(Map<String, dynamic> json) => GetCart(
        id: json["id"],
        attendees: json["attendees"],
        date: DateTime.parse(json["date"]),
        hour: Hour.fromJson(json["hour"]),
        isSelect: json["isSelect"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attendees": attendees,
        "date": date.toIso8601String(),
        "hour": hour.toJson(),
      };
}

class Hour {
  String hour;
  Schedule schedule;

  Hour({
    required this.hour,
    required this.schedule,
  });

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
  Language language;
  int price;
  City city;
  List<Gallery> gallery;

  Tripp({
    required this.name,
    required this.language,
    required this.price,
    required this.city,
    required this.gallery,
  });

  factory Tripp.fromJson(Map<String, dynamic> json) => Tripp(
        name: json["name"],
        language: Language.fromJson(json["language"]),
        price: json["price"],
        city: City.fromJson(json["city"]),
        gallery:
            List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "language": language.toJson(),
        "price": price,
        "city": city.toJson(),
        "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
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
