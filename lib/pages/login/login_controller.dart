import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wiki_virtualt/errors/failure.dart';
import 'package:wiki_virtualt/pages/login/user_log_controller.dart';
import 'package:wiki_virtualt/provider/user_provider.dart';
import 'package:wiki_virtualt/widgets/alert_generic.dart';


class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final UserProvider userProvider = UserProvider();
  final AlertGeneric _alertGeneric = AlertGeneric();
  final UserController userController = Get.put(UserController());

  goToRegisterPage() {
    Get.toNamed('/register');
  }

  goToHomePage() {
    Get.offAllNamed('/welcome');
  }
goToInicioPage() {
    Get.offAllNamed('/home');
  }
   
  login() async {
    try {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        Get.dialog(await _alertGeneric.alertGeneric(
            'Error', 'Por favor completa todos los campos'));
        return;
      }

      final responseApiLogin = await userProvider.login(
        emailController.text,
        passwordController.text,
      );

      GetStorage().write('token', responseApiLogin.data.login.accessToken);

      if (responseApiLogin.data.login.registered == false) {
        Get.offAllNamed('/welcome');
        return;
      }
      print('Data de inicio de sesión: ${responseApiLogin.data.login.user.name}');
      userController.setUser(responseApiLogin.data.login.user);

      goToHomePage();
    } on Failure catch (e) {
      Get.dialog(
        await _alertGeneric.alertGeneric('Error', e.message),
      );
    }
  }
}
