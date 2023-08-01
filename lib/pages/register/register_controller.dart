import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wiki_virtualt/models/response_api_register.dart';
import '../../errors/failure.dart';
import '../../globals/globarVar.dart';
import '../../provider/user_provider.dart';
import '../../widgets/alert_generic.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final UserProvider _userProvider = UserProvider();
  final AlertGeneric _alertGeneric = AlertGeneric();

  get register async {
    const CircularProgressIndicator();
    RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    try {
      String name = nameController.text.trim();
      // String username = usernameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty ||name.isEmpty) {
        Get.dialog(await _alertGeneric.alertGeneric(
            'Eror', 'Por favor completa todos los campos'));

        progrest = false;
        return;
      }

      if (!regExp.hasMatch(email)) {
        Get.dialog(await _alertGeneric.alertGeneric(
            'Correo electronico invalido',
            'Escriba una direccion de correo valida'));
        progrest = false;
        return;
      }
      ResponseApiRegister? response =
          await _userProvider.register(name, email, password);
      if (response!.data.register.accessToken.isNotEmpty) {
        Get.snackbar('Success', 'You are registered');
        GetStorage().write('token', response.data.register.accessToken);
        GetStorage().write('vprofile', response.data.register.registered);
        progrest = false;
        goToLoginPage();
      } else {
        Get.dialog(
          await _alertGeneric.alertGeneric(
            'Error',
            'Algo salio mal, vuelve a intentarlo',
          ),
        );
        progrest = false;
      }
    } on Failure catch (e) {
      progrest = false;
      Get.dialog(
        await _alertGeneric.alertGeneric('Error', e.message),
      );
    }
  }
  
  get fgh => null;



  goToLoginPage() {
    Get.offAllNamed('/login');
  }

  goToCompleteProfilePage() {
    Get.offAllNamed('/completar_perfil');
  }
}
