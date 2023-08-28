
// import 'dart:convert';

// ResponseApiProfile responseApiProfileFromJson(String str) =>
//     ResponseApiProfile.fromJson(json.decode(str));

// String responseApiProfileToJson(ResponseApiProfile data) =>
//     json.encode(data.toJson());

// class ResponseApiProfile {
//   Data data;

//   ResponseApiProfile({
//     required this.data,
//   });

//   factory ResponseApiProfile.fromJson(Map<String, dynamic> json) =>
//       ResponseApiProfile(
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//       };
// }

// class Data {
//   UserById userById;
//   List<Publication> publications;

//   Data({
//     required this.userById,
//     required this.publications,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         userById: UserById.fromJson(json["userById"]),
//         publications: List<Publication>.from(
//             json["publications"].map((x) => Publication.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "userById": userById.toJson(),
//         "publications": List<dynamic>.from(publications.map((x) => x.toJson())),
//       };
// }

// class UserById {
//   String name;
//   String profileImg;
//   String coverImg;
//   String biography;

//   UserById({
//     required this.name,
//     required this.profileImg,
//     required this.coverImg,
//     required this.biography,
//   });

//   factory UserById.fromJson(Map<String, dynamic> json) => UserById(
//         name: json["name"],
//         profileImg: json["profile_img"],
//         coverImg: json["cover_img"],
//         biography: json["biography"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "profile_img": profileImg,
//         "cover_img": coverImg,
//         "biography": biography,
//       };
// }

// class Publication {
//   String description;
//   List<Multimedia> multimedia;

//   Publication({
//     required this.description,
//     required this.multimedia,
//   });

//   factory Publication.fromJson(Map<String, dynamic> json) => Publication(
//         description: json["description"],
//         multimedia: List<Multimedia>.from(
//             json["multimedia"].map((x) => Multimedia.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "description": description,
//         "multimedia": List<dynamic>.from(multimedia.map((x) => x.toJson())),
//       };
// }

// class Multimedia {
//   String url;
//   String mimeType;

//   Multimedia({
//     required this.url,
//     required this.mimeType,
//   });

//   factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
//         url: json["url"],
//         mimeType: json["mimeType"],
//       );

//   Map<String, dynamic> toJson() => {
//         "url": url,
//         "mimeType": mimeType,
//       };
// }
