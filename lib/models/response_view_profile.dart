import 'dart:convert';

ResponseViewProfile responseViewProfileFromJson(String str) => ResponseViewProfile.fromJson(json.decode(str));

String responseViewProfileToJson(ResponseViewProfile data) => json.encode(data.toJson());

class ResponseViewProfile {
    Data data;

    ResponseViewProfile({
        required this.data,
    });

    factory ResponseViewProfile.fromJson(Map<String, dynamic> json) => ResponseViewProfile(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    ProfileById profileById;
    bool isFollow;

    Data({
        required this.profileById,
        required this.isFollow,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        profileById: ProfileById.fromJson(json["ProfileById"]),
        isFollow: json["isFollow"],
    );

    Map<String, dynamic> toJson() => {
        "ProfileById": profileById.toJson(),
        "isFollow": isFollow,
    };
}

class ProfileById {
    String name;
    String lastname;
    String profession;
    Country country;
    int totalFollows;
    int totalFavorites;
    String? bio;
    String? img;

    ProfileById({
        required this.name,
        required this.lastname,
        required this.profession,
        required this.country,
        required this.totalFollows,
        required this.totalFavorites,
        this.bio,
        this.img,
    });

    factory ProfileById.fromJson(Map<String, dynamic> json) => ProfileById(
        name: json["name"],
        lastname: json["lastname"],
        profession: json["profession"],
        country: Country.fromJson(json["country"]),
        totalFollows: json["totalFollows"],
        totalFavorites: json["totalFavorites"],
        bio: json["bio"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "profession": profession,
        "country": country.toJson(),
        "totalFollows": totalFollows,
        "totalFavorites": totalFavorites,
        "bio": bio,
        "img": img,
    };
}

class Country {
    String name;

    Country({
        required this.name,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}