import 'package:flutter/material.dart';

class BackGroundCoverWelcome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/sofain.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  }