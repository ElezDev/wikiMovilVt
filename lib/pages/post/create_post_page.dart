// ignore_for_file: prefer_typing_uninitialized_variables, sort_child_properties_last, use_build_context_synchronously, unused_local_variable

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:wiki_virtualt/pages/post/controllers/createpost_controller.dart';
import 'package:wiki_virtualt/pages/post/post_page.dart';
import 'package:wiki_virtualt/profile/profile_prueba.dart';
import 'package:wiki_virtualt/provider/publications/create_publication_provider.dart';
import 'package:wiki_virtualt/widgets/video_player.dart';


class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final CreatePostController _createPostController = CreatePostController();
  String ubicacionText = '';
  static List<File?> selectedImages = List.generate(5, (_) => null);
  static List<File?> selectedVideos = List.generate(1, (_) => null);
  late SharedPreferences _prefs;

  void postComment() {
    String comentario = _createPostController.descripcionController.text;
    _prefs.setString('comentario', comentario);
  }

  var pickedFile;
  bool videoVisible = false;
  bool selectGaleryVisible = false;
  bool imageSelected = false;
  String selectedLocationText = '';
  VideoPlayerController? _controller;
  List<String>? tags = [];

  get picker => null;

  void _getTags() {
    try {
      tags = GetStorage().read('tags') ?? <String>[];
    } catch (e) {
      tags = <String>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    _getTags();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 27),
                child: Text(
                  'Nueva publicación',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Averta'),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _postcontainer(context),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _postComment(),
                  ),
                
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                   
                  ),
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
            height: 600,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _seleccionarVideo(context),
                    Visibility(
                      visible: videoVisible,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.58,
                          height: MediaQuery.of(context).size.height * 0.42,
                          child: (_controller == null)
                              ? Container()
                              : VideoPlayerWidget(
                                  urlVideo: pickedFile.path,
                                ),
                        ),
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
                                0, 0, 0, 5),
                            child: _containerImage(context, 0),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: _containerImage(context, 1),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 10, 9, 0),
                      child: _containerImage(context, 2),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 9, 0),
                      child: _containerImage(context, 3),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 17, 0),
                      child: _containerImage(context, 4),
                    ),
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Pulsa y arrastra para ordenar las fotos',
                      style: TextStyle(
                          fontFamily: 'Averta',
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffBEBEBE)),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _seleccionarVideo(BuildContext context) {
    return Visibility(
      visible: !selectGaleryVisible,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
          ),
          width: MediaQuery.of(context).size.width * 0.58,
          height: MediaQuery.of(context).size.height * 0.42,
          child: ElevatedButton(
            onPressed: () async {
              final ImagePicker picker0 = ImagePicker();
              final result = await showDialog(
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
                              'Grabar un video',
                              style: TextStyle(fontSize: 16),
                            ),
                            onTap: () async {
                              Navigator.of(context).pop(ImageSource.camera);
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
                              Navigator.of(context).pop(ImageSource.gallery);
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

              if (result != null) {
                final picker = ImagePicker();
                pickedFile = await picker.pickVideo(source: result);

                if (pickedFile != null) {
                  final videoFile = File(pickedFile.path);
                  _controller =
                      VideoPlayerController.file(File(pickedFile.path));
                  await _controller!.initialize();

                  _controller!.play();

                  setState(() {
                    selectedVideos.add(videoFile);
                  });
                }
                setState(() {
                  videoVisible = true;
                  selectGaleryVisible = true;
                });
              }
            },
            child: const Icon(
              Icons.add,
              color: Color.fromARGB(255, 155, 153, 153),
              size: 38,
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Colors.white30,
            ),
          ),
        ),
      ),
    );
  }


