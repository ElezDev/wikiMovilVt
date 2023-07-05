import 'dart:convert';

ResponseApiCountries responseApiCountriesFromJson(String str) => ResponseApiCountries.fromJson(json.decode(str));

String responseApiCountriesToJson(ResponseApiCountries data) => json.encode(data.toJson());

class ResponseApiCountries {
    ResponseApiCountries({
        required this.data,
    });

    Data data;

    factory ResponseApiCountries.fromJson(Map<String, dynamic> json) => ResponseApiCountries(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.countries,
    });

    List<Country> countries;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    };
}

class Country {
    Country({
        required this.id,
        required this.name,
    });

    String id;
    String name;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
