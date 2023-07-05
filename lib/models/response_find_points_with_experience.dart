import 'dart:convert';

ResponseFindPointExperience responseFindPointExperienceFromJson(String str) => ResponseFindPointExperience.fromJson(json.decode(str));

String responseFindPointExperienceToJson(ResponseFindPointExperience data) => json.encode(data.toJson());

class ResponseFindPointExperience {
    ResponseFindPointExperience({
        required this.data,
    });

    Data data;

    factory ResponseFindPointExperience.fromJson(Map<String, dynamic> json) => ResponseFindPointExperience(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.findPointsWithExperience,
    });

    List<FindPointsWithExperience> findPointsWithExperience;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        findPointsWithExperience: List<FindPointsWithExperience>.from(json["findPointsWithExperience"].map((x) => FindPointsWithExperience.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "findPointsWithExperience": List<dynamic>.from(findPointsWithExperience.map((x) => x.toJson())),
    };
}

class FindPointsWithExperience {
    FindPointsWithExperience({
        required this.id,
        required this.name,
    });

    String id;
    String name;

    factory FindPointsWithExperience.fromJson(Map<String, dynamic> json) => FindPointsWithExperience(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
