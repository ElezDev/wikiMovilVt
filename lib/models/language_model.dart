import 'dart:convert';

LanguagesModel responseApiLanguagesFromJson(String str) =>
    LanguagesModel.fromJson(json.decode(str));
String responseApiLanguagesToJson(LanguagesModel data) =>
    json.encode(data.toJson());

class LanguagesModel {
  Data data;
  LanguagesModel({
    required this.data,
  });
  factory LanguagesModel.fromJson(Map<String, dynamic> json) =>
      LanguagesModel(
        data: Data.fromJson(json["data"]),
      );
  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<Language> languages;
  Data({
    required this.languages,
  });
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
      };
}

class Language {
  String id;
  String name;
  String sub;
  Language({
    required this.id,
    required this.name,
    required this.sub,
  });
  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        name: json["name"],
        sub: json["sub"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sub": sub,
      };
}
