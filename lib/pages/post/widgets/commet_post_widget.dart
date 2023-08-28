import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddNewComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 16.0), // Agregamos espacio arriba
                  child: Text(
                    'Comentar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                height: 4,
                width: 80,
                color: Colors.grey.shade300,
              ),
            ],
          ),
          SizedBox(height: 12),
          Divider(
            thickness: 1.2,
            color: Colors.grey.shade200,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  title: Text('Usuario $index'),
                  subtitle: Text('Este es el comentario número $index'),
                );
              },
            ),
          ),
          SizedBox(height: 70),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Agrega un comentario...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<CircleBorder>(
                    CircleBorder(),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Image.asset(
                  "assets/images/enviar.png",
                  width: 40,
                  height: 50,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Divider(
            thickness: 1.2,
            color: Colors.grey.shade200,
          ),
        ],
      ),
    );
  }
}
