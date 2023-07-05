import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtnBack extends StatelessWidget {
  const BtnBack({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Container(
          height: 36,
          width: 36,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.6),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
