import 'dart:convert';
import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;
import 'package:wiki_virtualt/globals/globarVar.dart';

class CreatePublicationProvider extends GetxController {

    Future<String> createPublication(String description) async {
    String token = GetStorage().read('token');
    http.Response response = await http.post(
      Uri.parse(apiGraphql),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'query': '''
         mutation createPublication(\$description: String!) {
          createPublication(publication: {
            description: \$description
          }) {
            id
            description
          }
        }
        ''',
        'variables': {'description': description},
      }),
    );

    if (response.statusCode != 200) {
      Get.snackbar('Error', 'Something went wrong-Servidor');
    }

    dynamic jsonResponse = json.decode(response.body);
    String publicationId = jsonResponse['data']['createPublication']['id'].toString();
    print('Objeto completo - createPublication: ${json.encode(jsonResponse)}');

    return publicationId;
  }
  

  // Future<void> addLocation(String publicationId) async {
  //   double latitude = 0;
  //   double longitude = 0;
  //   try {
  //     latitude = GetStorage().read('lat');
  //     longitude = GetStorage().read('lng');
  //   } catch (e) {
  //     latitude = 0;
  //     longitude = 0;
  //   }

  //   String token = GetStorage().read('token');
  //   http.Response response = await http.post(
  //     Uri.parse(apiGraphql),
  //     headers: {
  //       'Authorization': 'Bearer $token',
  //       'Content-Type': 'application/json'
  //     },
  //     body: json.encode({
  //       'query': '''
  //         mutation {
  //           ubicationPublication(ubicationPublication: {
  //             latitud: $latitude,
  //             longitud: $longitude,
  //             publicationId: "$publicationId"
  //           }) {
  //             description
  //           }
  //         }
  //       '''
  //     }),
  //   );

  //   if (response.statusCode != 200) {
  //     Get.snackbar('Error', 'Something went wrong');
  //   }

  //   print('Objeto completo - addLocation: ${response.body}');
  // }

  Future<void> uploadImage(File imageFile, String publicationId) async {
    String token = GetStorage().read('token');
    String url = 'http://192.168.101.9:3002/publication/$publicationId';
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Authorization'] = 'Bearer $token';

    String extension = path.extension(imageFile.path).substring(1);

    String contentType;
    if (extension == 'png') {
      contentType = 'image/png';
    } else if (extension == 'jpg' || extension == 'jpeg') {
      contentType = 'image/jpeg';
    } else {
      print('Formato de archivo no válido');
      return;
    }
    request.files.add(await http.MultipartFile.fromPath(
      'files',
      imageFile.path,
      contentType: MediaType('image', extension),
    ));

    EasyLoading.show(status: 'Creando Publicación...');
    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 201) {
        EasyLoading.showSuccess('Publicación creada!');
        return;
      } else {}
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> uploadVideo(File videoFile, String publicationId) async {
    String token = GetStorage().read('token');
    String url = '$api/publication/$publicationId';
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Authorization'] = 'Bearer $token';

    String extension = path.extension(videoFile.path).substring(1);

    String contentType;
    if (extension == 'mp4') {
      contentType = 'video/mp4';
    } else if (extension == 'mov') {
      contentType = 'video/quicktime';
    } else {
      print('Formato de archivo no válido');
      return;
    }

    request.files.add(await http.MultipartFile.fromPath(
      'files',
      videoFile.path,
      contentType: MediaType('video', extension),
    ));

    EasyLoading.show(status: 'Creando Publicación...');
    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 201) {
        EasyLoading.showSuccess('Publicación creada!');
        return;
      } else {}
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> createTags(List<String>? followIds) async {
    String token = GetStorage().read('token');
    String publicationId = GetStorage().read('publication_id');

    http.Response response = await http.post(
      Uri.parse(apiGraphql),
      headers: {'Authorization': 'Bearer $token'},
      body: {
        'query': '''
          mutation {
            createTags(
              publicationID:"$publicationId",
              followIds:${jsonEncode(followIds)}
            ){
              follow{
                id
              }
            }
          }
        '''
      },
    );
    if (response.statusCode == 200) {
      return;
    } else {
      Get.snackbar('Error', 'Something went wrong - Servidor');
    }
  }
}
