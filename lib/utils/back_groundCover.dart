import 'package:flutter/material.dart';

class BackGroundCover extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode
                    .darken, // Puedes ajustar el modo de mezcla según tus preferencias
              ),
          
        ),
      ),
    );
  }
  }