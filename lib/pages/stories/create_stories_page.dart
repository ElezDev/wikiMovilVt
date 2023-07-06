// ignore_for_file: prefer_typing_uninitialized_variables, sort_child_properties_last, use_build_context_synchronously, unused_local_variable

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wiki_virtualt/widgets/custom_dialog.dart';
import '../../globals/globarVar.dart';

class CreateStory extends StatefulWidget {
  const CreateStory({Key? key}) : super(key: key);

  @override
  State<CreateStory> createState() => _CreateStoryState();
}

class _CreateStoryState extends State<CreateStory> {
  String ubicacionText = '';
  static List<File?> selectedImages = List.generate(5, (_) => null);

  get picker => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 27),
                child: Text(
                  'Crea un nuevo momento',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _postcontainer(context),
                ],
              ),
               Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _postComment(),
                ],
              ),
              _navigationBar(),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _postcontainer(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Container(
            height: 500,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Visibility(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                1, 20, 0, 5),
                            child: Center(
                              child: _containerImage(context, 0),
                            ),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          //   child: _containerImage(context, 1),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _containerImage(BuildContext context, int index) {
    void _removeImage(int index) {
      setState(() {
        selectedImages[index] = null;
      });
    }

    return Center(
      child: Container(
        width: 340,
        height: 390,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 221, 218, 218),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(
          children: [
            const Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 130, 0, 0),
                  child: Icon(
                    Icons.camera_enhance,
                    color: Colors.amber,
                    size: 100,
                  ),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: InkWell(
                onTap: () async {
                  final picker = ImagePicker();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.photo_library,
                              size: 38,
                              color: Color(0xff00C535),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        content: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(
                                  Icons.camera,
                                  size: 32,
                                ),
                                title: const Text(
                                  'Tomar foto',
                                  style: TextStyle(fontSize: 16),
                                ),
                                onTap: () async {
                                  Navigator.pop(context);
                                  XFile? selectedImage = await picker.pickImage(
                                    source: ImageSource.camera,
                                  );
                                  if (selectedImage != null) {
                                    setState(() {
                                      selectedImages[index] =
                                          File(selectedImage.path);
                                    });
                                    debugPrint(
                                        'Imagen seleccionada en el índice $index: ${selectedImage.path}');
                                  }
                                },
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.photo_outlined,
                                  size: 32,
                                ),
                                title: const Text(
                                  'Galería',
                                  style: TextStyle(fontSize: 16),
                                ),
                                onTap: () async {
                                  Navigator.pop(context);
                                  XFile? selectedImage = await picker.pickImage(
                                    source: ImageSource.gallery,
                                  );
                                  if (selectedImage != null) {
                                    setState(() {
                                      selectedImages[index] =
                                          File(selectedImage.path);
                                    });
                                    debugPrint(
                                        'Imagen seleccionada en el índice $index: ${selectedImage.path}');
                                  }
                                },
                              ),
                              const SizedBox(height: 16.0),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xff00C535),
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Cancelar',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: selectedImages[index] != null
                    ? Image.file(
                        selectedImages[index]!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Container(),
              ),
            ),
            Visibility(
              visible: selectedImages[index] != null,
              child: Positioned(
                top: 10,
                right: 9,
                child: GestureDetector(
                  onTap: () {
                    if (selectedImages[index] != null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  30.0), // Ajusta el valor del radio de los bordes según tus preferencias
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Image.asset(
                                  'assets/images/Warning.png',
                                  width: 48.0,
                                  height: 48.0,
                                ),
                                const SizedBox(height: 16.0),
                                const Text(
                                    '¿Seguro que quieres quitar la imagen?'),
                                const SizedBox(height: 16.0),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32.0),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                  child: TextButton(
                                    child: const Text(
                                      'Cancelar',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32.0),
                                    color:
                                        const Color.fromARGB(255, 0, 197, 53),
                                  ),
                                  child: TextButton(
                                    child: const Text(
                                      'Aceptar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      _removeImage(index);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: Container(
                    width: 17,
                    height: 17,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 51, 50, 50),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _postComment() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Flexible(
        child: SizedBox(
          width: 340,
          child: TextField(
            maxLines: null,
            textAlignVertical: TextAlignVertical.top,
            maxLength: 100,
            decoration: InputDecoration(
              hintText: '#EnNewyork',
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ),
    ],
  );
}


  Widget _navigationBar() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 111,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 110, 0),
            child: GestureDetector(
              onTap: () {
                CustomDialog.showConfirmationDialog(
                  context,
                  '¿Estás seguro de salir?',
                  'Se perderá tu momento',
                );
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.chevron_left,
                    size: 13,
                  ),
                  Text(
                    'Atrás',
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.55,
            child: ElevatedButton(
              onPressed: ()  {
                 CustomDialog.showConfirmationDialog(
                  context,
                  '¿Aún no hay funcion?',
                  'No joda',
                );
              },
              child: const Text('Crear Momento',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
            ),
          ),
        ],
      ),
    );
  }

  void Refresh() {
    setState(() {});
  }
}
