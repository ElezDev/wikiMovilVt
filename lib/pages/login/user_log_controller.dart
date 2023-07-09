import 'package:get/get.dart';
import 'package:wiki_virtualt/models/response_api_login.dart';

class UserController extends GetxController {
  Userlog? user;

  void setUser(Userlog newUser) {
    user = newUser;
    update();
  }
}
