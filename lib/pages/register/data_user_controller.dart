import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wiki_virtualt/models/response_api_profile.dart';
import 'package:wiki_virtualt/provider/user_provider.dart';
import 'package:wiki_virtualt/widgets/alert_generic.dart';



class ProfileDataController extends GetxController {
  final UserProvider userProvider = UserProvider();
  final AlertGeneric _alertGeneric = AlertGeneric();


  void logout() {
    GetStorage().remove('token');
    Get.offAllNamed('/login');
  }

  Future<ResponseApiProfile?> getProfile() async {
    ResponseApiProfile? responseApiLogin = await userProvider.getProfile();
    return responseApiLogin;
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
