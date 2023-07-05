import 'dart:convert';

ResponseApiFollows responseApiFollowsFromJson(String str) {
  return ResponseApiFollows.fromJson(json.decode(str));
}

String responseApiFollowsToJson(ResponseApiFollows data) {
  return json.encode(data.toJson());
}

ResponseSearchFollows responseSearchFollowsFromJson(String str) {
  return ResponseSearchFollows.fromJson(json.decode(str));
}

String responseSearchFollowsToJson(ResponseSearchFollows data) {
  return json.encode(data.toJson());
}

class ResponseSearchFollows {
  ResponseSearchFollows({required this.data});

  DataFound data;

  factory ResponseSearchFollows.fromJson(Map<String, dynamic> json) {
    return ResponseSearchFollows(data: DataFound.fromJson(json["data"]));
  }

  Map<String, dynamic> toJson() {
    return {"data": data.toJson()};
  }
}

class DataFound {
  DataFound({required this.findFollowers});
  List<FindFollowers> findFollowers;

  factory DataFound.fromJson(Map<String, dynamic> json) {
    return DataFound(
      findFollowers: List<FindFollowers>.from(json["findFollowersByQuery"].map((x)=>FindFollowers.fromJson(x)))
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "findFollowersByQuery": List<dynamic>.from(findFollowers.map((x) => x.toJson()))
    };
  }
}

class ResponseApiFollows {
  ResponseApiFollows({required this.data});

  Data data;

  factory ResponseApiFollows.fromJson(Map<String, dynamic> json) {
    return ResponseApiFollows(data: Data.fromJson(json["data"]));
  }

  Map<String, dynamic> toJson() {
    return {"data": data.toJson()};
  }
}

class Data {
  Data({required this.findFollowers});
  List<FindFollowers> findFollowers;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      findFollowers: List<FindFollowers>.from(json["findFollowers"].map((x)=>FindFollowers.fromJson(x)))
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "findFollowers": List<dynamic>.from(findFollowers.map((x) => x.toJson()))
    };
  }
}

class FindFollowers {
  FindFollowers(
      {required this.id, required this.follower, required this.followed});
  String id;
  Profile follower;
  Profile followed;

  factory FindFollowers.fromJson(Map<String, dynamic> json) {
    return FindFollowers(
        id: json["id"],
        follower: Profile.fromJson(json["follower"]),
        followed: Profile.fromJson(json["followed"]));
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "follower": follower.toJson(),
      "followed": followed.toJson()
    };
  }
}

class Profile {
  Profile(
      {required this.name,
      required this.dateOfBirth,
      required this.profession,
      this.img,
      required this.country,
      required this.verifiedHost});
  String name;
  DateTime dateOfBirth;
  String? img;
  String profession;
  Country country;
  bool verifiedHost;

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        name: json["name"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        img: json["img"],
        profession: json["profession"],
        country: Country.fromJson(json["country"]),
        verifiedHost: json["verifiedHost"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "dateOfBirth": dateOfBirth,
      "img": img.toString(),
      "profession": profession,
      "Country": country.toJson(),
      "verifiedHost": verifiedHost
    };
  }
}

class Country {
  Country({required this.name});

  String name;

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(name: json["name"]);
  }

  Map<String, dynamic> toJson() {
    return {"name": name};
  }
}
