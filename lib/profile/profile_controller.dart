import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wiki_virtualt/models/response_api_profile.dart';
import 'package:wiki_virtualt/models/response_profile.dart';
import 'package:wiki_virtualt/provider/user_provider.dart';
import 'package:wiki_virtualt/widgets/alert_generic.dart';


class ProfileController extends GetxController {
  final UserProvider userProvider = UserProvider();
  final AlertGeneric _alertGeneric = AlertGeneric();

  //changedPassword
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPassword2Controller = TextEditingController();
  TextEditingController bioChangeController = TextEditingController();

  void logout() {
    GetStorage().remove('token');
    Get.offAllNamed('/login');
  }

  Future<UserDataModel?> getProfile() async {
    UserDataModel? responseApiLogin = await userProvider.getProfile();
    if (responseApiLogin != null) {
      GetStorage().write('profile_id', responseApiLogin!.data.userById.id);
    }
    return responseApiLogin;
  }

  goToCreateExperience() {
    GetStorage().remove('tripp_id');
    Get.toNamed('/crear_experiencia_1');
  }

  goToMyTripps() {
    GetStorage().remove('tripp_id');
    Get.toNamed('/mis_tripps_host');
  }

  goToReservas() {
    Get.toNamed('/reservas');
  }

  goToGaleri() {
    Get.toNamed('/administra_profile_traveler');
  }

}