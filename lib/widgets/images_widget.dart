// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

//  List<File?> selectedImages = List.generate(5, (_) => null);
// Widget _containerImage(BuildContext context, int index) {
  
//     void _removeImage(int index) {
//       setState(() {
//         selectedImages[index] = null;
//       });
//     }
//     return Container(
//       width: 107,
//       height: 178,
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(255, 209, 208, 208),
//         borderRadius: BorderRadius.circular(16.0),
//       ),
//       child: Stack(
//         children: [
//           const Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
//                 child: Icon(
//                   Icons.add,
//                   color: Color.fromARGB(255, 155, 153, 153),
//                   size: 38,
//                 ),
//               ),
//             ],
//           ),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12.0),
//             child: InkWell(
//               onTap: () async {
//                 final picker = ImagePicker();
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.photo_library,
//                             size: 38,
//                             color: Color(0xff00C535),
//                           ),
//                         ],
//                       ),
//                       backgroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       content: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: <Widget>[
//                             ListTile(
//                               leading: const Icon(
//                                 Icons.camera,
//                                 size: 32,
//                               ),
//                               title: const Text(
//                                 'Tomar foto',
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                               onTap: () async {
//                                 Navigator.pop(context);
//                                 XFile? selectedImage = await picker.pickImage(
//                                   source: ImageSource.camera,
//                                 );
//                                 if (selectedImage != null) {
//                                   setState(() {
//                                     selectedImages[index] =
//                                         File(selectedImage.path);
//                                   });
//                                   debugPrint(
//                                       'Imagen seleccionada en el índice $index: ${selectedImage.path}');
                                  
//                                 }
//                               },
//                             ),
//                             ListTile(
//                               leading: const Icon(
//                                 Icons.photo_outlined,
//                                 size: 32,
//                               ),
//                               title: const Text(
//                                 'Galería',
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                               onTap: () async {
//                                 Navigator.pop(context);
//                                 XFile? selectedImage = await picker.pickImage(
//                                   source: ImageSource.gallery,
//                                 );
//                                 if (selectedImage != null) {
//                                   setState(() {
//                                     selectedImages[index] =
//                                         File(selectedImage.path);
//                                   });
//                                   debugPrint(
//                                       'Imagen seleccionada en el índice $index: ${selectedImage.path}');
                                 
//                                 }
//                               },
//                             ),
//                             const SizedBox(height: 16.0),
//                             Container(
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: const Color(0xff00C535),
//                                 borderRadius: BorderRadius.circular(32),
//                               ),
//                               child: TextButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: const Text(
//                                   'Cancelar',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//               child: selectedImages[index] != null
//                   ? Image.file(
//                       selectedImages[index]!,
//                       width: double.infinity,
//                       height: double.infinity,
//                       fit: BoxFit.cover,
//                     )
//                   : Container(),
//             ),
//           ),
//           Visibility(
//             visible: selectedImages[index] != null,
//             child: Positioned(
//               top: 10,
//               right: 9,
//               child: GestureDetector(
//                 onTap: () {
//                   if (selectedImages[index] != null) {
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(
//                                 30.0), // Ajusta el valor del radio de los bordes según tus preferencias
//                           ),
//                           content: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               Image.asset(
//                                 'assets/images/Warning.png',
//                                 width: 48.0,
//                                 height: 48.0,
//                               ),
//                               const SizedBox(height: 16.0),
//                               const Text(
//                                   '¿Seguro que quieres quitar la imagen?'),
//                               const SizedBox(height: 16.0),
//                               Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(32.0),
//                                   color: Colors.grey.withOpacity(0.2),
//                                 ),
//                                 child: TextButton(
//                                   child: const Text(
//                                     'Cancelar',
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                 ),
//                               ),
//                               const SizedBox(height: 8.0),
//                               Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(32.0),
//                                   color: const Color.fromARGB(255, 0, 197, 53),
//                                 ),
//                                 child: TextButton(
//                                   child: const Text(
//                                     'Aceptar',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                     _removeImage(index);
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 },
//                 child: Container(
//                   width: 17,
//                   height: 17,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Color.fromARGB(255, 51, 50, 50),
//                   ),
//                   child: const Icon(
//                     Icons.close,
//                     color: Colors.grey,
//                     size: 16,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
