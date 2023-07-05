import 'package:flutter/material.dart';
import 'package:wiki_virtualt/widgets/btn_back.dart';

class VtWidget extends StatelessWidget {
  final String title;

  VtWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BtnBack(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.002,
            ),
            Image.asset('assets/images/logon.png'),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
            ),
          ],
        ),
        Text(title,
            style: TextStyle(
                fontSize: 34.0,
                color: Colors.black,
                fontWeight: FontWeight.w500)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      ],
    );
  }
}
