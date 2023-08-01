import 'package:flutter/material.dart';

class ItemNavigationButton extends StatelessWidget {
  const ItemNavigationButton(
      {super.key,
      required this.fileIcon,
      required this.title,
      this.isActive = false});
  final String fileIcon;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageIcon(AssetImage(fileIcon),
            size: isActive ? 32 : 30,
            color: isActive ? Colors.black : Color.fromARGB(255, 27, 218, 27)),
        Text(title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}
