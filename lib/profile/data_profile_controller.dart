import 'package:get/get.dart';
import 'package:wiki_virtualt/models/response_api_login.dart';

class DataProfileController extends GetxController {
  Userlog? userData;

  void setUserdata(Userlog newUser) {
    userData = newUser;
    update();
  }
}
