import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wiki_virtualt/provider/publications/create_publication_provider.dart';

class CreatePostController extends GetxController {
  TextEditingController descripcionController = TextEditingController();
  final CreatePublicationProvider _publicationProvider =
      CreatePublicationProvider();
  bool isCreatingPublication = false;




Future<void> crearPublicacion(List<File?> selectedImages, List<File?> selectedVideos) async {
  String descripcion = descripcionController.text.trim();
  if (descripcion.isEmpty || (selectedImages.isEmpty && selectedVideos.isEmpty)) {
    return;
  }

  String publicationId = await _publicationProvider.createPublication(descripcion);
  await _publicationProvider.addLocation(publicationId);
  GetStorage().write('publication_id', publicationId);

  for (File? imageFile in selectedImages) {
    if (imageFile != null) {
      await _publicationProvider.uploadImage(imageFile, publicationId);
    }
  }

  for (File? videoFile in selectedVideos) {
    if (videoFile != null) {
      await _publicationProvider.uploadVideo(videoFile, publicationId);
    }
  }
}



  // goToSuccessPage() { 
  //   Get.offAllNamed('/profile');
  // }

}
