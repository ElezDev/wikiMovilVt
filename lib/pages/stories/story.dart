import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: Container(
        color: Colors.white,
        height: 230,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 150,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'Crea un nuevo momento',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 20,
                      right: 50,
                      child: FloatingActionButton(
                        onPressed: () {
                          Get.toNamed('/createStory');
                        },
                        backgroundColor:
                            const Color.fromARGB(255, 27, 218, 27), 
                        child: Image.asset(
                          'assets/images/camstory.png'
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              final actualIndex = index - 1;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://images.pexels.com/photos/12899138/pexels-photo-12899138.jpeg?auto=compress&cs=tinysrgb&w=600'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 4),
                          Text(
                            'Edwin Ledezma',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
