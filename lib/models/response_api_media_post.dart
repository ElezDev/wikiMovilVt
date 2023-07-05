import 'dart:convert';

ResponseApiMediaPost responseApiMediaPostFromJson(String str) => ResponseApiMediaPost.fromJson(json.decode(str));

String responseApiMediaPostToJson(ResponseApiMediaPost data) => json.encode(data.toJson());

class ResponseApiMediaPost {
    ResponseApiMediaPost({
        required this.data,
    });

    Data data;

    factory ResponseApiMediaPost.fromJson(Map<String, dynamic> json) => ResponseApiMediaPost(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.uploadMedia,
    });

    List<MediaPost> uploadMedia;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        uploadMedia: List<MediaPost>.from(json["uploadMedia"].map((x) => MediaPost.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uploadMedia": List<dynamic>.from(uploadMedia.map((x) => x.toJson())),
    };
}

class MediaPost {
    MediaPost({
        required this.url,
    });

    String url;

    factory MediaPost.fromJson(Map<String, dynamic> json) => MediaPost(
        url: json["url"],

    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}
