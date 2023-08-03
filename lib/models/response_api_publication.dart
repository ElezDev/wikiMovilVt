class ResponseApiPublications{
  ResponseApiPublications({
    required this.data,
  });

  Data data;

  factory ResponseApiPublications.fromJson(Map<String, dynamic> json) =>
      ResponseApiPublications(data: Data.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.publications,
  });

  List<Publication> publications;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        publications: List<Publication>.from(
          json["publications"].map((x) => Publication.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "publications": List<dynamic>.from(publications.map((x) => x.toJson())),
      };
}

class Publication {
  Publication({
    required this.id,
    required this.description,
    required this.user,
    // required this.categories,
    required this.multimedia,
    required this.comments,
  });

  int id;
  String description;
  User user;
  // Categories categories;
  List<Multimedia> multimedia;
  List<Comment> comments;

  factory Publication.fromJson(Map<String, dynamic> json) => Publication(
        id: json["id"],
        description: json["description"],
        user: User.fromJson(json["user"]),
        // categories: Categories.fromJson(json["categories"]),
        multimedia: List<Multimedia>.from(
          json["multimedia"].map((x) => Multimedia.fromJson(x)),
        ),
        comments: List<Comment>.from(
          json["comments"].map((x) => Comment.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "user": user.toJson(),
        // "categories": categories.toJson(),
        "multimedia": List<dynamic>.from(multimedia.map((x) => x.toJson())),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
      };
}

class User {
  User({
    required this.name,
    required this.email,
    required this.profile_img,
    
  });
  String profile_img;
  String name;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
         profile_img: json["profile_img"] ,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "profile_img": profile_img,
      };
}

class Categories {
  Categories({
    required this.name,
  });

  String name;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Multimedia {
  Multimedia({
    required this.url,
    required this.mimeType
  });

  String url;
  String  mimeType;

  factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
        url: json["url"],
        mimeType: json["mimeType"]
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Comment {
  Comment({
    required this.comment,
  });

  String comment;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "comment": comment,
      };
}
