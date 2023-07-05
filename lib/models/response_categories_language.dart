import 'dart:convert';

ResponseCategoriesLanguages responseCategoriesLanguagesFromJson(String str) => ResponseCategoriesLanguages.fromJson(json.decode(str));

String responseCategoriesLanguagesToJson(ResponseCategoriesLanguages data) => json.encode(data.toJson());

class ResponseCategoriesLanguages {
    ResponseCategoriesLanguages({
        required this.data,
    });

    Data data;

    factory ResponseCategoriesLanguages.fromJson(Map<String, dynamic> json) => ResponseCategoriesLanguages(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.languages,
        required this.categories,
    });

    List<Language> languages;
    List<Category> categories;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {
    Category({
        required this.id,
        required this.name,
    });

    String id;
    String name;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Language {
    Language({
        required this.id,
        required this.sub,
    });

    String id;
    String sub;

    factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        sub: json["sub"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sub": sub,
    };
}