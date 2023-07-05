import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wiki_virtualt/models/response_api_register.dart';


import '../../errors/failure.dart';
import '../../globals/globarVar.dart';
import '../../provider/user_provider.dart';
import '../../widgets/alert_generic.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController pin1Controller = TextEditingController();
  TextEditingController pin2Controller = TextEditingController();
  TextEditingController pin3Controller = TextEditingController();
  TextEditingController pin4Controller = TextEditingController();
  TextEditingController pin5Controller = TextEditingController();
  TextEditingController pin6Controller = TextEditingController();
  final UserProvider _userProvider = UserProvider();
  final AlertGeneric _alertGeneric = AlertGeneric();

  get register async {
    const CircularProgressIndicator();
    RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    try {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String confirmPassword = confirmPasswordController.text.trim();

      if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
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

      if (password.length < 8 || confirmPassword.length < 8) {
        Get.dialog(await _alertGeneric.alertGeneric(
            'Error', 'La contraseña debe tener mínimo 8 caracteres'));
            progrest = false;
        return;
      }

      if (password != confirmPassword) {
        Get.dialog(await _alertGeneric.alertGeneric(
            'Error', 'Las contraseñas no coinciden'));
            progrest = false;
        return;
      }

      ResponseApiRegister? response =
          await _userProvider.register(email, password);
      if (response!.data.register.accessToken.isNotEmpty) {
        Get.snackbar('Success', 'You are registered');
        GetStorage().write('token', response.data.register.accessToken);
        GetStorage().write('vemail', response.data.register.emailVerified);
        GetStorage().write('vprofile', response.data.register.registered);
        GetStorage().write('typeUser', "TRIPPSTER");
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

  verifyEmail() async {
    String pin1 = pin1Controller.text.trim();
    String pin2 = pin2Controller.text.trim();
    String pin3 = pin3Controller.text.trim();
    String pin4 = pin4Controller.text.trim();
    String pin5 = pin5Controller.text.trim();
    String pin6 = pin6Controller.text.trim();

    if (pin1.isEmpty ||
        pin2.isEmpty ||
        pin3.isEmpty ||
        pin4.isEmpty ||
        pin5.isEmpty ||
        pin6.isEmpty) {
      Get.dialog(await _alertGeneric.alertGeneric(
          'Error', 'Por favor completa todos los campos'));
      return;
    }

    String pin = '$pin1$pin2$pin3$pin4$pin5$pin6';

    if (pin.length != 6) {
      Get.dialog(await _alertGeneric.alertGeneric(
          'Error', 'Por favor completa todos los campos'));
      return;
    }

    bool verified = await _userProvider.verifyEmail(pin);
    if (verified) {
      GetStorage().write('vemail', true);
      goToCompleteProfilePage();
    } else {
      Get.dialog(await _alertGeneric.alertGeneric(
          'Error', 'Algo salio mal, vuelve a intentarlo'));
    }
  }


  goToLoginPage() {
    Get.offAllNamed('/login');
  }

  goToCompleteProfilePage() {
    Get.offAllNamed('/completar_perfil');
  }
}
