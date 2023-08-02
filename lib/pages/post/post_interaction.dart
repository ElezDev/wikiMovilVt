import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicationInteractiont extends StatefulWidget {
  const PublicationInteractiont({super.key});

  @override
  State<PublicationInteractiont> createState() =>
      _PublicationInteractiontState();
}

class _PublicationInteractiontState extends State<PublicationInteractiont> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(128, 78, 46, 74), // Cambiamos el valor del canal alfa a 128 (0-255)
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 1,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.02,
                right: MediaQuery.of(context).size.width * 0.02,
              ),
              height: MediaQuery.of(context).size.height * 0.05,
              color: const Color.fromARGB(255, 216, 59, 59),
            ),
            FutureBuilder<dynamic>(
              builder: (context, snapshot) {
                return const SizedBox();
              },
            ),
            Container(
              child: CircleAvatar(backgroundColor: Colors.black12,),
              width: 1,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.02,
                right: MediaQuery.of(context).size.width * 0.02,
              ),
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
