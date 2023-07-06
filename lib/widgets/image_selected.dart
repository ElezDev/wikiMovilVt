import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectionDialog {
  static Future<XFile?> showImageSelectionDialog(BuildContext context) async {
    final picker = ImagePicker();

    return showDialog<XFile?>(
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
                    final selectedImage = await picker.pickImage(
                      source: ImageSource.camera,
                    );
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
                    final selectedImage = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
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
  }
}
