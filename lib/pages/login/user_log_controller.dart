// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:wiki_virtualt/models/response_api_login.dart';

// class UserController extends GetxController {
//   Userlog? user;
//   final _storage = GetStorage();

//   @override
//   void onInit() {
//     super.onInit();
//     final userData = _storage.read('user');
//     if (userData != null) {
//       user = Userlog.fromJson(userData);
//       update();
//     }
//   }

//   void setUser(Userlog newUser) {
//     user = newUser;
//     _storage.write('user', newUser.toJson());
//     update();
//   }
// }
