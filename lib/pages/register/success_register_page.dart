// import 'package:flutter/material.dart';
// import 'package:tripphost/src/pages/register/register_controller.dart';
// import 'package:tripphost/src/utils/otp_widget.dart';
// import 'package:tripphost/src/widgets/btn_back.dart';

// import '../home/profile_controller.dart';

// class SuccessRegisterPage extends StatefulWidget {
//   SuccessRegisterPage({super.key});

//   @override
//   State<SuccessRegisterPage> createState() => _SuccessRegisterPageState();
// }

// class _SuccessRegisterPageState extends State<SuccessRegisterPage>
//     with WidgetsBindingObserver {
//   final RegisterController _registerController = RegisterController();
//    final ProfileController _profileController = ProfileController();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void dispose() {
//     print('se destruyo');
//     WidgetsBinding.instance!.removeObserver(this);
//     super.dispose();

//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.paused) {     
//       print('entro al login');
//       _profileController.logout();
//     } else {
//       print('no entro');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(children: [
//         _backgroundCover(),
//         SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.05,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.04,
//                     ),
//                     BtnBack(),
//                   ],
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.3,
//                     left: MediaQuery.of(context).size.width * 0.05,
//                     right: MediaQuery.of(context).size.width * 0.05,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Text('Sólo un \npaso más...',
//                           style: TextStyle(
//                               fontSize: 34.0,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w300)),
//                       Text(
//                           'Hemos enviado un correo electrónico\n con un codigo de validacion a tu e-mail,\n por favor ve a tu cuenta.',
//                           style: TextStyle(
//                               fontSize: 16.0,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w300)),
//                       Container(
//                         child: OTPFields(
//                           pin1: _registerController.pin1Controller,
//                           pin2: _registerController.pin2Controller,
//                           pin3: _registerController.pin3Controller,
//                           pin4: _registerController.pin4Controller,
//                           pin5: _registerController.pin5Controller,
//                           pin6: _registerController.pin6Controller,
//                         ),
//                       ),
//                       _button(context),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ]),
//     );
//   }

//   Widget _backgroundCover() {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/images/success_register.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }

//   Widget _button(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//           horizontal: MediaQuery.of(context).size.width * 0.1),
//       margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
//       height: MediaQuery.of(context).size.height * 0.05,
//       child: ElevatedButton(
//         onPressed: _registerController.verifyEmail,
//         child: const Text('Validar',
//             style: TextStyle(
//                 fontSize: 18.0,
//                 color: Colors.white,
//                 fontWeight: FontWeight.w300)),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Color(0xff00C535),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _fieldCode(BuildContext context) {
//     return Container(
//         width: MediaQuery.of(context).size.width * 0.13,
//         height: MediaQuery.of(context).size.height * 0.06,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: TextField(
//           maxLength: 1,
//           keyboardType: TextInputType.number,
//           textAlign: TextAlign.center,
//           decoration: InputDecoration(
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(50)),
//               borderSide: BorderSide(
//                 width: 1,
//                 color: Color(0xffFFFFFF),
//               ),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(50)),
//               borderSide: BorderSide(
//                 width: 1,
//                 color: Color(0xffFFFFFF),
//               ),
//             ),
//             border: InputBorder.none,
//           ),
//         ));
//   }

//   Widget _rowCode(BuildContext context) {
//     return Row(
//       children: [
//         _fieldCode(context),
//         _fieldCode(context),
//         _fieldCode(context),
//         _fieldCode(context),
//       ],
//     );
//   }
// }
