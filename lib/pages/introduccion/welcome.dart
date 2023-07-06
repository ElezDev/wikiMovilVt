import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wiki_virtualt/models/response_api_profile.dart';
import 'package:wiki_virtualt/pages/login/login_controller.dart';
import 'package:wiki_virtualt/profile/profile_controller.dart';
import 'package:wiki_virtualt/utils/back_groundWelcome.dart';
import 'package:wiki_virtualt/widgets/circular_progres_indicator.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final ProfileController _profileController = ProfileController();


  @override
  Widget build(BuildContext context) {
    return _Welcome(context);
  }

  Scaffold _Welcome(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Hace que el fondo sea transparente
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          BackGroundCoverWelcome(),
          SingleChildScrollView(
            child: FutureBuilder(
              future: _profileController.getProfile(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return _bodyProfile(context, snapshot.data);
                }
                return const CircularProgressIndicatorWidget(height: 400);
              },
            ),
          ),
        ],
      ),
    );
  }

SafeArea _bodyProfile(BuildContext context, ResponseApiProfile response) {
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
                response.data.profile.name,
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
          const SizedBox(height:30 ), 
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