Widget _containerImage(BuildContext context, int index) {
  final createPublication = CreatePublicationProvider();

  void _removeImage(int index) {
    setState(() {
      selectedImages[index] = null;
      imageSelected = selectedImages.any((image) => image != null);
    });
  }

  return DragTarget<int>(
    onAccept: (int draggedIndex) {
      setState(() {
        final draggedImage = selectedImages[draggedIndex];
        selectedImages[draggedIndex] = selectedImages[index];
        selectedImages[index] = draggedImage;
      });
    },
    builder: (BuildContext context, List<int?> candidateData, List<dynamic> rejectedData) {
      return Draggable<int>(
        data: index,
        child: Container(
          width: 107,
          height: 178,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 209, 208, 208),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Stack(
            children: [
              const Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                    child: Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 155, 153, 153),
                      size: 38,
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
                                        imageSelected = true;
                                        selectedImages[index] =
                                            File(selectedImage.path);
                                      });
                                      debugPrint(
                                          'Imagen seleccionada en el índice $index: ${selectedImage.path}');
                                      await createPublication.uploadImage(
                                          selectedImages[index]!, '');
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
                                        imageSelected = true;
                                        selectedImages[index] =
                                            File(selectedImage.path);
                                      });
                                      debugPrint(
                                          'Imagen seleccionada en el índice $index: ${selectedImage.path}');
                                      await createPublication.uploadImage(
                                          selectedImages[index]!, '');
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
        feedback: Container(
          width: 107,
          height: 178,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 209, 208, 208),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: selectedImages[index] != null
              ? Image.file(
                  selectedImages[index]!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                )
              : Container(),
        ),
        childWhenDragging: Container(),
        onDragCompleted: () {
          // Aquí puedes implementar la lógica para guardar el nuevo orden de las imágenes
          setState(() {
            // Actualiza el estado con el nuevo orden de las imágenes
            selectedImages.removeWhere((image) => image == null);
            selectedImages.addAll(List<File?>.filled(5 - selectedImages.length, null));
          });
        },
      );
    },
  );
}

  
  

  Widget _postComment() {
    // ignore: no_leading_underscores_for_local_identifiers
    void _saveText() {
      String text = _createPostController.descripcionController.text;
      saveTextToStorage(text);
    }

    getTextFromStorage().then((savedText) {
      if (savedText != null) {
        _createPostController.descripcionController.text = savedText;
      }
    });
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(padding: EdgeInsets.fromLTRB(0, 0, 170, 10),
        child: Text('Comenta este momento',
        textAlign: TextAlign.right ,style: TextStyle(
          color: Colors.black,
          fontFamily: 'Averta',
          fontSize: 16,
          fontWeight: FontWeight.w600
        ),
        ),
        ),
        Flexible(
          child: Container(
            width: 340,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(23),
            ),
            child: TextField(
              controller: _createPostController.descripcionController,
              onChanged: (value) {
                _saveText();
              },
              maxLines: null,
              textAlignVertical: TextAlignVertical.top,
              maxLength: 800,
              decoration: const InputDecoration(
                hintText: 'Escribe aquí...',
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

  Future<void> saveTextToStorage(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedText', text);
  }

  Future<String?> getTextFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedText = prefs.getString('savedText');
    return savedText;
  }

  Future<void> clearTextFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('savedText');
  }

  Widget _navigationBar() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: GestureDetector(
              onTap: () async {
                final confirmed = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Container(
                        width: 300.0,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Image.asset(
                                'assets/images/Warning.png',
                                width: 48.0,
                                height: 48.0,
                              ),
                            ),
                            const Text(
                              '¿Estás seguro de salir?',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3.0),
                            const Text(
                              'Se perderá tu publicación',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 24.0),
                            Container(
                              width: 220,
                              child: GestureDetector(
                                onTap: () {
                                  GetStorage().remove('lat');
                                  GetStorage().remove('lng');
                                  GetStorage().remove('dir');
                                  clearTextFromStorage();
                                 
                                  Navigator.pop(context,
                                      true); // Return true if confirm button is pressed
                                },
                                child: Container(
                                  width: 220,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 0, 197, 53),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12.0,
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Regresar a Myworld',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
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

                if (confirmed == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PublicationViewPage(),
                    ),
                  );
                }
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
                  ),
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
              onPressed: () async {
                if (_createPostController.descripcionController.text.isEmpty) {
                  Get.snackbar(
                    'Error',
                    'Por favor, completa todos los campos',
                    snackPosition: SnackPosition.TOP,
                    duration: Duration(seconds: 3),
                  );
                  return;
                }

                await _createPostController.crearPublicacion(
                    selectedImages, selectedVideos);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  ProfilePagePrueba(),
                  ),
                );
              },
              child: const Text('Publicar',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
              style: ElevatedButton.styleFrom(
                backgroundColor: (videoVisible == true || imageSelected == true)
                    ? const Color(0xff00C535)
                    : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
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
