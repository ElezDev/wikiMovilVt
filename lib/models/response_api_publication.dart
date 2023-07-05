// import 'dart:convert';
// import 'package:geocoding/geocoding.dart';

// ResponseApiPublications responseApiPublicationsFromJson(String str) =>
//     ResponseApiPublications.fromJson(json.decode(str));

// String responseApiPublicationsToJson(ResponseApiPublications data) =>
//     json.encode(data.toJson());

// class ResponseApiPublications {
//   ResponseApiPublications({
//     required this.data,
//   });

//   Data data;

//   factory ResponseApiPublications.fromJson(Map<String, dynamic> json) =>
//       ResponseApiPublications(
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//       };
// }

// class Data {
//   Data({
//     required this.publications,
//   });

//   List<Publication> publications;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         publications: List<Publication>.from(
//             json["publications"].map((x) => Publication.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "publications": List<dynamic>.from(publications.map((x) => x.toJson())),
//       };
// }

// class Publication {
//   Publication({
//     required this.id,
//     required this.longitude,
//     required this.latitude,
//     required this.description,
//     required this.numLikes,
//     required this.media,
//     required this.profile,
//     this.placeName,
//     required this.comments,
//   });

//   String? id;
//   String longitude;
//   String latitude;
//   String? description;
//   int? numLikes;
//   List<Media> media;
//   Profile profile;
//   String? placeName;
//   List<Comments> comments;

//   factory Publication.fromJson(Map<String, dynamic> json) {
//     String longitude = json["longitude"].toString();
//     String latitude = json["latitude"].toString();

//     return Publication(
//       id: json["id"],
//       longitude: longitude,
//       latitude: latitude,
//       description: json["description"],
//       numLikes: json["numLikes"],
//       media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
//       profile: Profile.fromJson(json["profile"]),
//       comments: List<Comments>.from(
//           json["comments"].map((x) => Comments.fromJson(x))),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "longitude": longitude,
//         "latitude": latitude,
//         "description": description,
//         "numLikes": numLikes,
//         "media": List<dynamic>.from(media.map((x) => x.toJson())),
//         "profile": profile.toJson(),
//         "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
//       };
// }

// class Media {
//   Media({
//     required this.url,
//     required this.mimeType,
//   });

//   String url;
//   String mimeType;

//   factory Media.fromJson(Map<String, dynamic> json) => Media(
//         url: json["url"],
//         mimeType: json["mimeType"],
//       );

//   Map<String, dynamic> toJson() => {
//         "url": url,
//         "mimeType": mimeType,
//       };
// }

// class Profile {
//   Profile({
//     this.id,
//     required this.name,
//     required this.img,
//     required this.lastname,
//   });

//   String? id;
//   String name;
//   String? img;
//   String lastname;

//   factory Profile.fromJson(Map<String, dynamic> json) => Profile(
//         id: json["id"],
//         name: json["name"],
//         img: json["img"],
//         lastname: json["lastname"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "img": img,
//         "lastname": lastname,
//       };
// }

// class Comments {
//   Comments({
//     required this.content,
//   });

//   String content;

//   factory Comments.fromJson(Map<String, dynamic> json) => Comments(
//         content: json["content"],
//       );

//   Map<String, dynamic> toJson() => {
//         "content": content,
//       };
// }

// Future<void> fetchPlaceName(Publication? publication) async {
//   if (publication != null) {
//     double latitude = double.parse(publication.latitude);
//     double longitude = double.parse(publication.longitude);

//     try {
//       List<Placemark> placemarks =
//           await placemarkFromCoordinates(latitude, longitude);
//       String name = placemarks.isNotEmpty
//           ? getFormattedAddress(placemarks.first)
//           : 'Dirección desconocida';

//       publication.placeName = name;
//     } catch (e) {
//       // Manejar el error
//       print('Error al obtener el nombre del lugar: $e');
//       publication.placeName = 'N/N';
//     }
//   }
// }

// String getFormattedAddress(Placemark placemark) {
//   final addressParts = <String>[];

//   // if (placemark.subLocality != null) {
//   //   addressParts.add(placemark.subLocality!);
//   // }
//   if (placemark.locality != null) {
//     addressParts.add(placemark.locality!);
//   }
//   if (placemark.country != null) {
//     addressParts.add(placemark.country!);
//   }

//   return addressParts.join(' , ');
// }
