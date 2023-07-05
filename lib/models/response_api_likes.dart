// import 'dart:convert';

// ResponseApiLikeDislike responseApiLikeDislikeFromJson(String str) => ResponseApiLikeDislike.fromJson(json.decode(str));

// String responseApiLikeDislikeToJson(ResponseApiLikeDislike data) => json.encode(data.toJson());

// class ResponseApiLikeDislike {
//     ResponseApiLikeDislike({
//         required this.message,
//         required this.createdAt,
//     });

//     String message;
//     DateTime createdAt;

//     factory ResponseApiLikeDislike.fromJson(Map<String, dynamic> json) => ResponseApiLikeDislike(
//         message: json["message"],
//         createdAt: DateTime.parse(json["createdAt"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "message": message,
//         "createdAt": createdAt.toIso8601String(),
//     };
// }

// class LikePublication {
//     LikePublication({
//         required this.publicationId,
//     });

//     String publicationId;

//     Map<String, dynamic> toJson() => {
//         "publication_id": publicationId,
//     };
// }
