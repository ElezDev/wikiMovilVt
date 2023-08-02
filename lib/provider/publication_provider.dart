import 'package:get/get.dart';
import 'package:wiki_virtualt/globals/globarVar.dart';
import 'package:wiki_virtualt/models/response_api_publication.dart';


class PublicationProvider extends GetConnect {
  Future<ResponseApiPublications> getPublications() async {
    Response response = await post(apiGraphql, {
      'query': '''
        query{
           publications{
            id
            description
             user{
             name
             email
              profile_img
               }
              categories{
                name
                  }
                multimedia{
                  url
                  mimeType
                }
                comments{
                  comment
                }
              }
        }
      '''
    });

    if (response.statusCode != 200) {
      Get.snackbar('Error', 'S192.168.10.143omething went wrong');
    }

    ResponseApiPublications responseApiPublications =
        ResponseApiPublications.fromJson(response.body);
    return responseApiPublications;
  }

  
}