import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:wiki_virtualt/globals/globarVar.dart';
import 'package:wiki_virtualt/models/language_model.dart';
import 'package:wiki_virtualt/models/login_error_model.dart';
import 'package:wiki_virtualt/models/response_api_login.dart';
import 'package:wiki_virtualt/models/response_api_profile.dart';
import 'package:wiki_virtualt/models/response_api_register.dart';
import 'package:wiki_virtualt/models/response_change_bio.dart';
import 'package:wiki_virtualt/models/response_change_password.dart';
import 'package:wiki_virtualt/models/response_reset_password.dart';
import 'package:wiki_virtualt/models/response_send_code_change_password.dart';
import 'package:wiki_virtualt/models/response_verify_code_change_password.dart';
import 'package:wiki_virtualt/widgets/alert_generic.dart';

import '../errors/failure.dart';
import '../models/countries_model.dart';
import '../models/response_view_profile.dart';
import '../models/rol_model.dart';

class UserProvider extends GetConnect {
  final AlertGeneric _alertGeneric = AlertGeneric();

  get EasyLoading => null;

  Future<ResponseApiRegister?> register(
      String name, String username, String email, String password) async {
    try {
      Response response = await post(
        apiGraphql,
        {
          'query': '''
          mutation {
            register(
              registerUserInput: {
                name: "$name",
                username: "$username",
                email: "$email",
                password: "$password"
              }
            ) {
             access_token
            }
          }
        '''
        },
      );

      if (response.statusCode == 401) {
        Get.dialog(await _alertGeneric.alertGeneric(
            'Error', 'Por favor verifique su correo o contraseña'));
      }

      if (response.statusCode != 200) {
        Get.dialog(await _alertGeneric.alertGeneric(
            'Error', 'Algo salió mal, vuelve a intentarlo'));
      }

      if (response.statusCode == 200) {
        if (response.body["data"] != null) {
          ResponseApiRegister responseApiRegister =
              ResponseApiRegister.fromJson(response.body);
          return responseApiRegister;
        } else {
          LoginErrorModel errorLogin = LoginErrorModel.fromJson(response.body);
          throw Failure(errorLogin.errors[0].message);
        }
      }
    } on Failure catch (e) {
      throw Failure(e.message);
    }
    return null;
  }

  Future login(String email, String password) async {
    try {
      ResponseApiLogin responseApiLogin;
      Response response = await post(
        apiGraphql,
        {
          'query': '''
            mutation {
              login(
                loginUserInput: {
                  email: "$email"
                  password: "$password"
                }
              )
              {
              access_token
              registered
              user{
              name
              email
               }
              }
            }
          '''
        },
      );

      if (response.statusCode == 401) {
        Get.dialog(await _alertGeneric.alertGeneric(
            'Error', 'Por favor verifique su correo o contraseña'));
      }

      if (response.statusCode != 200) {
        Get.dialog(await _alertGeneric.alertGeneric(
            'Error', 'Algo salio mal, vuelve a intentarlo'));
      }

      if (response.statusCode == 200) {
        if (response.body["data"] != null) {
          responseApiLogin = ResponseApiLogin.fromJson(response.body);
          return responseApiLogin;
        } else {
          LoginErrorModel errorLogin = LoginErrorModel.fromJson(response.body);
          throw Failure(errorLogin.errors[0].message);
        }
      }
    } on Failure catch (e) {
      throw Failure(e.message);
    }
  }

  Future typeUser(String email, String password) async {
    try {
      ResponseApiLogin responseApiLogin;
      Response response = await post(
        apiGraphql,
        {
          'query': '''
            mutation {
              login(
                loginInput: {
                  email: "$email"
                  password: "$password"
                }
              )
              {
                accessToken
                emailVerified
                registered
              }
            }
          '''
        },
      );

      if (response.statusCode == 200) {
        if (response.body["data"] != null) {
          responseApiLogin = ResponseApiLogin.fromJson(response.body);
          return responseApiLogin;
        } else {
          LoginErrorModel errorLogin = LoginErrorModel.fromJson(response.body);
          throw Failure(errorLogin.errors[0].message);
        }
      }
    } on Failure catch (e) {
      throw Failure(e.message);
    }
  }

