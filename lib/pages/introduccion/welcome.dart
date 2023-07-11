import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_virtualt/pages/login/login_controller.dart';
import 'package:wiki_virtualt/utils/back_groundWelcome.dart';

import '../login/user_log_controller.dart';

class Welcome extends StatefulWidget {

  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
    final UserController userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _Welcome(context);
  }

  Scaffold _Welcome(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          BackGroundCoverWelcome(),
          SingleChildScrollView(
            child: _bodyProfile(context), // Llamada a _bodyProfile
          ),
        ],
      ),
    );
  }

  SafeArea _bodyProfile(BuildContext context) {
    final user = userController.user;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 170,
          horizontal: 20,
        ),
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Hola, ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  '${user?.username ?? ''}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Bienvenid@ a',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.w100,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'WikiVT',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '¿Listo para conectar con desarrolladores de todo el mundo?',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.w100,
              ),
            ),
            const SizedBox(height: 30),
            _loginButton(context),
          ],
        ),
      ),
    );
  }
}
Widget _loginButton(BuildContext context) {
  final LoginController loginController = LoginController();
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.4, // Ajustar el ancho del contenedor
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(
        onPressed: loginController.goToInicioPage,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff00C535),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: const Text(
          '!Estoy listo!',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    ),
  );
}
