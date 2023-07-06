import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  static void showConfirmationDialog(
      BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Container(
            width: 30.0,
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
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3.0),
                 Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24.0),
                Container(
                  width: 220,
                  child: TextButton(
                    child: const Text(
                      'Regresar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Get.toNamed('/home');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff00C535),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
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
