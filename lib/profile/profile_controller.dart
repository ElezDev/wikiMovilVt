import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wiki_virtualt/models/response_api_profile.dart';
import 'package:wiki_virtualt/models/response_change_bio.dart';
import 'package:wiki_virtualt/models/response_change_password.dart';
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

  Future<ResponseApiProfile?> getProfile() async {
    ResponseApiProfile? responseApiLogin = await userProvider.getProfile();
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

  changePassword() async {
    String oldPassword = oldPasswordController.text.trim();
    String newPassword = newPasswordController.text.trim();
    String newPassword2 = newPassword2Controller.text.trim();

    if (oldPassword.isEmpty || newPassword.isEmpty || newPassword2.isEmpty) {
      Get.dialog(await _alertGeneric.alertGeneric(
          'Error campos vacios', 'Por favor completa todos los campos'));
      return;
    }

    if (newPassword.length < 8 || newPassword2.length < 8) {
      Get.dialog(await _alertGeneric.alertGeneric(
          'Error', 'La contraseña debe tener mínimo 8 caracteres'));
      return;
    }
    if (newPassword != newPassword2) {
      Get.dialog(await _alertGeneric.alertGeneric(
          'Error de contraseña', 'Las contraseñas no coinciden'));
      return;
    }
    ResponseChangePassword? response =
        await userProvider.changePassword(oldPassword, newPassword);
  }

  changeBio() async {
    String bio = bioChangeController.text.trim();
    ResponseChangeBio? response = await userProvider.changeBio(bio);
    return response;
  }

  void fetchData() {
    refresh();
  }

  uploadImage(XFile path) async {
    await userProvider.uploadImage(path);
  }

  getRating() async {
    final profile = await userProvider.getProfile();
    return profile;
  }
}
