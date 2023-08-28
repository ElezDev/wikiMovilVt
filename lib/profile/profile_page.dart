// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:wiki_virtualt/models/response_api_login.dart';
// import 'package:wiki_virtualt/pages/login/user_log_controller.dart';
// import 'package:wiki_virtualt/profile/profile_controller.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final UserController userController = Get.find<UserController>();
//     final Userlog? user = userController.user;
//     final ProfileController _profileController = ProfileController();

//     // Utiliza los datos del usuario en esta vista
//     final String? name = user?.name;
//     final String? biography = user?.biography;
//     final String? profileImageUrl = user?.profileImg;

//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.only(
//                   top: 20), // Ajusta el valor según sea necesario
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   DropdownButton2(
//                     customButton: Icon(
//                       Icons.more_vert,
//                       size: MediaQuery.of(context).size.width * 0.1,
//                       color: Colors.grey,
//                     ),
//                     underline: Container(),
//                     dropdownWidth: MediaQuery.of(context).size.width * 0.5,
//                     itemHeight: MediaQuery.of(context).size.height * 0.075,
//                     dropdownDecoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 0,
//                         ),
//                       ],
//                     ),
//                     items: [
//                       _itemPopUpMenu(
//                         context,
//                         'Cerrar sesión',
//                         true,
//                         1,
//                         () => _profileController.logout(),
//                       ),
//                     ],
//                     onChanged: (value) {},
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 1),
//             CircleAvatar(
//               radius: 80,
//               backgroundImage: NetworkImage(profileImageUrl ?? ''),
//             ),
//             const SizedBox(height: 2),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(top: 20),
//                   child: Text(
//                     '${name}',
//                     style: TextStyle(
//                       fontSize: MediaQuery.of(context).size.width * 0.08,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Container(
//                 height: 64,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 20,
//                   vertical: 10,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(50),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 10,
//                       offset: Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       width: 1,
//                       margin: EdgeInsets.only(
//                         left: MediaQuery.of(context).size.width * 0.02,
//                         right: MediaQuery.of(context).size.width * 0.02,
//                       ),
//                       height: MediaQuery.of(context).size.height * 0.05,
//                       color: Colors.grey[300],
//                     ),
//                     FutureBuilder<dynamic>(
//                       future: _profileController.getRating(),
//                       builder: (context, snapshot) {
//                         return const SizedBox();
//                       },
//                     ),
//                     Container(
//                       width: 1,
//                       margin: EdgeInsets.only(
//                         left: MediaQuery.of(context).size.width * 0.02,
//                         right: MediaQuery.of(context).size.width * 0.02,
//                       ),
//                       height: MediaQuery.of(context).size.height * 0.05,
//                       color: Colors.grey[300],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Container(
//               color: Colors.white,
//               height: 220,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 4, // Ajusta este valor según tus necesidades
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 0),
//                       child: Column(
//                         children: [
//                           Image.asset(
//                             'assets/images/sofain.png',
//                             width:
//                                 220, // Ajusta el ancho de la imagen según tus necesidades
//                             height:
//                                 200, // Ajusta la altura de la imagen según tus necesidades
//                             fit: BoxFit
//                                 .contain, // Ajusta el ajuste de la imagen según tus necesidades
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Text(
//             //   '${biography ?? ''}',
//             //   style: const TextStyle(fontSize: 18),
//             // ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   DropdownMenuItem _itemPopUpMenu(
//     BuildContext context,
//     String text,
//     bool enabled,
//     int value,
//     Function onTap, {
//     Color color = Colors.white,
//     Color colorText = Colors.black,
//   }) {
//     return DropdownMenuItem(
//       onTap: (() => onTap()),
//       alignment: Alignment.center,
//       enabled: enabled,
//       value: value,
//       child: Container(
//         alignment: Alignment.center,
//         width: MediaQuery.of(context).size.width * 0.5,
//         margin: EdgeInsets.only(
//           top: MediaQuery.of(context).size.height * 0.01,
//           bottom: MediaQuery.of(context).size.height * 0.01,
//         ),
//         decoration: enabled
//             ? BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 border: Border.all(
//                   color: const Color(0xFF00C535),
//                   width: 2,
//                 ),
//                 color: color,
//               )
//             : null,
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: MediaQuery.of(context).size.width * 0.04,
//             fontWeight: FontWeight.w600,
//             color: enabled ? colorText : Colors.grey[300],
//             overflow: TextOverflow.visible,
//           ),
//         ),
//       ),
//     );
//   }
// }
