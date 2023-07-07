import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wiki_virtualt/models/response_api_profile.dart';
import 'package:wiki_virtualt/profile/profile_controller.dart';
import 'package:wiki_virtualt/widgets/circular_progres_indicator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController _profileController = ProfileController();

  bool alertContrasena = false;

  //field bio
  // String _descriptionBio = "Escribe una descripcion para tu bio ⚠️";
  bool showBio = true;

  @override
  Widget build(BuildContext context) {
    return _profilePage(context);
  }

  Scaffold _profilePage(BuildContext context) {
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
                  color: const Color.fromARGB(255, 12, 12, 12)),
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
                // _itemPopUpMenu(context, 'Editar perfil', true, 1,
                //     () => Get.to(())),
                // _itemPopUpMenu(context, 'Cambiar contraseña', true, 2, () {
                //   setState(() {
                //     alertContrasena = true;
                //     print('hola $alertContrasena');
                //   });
                // }),
                // _itemPopUpMenu(context, 'Términos y condiciones', true, 3,
                //     () => Get.to(())),
                // _itemPopUpMenu(context, 'Contáctanos', true, 4,
                //     () => Get.to(())),
                // _itemPopUpMenu(context, 'Conviertete en TrippHost', true, 5,
                //     () => Get.to(()),
                //     color: const Color(0xFF00C535), colorText: Colors.white),
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
                          const Row(
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
                          const Row(
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
                                hintText: 'luis1989+',
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
                          const Row(
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
                                hintText: 'luis1989+',
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
                            _profileController.changePassword();
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

  SafeArea _bodyProfile(BuildContext context, ResponseApiProfile response) {
    String name = response.data.users[0].name;
    String userName = response.data.users[0].username;
    String biografia = response.data.users[0].biography;

    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
                onTap: () => alertChangedPhotoProfile(context),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        // image: selectedImageProfile != null
                        // ? DecorationImage(
                        //     image: FileImage(selectedImageProfile!),
                        //   )
                        // : DecorationImage(
                        //     image: response.data.profile.img != null
                        //         ? NetworkImage(response.data.profile.img!)
                        //         : const AssetImage(
                        //                 'assets/images/profile_icon.png')
                        //             as ImageProvider<Object>,
                        //   ),
                      ),
                    ),
                    FutureBuilder<dynamic>(
                      future: _profileController.getRating(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 8, 18, 8),
                                child: Container(
                                    child: Transform.scale(
                                        scale: 1.5,
                                        child: Image.asset(
                                          'assets/images/reting.png',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.045,
                                        ))),
                              ));
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 8, 18, 8),
                                child: Stack(
                                  children: [
                                    Container(
                                        child: Transform.scale(
                                            scale: 1.5,
                                            child: Image.asset(
                                                'assets/images/Grupo 7206.png'))),
                                  ],
                                ),
                              ));
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                '${name} ${userName}',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _jobAndCountry(context, biografia),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06,
                vertical: MediaQuery.of(context).size.height * 0.014,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 64,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 1,
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02,
                      right: MediaQuery.of(context).size.width * 0.02,
                    ),
                    height: MediaQuery.of(context).size.height * 0.05,
                    color: Colors.grey[300],
                  ),
                  // FutureBuilder<dynamic>(
                  //   future: _profileController.getRating(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       var rating =
                  //           snapshot.data.data.profile.host.ratingAverage;
                  //       return _infoStats(
                  //         context,
                  //         'assets/images/rating.png',
                  //         'Rating',
                  //         // rating == 0 ? "New" : rating,
                  //         rating,
                  //       );
                  //     }
                  //     return const SizedBox();
                  //   },
                  // ),
                  Container(
                    width: 1,
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02,
                      right: MediaQuery.of(context).size.width * 0.02,
                    ),
                    height: MediaQuery.of(context).size.height * 0.05,
                    color: Colors.grey[300],
                  ),
                  _infoStats(
                      context, 'assets/images/gallery_icon.png', 'Posts', 0),
                ],
              ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     _cardInfo(
            //         context,
            //         'assets/images/bombillo_icon.png',
            //         'Crea una experiencia',
            //         _profileController.goToCreateExperience),
            //     _cardInfo(
            //         context,
            //         'assets/images/reload_icon.png',
            //         'Administrar Experiencias',
            //         _profileController.goToMyTripps),
            //     _cardInfo(context, 'assets/images/calendar_icon.png',
            //         'Reservas\n', _profileController.goToReservas),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget _infoStats(
      BuildContext context, String iconFile, String title, dynamic stat) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.02,
          ),
          child: ImageIcon(
            AssetImage(iconFile),
            size: 25,
            color: const Color(0xff00c535),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            Text(
              stat.toString(),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _jobAndCountry(BuildContext context, String job) {
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
        // Text(
        //   country,
        //   style: TextStyle(
        //     fontSize: MediaQuery.of(context).size.width * 0.035,
        //     fontWeight: FontWeight.w400,
        //     color: Colors.grey,
        //   ),
        // ),
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

  File? selectedImageProfile;

//Seleccionar Img de galeria
  Future<void> _selectImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImageProfile = File(pickedFile.path);
      await _profileController.uploadImage(pickedFile);
      setState(() {
        navigator!.pop(context);
      });
    }
  }

  //Tomar foto
  Future<void> _takePicture() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      selectedImageProfile = File(pickedFile.path);
      await _profileController.uploadImage(pickedFile);
      setState(() {
        navigator!.pop(context);
      });
    }
  }

  Future alertChangedPhotoProfile(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          contentPadding: const EdgeInsets.all(0),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                heightSize(context),
                heightSize(context),
                const Icon(
                  Icons.person_4,
                  size: 38,
                  color: Color(0xFFFF8300),
                ),
                heightSize(context),
                InkWell(
                  onTap: () => _takePicture(),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera),
                      Text(
                        ' Tomar una foto      ',
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                heightSize(context),
                InkWell(
                  onTap: () => _selectImageFromGallery(),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image),
                      Text(
                        ' Seleccionar galeria',
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                heightSize(context),
                heightSize(context),
                InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFF8300),
                        borderRadius: BorderRadius.circular(32)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Cancelar'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget heightSize(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.015,
    );
  }
}
