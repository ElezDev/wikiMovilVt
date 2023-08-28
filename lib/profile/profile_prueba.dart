import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wiki_virtualt/models/response_api_profile.dart';
import 'package:wiki_virtualt/profile/profile_controller.dart';
import 'package:wiki_virtualt/widgets/circular_progres_indicator.dart';

class ProfilePagePrueba extends StatefulWidget {
  const ProfilePagePrueba({super.key});

  @override
  State<ProfilePagePrueba> createState() => _ProfilePagePruebaState();
}

class _ProfilePagePruebaState extends State<ProfilePagePrueba> {
  final ProfileController _profileController = ProfileController();

  bool alertContrasena = false;

  //field bio
  // String _descriptionBio = "Escribe una descripcion para tu bio ⚠️";
  bool showBio = true;
  File? selectedImageProfile;

  @override
  void initState() {
    super.initState();
    // Realiza cualquier lógica relacionada con opcionsFilterReservas aquí
    print('init: pasand por ini');
    print(GetStorage().read('typeUser'));
  }

  @override
  Widget build(BuildContext context) {
    return _ProfilePagePrueba(context);
  }

  Scaffold _ProfilePagePrueba(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          FutureBuilder(
            future: _profileController.getProfile(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return _bodyProfile(context, snapshot.data);
              }
              return const CircularProgressIndicatorWidget(height: 400);
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.width * 0.05,
            child: DropdownButton2(
              customButton: Icon(Icons.more_vert,
                  size: MediaQuery.of(context).size.width * 0.1,
                  color: Colors.grey),
              underline: Container(),
              dropdownWidth: MediaQuery.of(context).size.width * 0.5,
              itemHeight: MediaQuery.of(context).size.height * 0.075,
              dropdownDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 0,
                  ),
                ],
              ),
              items: [
                _itemPopUpMenu(context, 'Cerrar sesión', true, 6,
                    () => _profileController.logout()),
              ],
              onChanged: (value) {},
            ),
          ),
          _alertCambiarContrasena(context),
        ],
      ),
    ));
  }

  Widget _alertCambiarContrasena(BuildContext context) {
    return Visibility(
      visible: alertContrasena,
      child: Stack(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    alertContrasena = false;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 1,
                  color: Colors.black45,
                ),
              )
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset('assets/images/candado.png'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Text(
                        'Actualizar contraseña',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(14, 0, 14, 0),
                      child: Text(
                        'Te informaremos el cambio de tu contraseña en tu correo electrónico.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30, 31.5, 30, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Contraseña antigua',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF545454)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 5, 0, 0),
                            child: TextField(
                              obscureText: true,
                              controller:
                                  _profileController.oldPasswordController,
                              decoration: InputDecoration(
                                hintText: '********',
                                errorText: null,
                                constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height *
                                          0.038,
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  MediaQuery.of(context).size.width * 0.04,
                                  0,
                                  0,
                                  MediaQuery.of(context).size.height * 0.013,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30, 9, 30, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Nueva contraseña',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF545454)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 5, 0, 0),
                            child: TextField(
                              obscureText: true,
                              controller:
                                  _profileController.newPasswordController,
                              decoration: InputDecoration(
                                hintText: '',
                                errorText: null,
                                constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height *
                                          0.038,
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  MediaQuery.of(context).size.width * 0.04,
                                  0,
                                  0,
                                  MediaQuery.of(context).size.height * 0.013,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30, 9, 30, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Confirma nueva contraseña',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF545454)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 5, 0, 0),
                            child: TextField(
                              obscureText: true,
                              controller:
                                  _profileController.newPassword2Controller,
                              decoration: InputDecoration(
                                hintText: '',
                                errorText: null,
                                constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height *
                                          0.038,
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  MediaQuery.of(context).size.width * 0.04,
                                  0,
                                  0,
                                  MediaQuery.of(context).size.height * 0.013,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 31.5, 0, 0),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1),
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              alertContrasena = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'La contraseña se ha cambiado exitosamente. ',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05),
                                ),
                                duration: const Duration(seconds: 4),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff00C535),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: const Text(
                            'Aceptar',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SafeArea _bodyProfile(BuildContext context, UserDataModel response) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
                child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: selectedImageProfile != null
                        ? DecorationImage(
                            image: NetworkImage(selectedImageProfile!.path),
                          )
                        : DecorationImage(
                            image: selectedImageProfile != null
                                ? NetworkImage(selectedImageProfile!.path)
                                : const AssetImage(
                                        'assets/images/profile_icon.png')
                                    as ImageProvider<Object>,
                          ),
                  ),
                ),
              ],
            )),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                '${response.data.userById.name}',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 64,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.03,
                left: MediaQuery.of(context).size.width * 0.06,
                right: MediaQuery.of(context).size.width * 0.06,
                bottom: MediaQuery.of(context).size.height * 0.03,
              ),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Mis Post',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _jobAndCountry(BuildContext context, String job, String country) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          job,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.039,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.02,
            right: MediaQuery.of(context).size.width * 0.02,
          ),
          width: 1,
          height: MediaQuery.of(context).size.height * 0.02,
          color: Colors.black,
        ),
        Icon(
          Icons.location_on,
          size: MediaQuery.of(context).size.width * 0.04,
          color: Colors.grey,
        ),
        Text(
          country,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.035,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _cardInfo(
      BuildContext context, String iconFile, String title, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 113,
        height: 175,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.05,
          bottom: MediaQuery.of(context).size.height * 0.05,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageIcon(AssetImage(iconFile),
                size: MediaQuery.of(context).size.width * 0.09,
                color: const Color(0xff00c535)),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem _itemPopUpMenu(BuildContext context, String text,
      bool enabled, int value, Function onTap,
      {Color color = Colors.white, Color colorText = Colors.black}) {
    return DropdownMenuItem(
      onTap: (() => onTap()),
      alignment: Alignment.center,
      enabled: enabled,
      value: value,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.5,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.01,
          bottom: MediaQuery.of(context).size.height * 0.01,
        ),
        decoration: enabled
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: const Color(0xFF00C535),
                  width: 2,
                ),
                color: color)
            : null,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontWeight: FontWeight.w600,
            color: enabled ? colorText : Colors.grey[300],
            overflow: TextOverflow.visible,
          ),
        ),
      ),
    );
  }

//Seleccionar Img de galeria
}
