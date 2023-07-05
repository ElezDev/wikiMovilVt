import 'dart:convert';

ResponseCommentByIdPublication responseCommentByIdPublicationFromJson(String str) => ResponseCommentByIdPublication.fromJson(json.decode(str));

String responseCommentByIdPublicationToJson(ResponseCommentByIdPublication data) => json.encode(data.toJson());

class ResponseCommentByIdPublication {
    ResponseCommentByIdPublication({
        required this.commentByIdPublication,
    });

    CommentByIdPublication commentByIdPublication;

    factory ResponseCommentByIdPublication.fromJson(Map<String, dynamic> json) => ResponseCommentByIdPublication(
        commentByIdPublication: CommentByIdPublication.fromJson(json["commentByIdPublication"]),
    );

    Map<String, dynamic> toJson() => {
        "commentByIdPublication": commentByIdPublication.toJson(),
    };
}

class CommentByIdPublication {
    CommentByIdPublication({
        required this.content,
        required this.numComments,
        required this.profile,
        required this.createdAt,
    });

    String content;
    int numComments;
    Profile profile;
    DateTime createdAt;

    factory CommentByIdPublication.fromJson(Map<String, dynamic> json) => CommentByIdPublication(
        content: json["content"],
        numComments: json["numComments"],
        profile: Profile.fromJson(json["profile"]),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "content": content,
        "numComments": numComments,
        "profile": profile.toJson(),
        "createdAt": createdAt.toIso8601String(),
    };
}


class Profile {
  Profile({
    required this.name,
    required this.img,
    required this.lastname,
    this.country,
  });

  String name;
  String? img;
  String lastname;
  Country? country;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        name: json["name"],
        img: json["img"],
        lastname: json["lastname"],
        country: json["country"] != null ? Country.fromJson(json["country"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
        "lastname": lastname,
        "country": country?.toJson(),
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
