import 'dart:convert';

ResponseChangeBio responseChangeBioFromJson(String str) => ResponseChangeBio.fromJson(json.decode(str));

String responseChangeBioToJson(ResponseChangeBio data) => json.encode(data.toJson());

class ResponseChangeBio {
    Data data;

    ResponseChangeBio({
        required this.data,
    });

    factory ResponseChangeBio.fromJson(Map<String, dynamic> json) => ResponseChangeBio(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    ChangeBio changeBio;

    Data({
        required this.changeBio,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        changeBio: ChangeBio.fromJson(json["changeBio"]),
    );

    Map<String, dynamic> toJson() => {
        "changeBio": changeBio.toJson(),
    };
}

class ChangeBio {
    String bio;

    ChangeBio({
        required this.bio,
    });

    factory ChangeBio.fromJson(Map<String, dynamic> json) => ChangeBio(
        bio: json["bio"],
    );

    Map<String, dynamic> toJson() => {
        "bio": bio,
    };
}