  Future<ResponseApiProfile?> getProfile() async {
    String token = GetStorage().read('token');
    try {
      Response response = await post(apiGraphql, {
        'query': '''
        query {
          users {
            id
            name
            username
            biography
          }
        }
      '''
      }, headers: {
        'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        if (response.body != null) {
          ResponseApiProfile responseApiProfile =
              ResponseApiProfile.fromJson(response.body);
          return responseApiProfile;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<bool> updateProfile(
      String name,
      String lastname,
      String gender,
      String dateOfBirth,
      String prefix,
      int phone,
      String? profession,
      String country) async {
    String token = GetStorage().read('token');
    Response response = await post(
      apiGraphql,
      {
        'query': '''
          mutation {
            registerTripp(
              createTrippsterInput: {
                name: "$name"
                lastname: "$lastname"
                gender: $gender
                dateOfBirth: "$dateOfBirth"
                countryId: "$country"
                prefix: "$prefix"
                phone: $phone
                profession: "$profession"
              }
            ) {
              id
            }
          }
        '''
      },
      headers: {'Authorization': 'Bearer $token'},
    );

    // if (response.statusCode != 200) {
    //   Get.dialog(await _alertGeneric.alertGeneric(
    //       'Error', 'Algo salio mal, vuelve a intentarlo'));
    //   return false;
    // }
    return true;
  }

  Future<bool> verifyEmail(String code) async {
    String token = GetStorage().read('token');
    Response response = await post(apiGraphql, {
      'query': '''
        {
          verifyEmail(
            code: $code
          ) {
            message
            status
          }
        }
      '''
    }, headers: {
      'Authorization': 'Bearer $token'
    });

    // if (response.statusCode != 200) {
    //   Get.dialog(await _alertGeneric.alertGeneric(
    //       'Error', 'Algo salio mal, vuelve a intentarlo'));
    // }
    return response.body['data']['verifyEmail']['status'];
  }

  Future<ResponseChangePassword> changePassword(
      String oldPassword, String newPassword) async {
    String token = GetStorage().read('token');
    Response response = await post(apiGraphql, {
      'query': '''
      mutation{
        changePassword(
          changePasswordInput:{
            oldPassword: "$oldPassword"
            newPassword: "$newPassword"
          }
        )
      }
      '''
    }, headers: {
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode != 200) {
      Get.dialog(await _alertGeneric.alertGeneric(
          'Error password', 'Algo salio mal intenta de nuevo'));
    }
    ResponseChangePassword responseChangePassword =
        ResponseChangePassword.fromJson(response.body);

    return responseChangePassword;
  }

  Future<ResponseViewProfile> viewProfileById(String id) async {
    String token = GetStorage().read('token');
    Response response = await post(apiGraphql, {
      'query': '''
        query pageViewProfile(\$id: String!){
          ProfileById(
            id: \$id
          ) {
            name
            lastname
            profession
            country {
              name
            }
            totalFollows
            totalFavorites
            bio
            img
          }
          isFollow(
            followedId: \$id
          )
        }
      ''',
      'variables': {'id': id}
    }, headers: {
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode != 200) {
      Get.dialog(await _alertGeneric.alertGeneric(
          'Error', 'Algo salio mal, vuelve a intentarlo'));
    }

    ResponseViewProfile responseViewProfile =
        ResponseViewProfile.fromJson(response.body);

    return responseViewProfile;
  }

  Future<void> followUser(String id) async {
    String token = GetStorage().read('token');
    GetStorage().remove('profileUsersById');
    Response response = await post(apiGraphql, {
      'query': '''
        mutation {
          followUser (
            followedId: "$id"
          )
        }
      '''
    }, headers: {
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode != 200) {
      Get.dialog(await _alertGeneric.alertGeneric(
          'Error', 'Algo salio mal, vuelve a intentarlo'));

      if (response.body['errors'] != null)
        Get.dialog(
          await _alertGeneric.alertGeneric(
              'Error', 'Algo salio mal, vuelve a intentarlo'),
        );
    }
  }

  Future<ResponseSendCodeChangePassword> sendCodeChangePassword(
      String email) async {
    Response response = await post(apiGraphql, {
      'query': '''
        mutation
        {
          sendCodeChangePassword(email:"$email")
        }
        '''
    });

    if (response.statusCode != 200) {
      Get.dialog(await _alertGeneric.alertGeneric('Error',
          'Algo salio mal al recuperar la contraseña, intenta de nuevo'));
    }
    ResponseSendCodeChangePassword responseSendCodeChangePassword =
        ResponseSendCodeChangePassword.fromJson(response.body);

    return responseSendCodeChangePassword;
  }

  Future<ResponseVerifyCodeChangePassword> verifyCodeChangePassword(
      String code) async {
    Response response = await post(apiGraphql, {
      'query': '''
      mutation
      {
        verifyCodeChangePassword(code:$code)
      }
      '''
    });

    if (response.statusCode != 200) {
      Get.dialog(await _alertGeneric.alertGeneric('Error',
          'Algo salio mal al recuperar la contraseña, intenta de nuevo'));
    }
    ResponseVerifyCodeChangePassword responseVerifyCodeChangePassword =
        ResponseVerifyCodeChangePassword.fromJson(response.body);
    GetStorage().write('recoverToken',
        responseVerifyCodeChangePassword.data.verifyCodeChangePassword);
    return responseVerifyCodeChangePassword;
  }

  Future<ResponseResetPassword> resetPassword(String resetPassword) async {
    String token = GetStorage().read('recoverToken');
    Response response = await post(
      apiGraphql,
      {
        'query': '''
      mutation{
      resetPassword(password:"$resetPassword")
          }
      '''
      },
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode != 200) {
      Get.dialog(await _alertGeneric.alertGeneric(
          'Error password', 'Algo salio mal intenta de nuevo'));
    }
    ResponseResetPassword responseResetPassword =
        ResponseResetPassword.fromJson(response.body);
    return responseResetPassword;
  }

  Future<List?> getLanguages() async {
    try {
      Response response = await post(
        apiGraphql,
        {
          'query': '''
            {
            languages{
              id
              name
              sub
            }
          }
        '''
        },
      );

      // if (response.statusCode != 200) {
      //   Get.dialog(await _alertGeneric.alertGeneric(
      //       'Error', 'Algo salio mal, vuelve a intentarlo'));
      // }

      if (response.statusCode == 200) {
        if (response.body["data"] != null) {
          LanguagesModel responseApiLogin =
              LanguagesModel.fromJson(response.body);
          return responseApiLogin.data.languages;
        } else {
          LoginErrorModel errorLogin = LoginErrorModel.fromJson(response.body);
          throw Failure(errorLogin.errors[0].message);
        }
      }
    } on Failure catch (e) {
      throw Failure(e.message);
    }
    return null;
  }

  Future<List?> getCountries() async {
    try {
      Response response = await post(apiGraphql, {
        'query': '''
            {
              countries {
                id
                name
              }
            }
        '''
      }, headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}'
      });

      // if (response.statusCode != 200) {
      //   Get.dialog(await _alertGeneric.alertGeneric(
      //       'Error', 'Algo salio mal, vuelve a intentarlo'));
      // }

      if (response.statusCode == 200) {
        if (response.body["data"] != null) {
          CountriesModel responseApiLogin =
              CountriesModel.fromJson(response.body);
          return responseApiLogin.data.countries;
        } else {
          LoginErrorModel errorLogin = LoginErrorModel.fromJson(response.body);
          throw Failure(errorLogin.errors[0].message);
        }
      }
    } on Failure catch (e) {
      throw Failure(e.message);
    }
    return null;
  }

  Future<List?> getRol() async {
    try {
      Response response = await post(
        apiGraphql,
        {
          'query': '''
            {
              {
                roles {
                  id
                  rol
                }
              }
            }
        '''
        },
      );

      // if (response.statusCode != 200) {
      //   Get.dialog(await _alertGeneric.alertGeneric(
      //       'Error', 'Algo salio mal, vuelve a intentarlo'));
      // }

      if (response.statusCode == 200) {
        if (response.body["data"] != null) {
          RolModel responseApiLogin = RolModel.fromJson(response.body);
          return responseApiLogin.data.roles;
        } else {
          LoginErrorModel errorLogin = LoginErrorModel.fromJson(response.body);
          throw Failure(errorLogin.errors[0].message);
        }
      }
    } on Failure catch (e) {
      throw Failure(e.message);
    }
    return null;
  }

  Future<ResponseChangeBio> changeBio(String bio) async {
    String token = GetStorage().read('token');
    Response response = await post(apiGraphql, {
      'query': '''
      mutation{
              changeBio(bio:"$bio")
              {
                bio
              }
        }
      '''
    }, headers: {
      'Authorization': 'Bearer $token'
    });

    // if (response.statusCode != 200) {
    //   Get.dialog(await _alertGeneric.alertGeneric(
    //       'Error', 'Algo salio mal, vuelve a intentarlo'));
    // }
    ResponseChangeBio responseChangeBio =
        ResponseChangeBio.fromJson(response.body);
    return responseChangeBio;
  }

  Future<bool> updatePdf(XFile data) async {
    String token = GetStorage().read('token');
    String profileId = GetStorage().read('profile_id');

    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse('$api/profile/RUT'));
    request.headers['authorization'] = 'Bearer $token';

    request.files.add(await http.MultipartFile.fromPath('file', data.path));

    EasyLoading.show(status: 'Subiendo Pdf...');
    try {
      http.StreamedResponse response = await request.send();
      print(response);
      if (response.statusCode == 201) {
        EasyLoading.showSuccess('Pdf subido!');
        EasyLoading.dismiss();
        return true;
      }
    } catch (e) {
      print(e);
    }
    EasyLoading.showError('Error subiendo Pdf!');
    EasyLoading.dismiss();
    return false;
  }

  Future uploadImage(XFile data) async {
    String token = GetStorage().read('token');
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse('$api/profile/image'));
    request.headers['authorization'] = 'Bearer $token';

    File file = File(data.path);
    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    await EasyLoading.show(status: 'Subiendo multimedia...');
    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 201) {
        await EasyLoading.showSuccess('Multimedia subida!');
        await EasyLoading.dismiss();
        return true;
      }
    } catch (e) {
      print(e);
    }
    await EasyLoading.showError('Error subiendo multimedia!');
    await EasyLoading.dismiss();
    return false;
  }

  Future<bool> uploadPhotoDocument(XFile data, bool isFront) async {
    String token = GetStorage().read('token');
    String profileId = GetStorage().read('profile_id');
    String endPoint = isFront ? 'front' : 'back';

    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse('$api/profile/DNI/$endPoint'));
    request.headers['authorization'] = 'Bearer $token';
    /////////////////////
    request.files.add(await http.MultipartFile.fromPath('file', data.path));

    String documentType = isFront ? 'Frontal' : 'Reverso';
    EasyLoading.show(status: 'Subiendo Documento $documentType...');
    try {
      http.StreamedResponse response = await request.send();
      print(response);
      if (response.statusCode == 201) {
        String successMessage = 'Documento $documentType subido';
        EasyLoading.showSuccess(successMessage);
        EasyLoading.dismiss();
        return true;
      }
    } catch (e) {
      print(e);
    }
    String errorMessage = 'Error al subir documento $documentType';
    EasyLoading.showError(errorMessage);
    return false;
  }
}
