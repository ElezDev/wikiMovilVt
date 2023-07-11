import 'package:flutter/material.dart';

class BackGroundCoverWelcome extends StatelessWidget {
  const BackGroundCoverWelcome({super.key});
  @override
Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/sofain.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25),
                BlendMode
                    .darken, // Puedes ajustar el modo de mezcla según tus preferencias
              ),
          
        ),
      ),
    );
  }
  }