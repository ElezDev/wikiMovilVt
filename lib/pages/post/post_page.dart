import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wiki_virtualt/pages/stories/story.dart';
import 'package:wiki_virtualt/widgets/alert_generic.dart';
import 'package:wiki_virtualt/widgets/search.dart';


class FacebookPostsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> posts = [
    {
      'title': 'Edwin',
      'content': 'This is the content of Post 1',
      'image': 'assets/images/otro.jpg',
      'avatar': 'assets/images/logon.png',
    },
    {
      'title': 'Calos development',
      'content': 'This is the content of Post 2',
      'image': 'assets/images/code.jpg',
      'avatar': 'assets/images/code.jpg',
    },
    {
      'title': 'Jane Doe',
      'content': 'This is the content of Post 3',
      'image': 'assets/images/login.jpg',
      'avatar': 'assets/images/login.jpg',
    },
    {
      'title': 'Edwin',
      'content': 'This is the content of Post 1',
      'image': 'assets/images/otro.jpg',
      'avatar': 'assets/images/logon.png',
    },
    {
      'title': 'Calos development',
      'content': 'This is the content of Post 2',
      'image': 'assets/images/code.jpg',
      'avatar': 'assets/images/code.jpg',
    },
    {
      'title': 'Jane Doe',
      'content': 'This is the content of Post 3',
      'image': 'assets/images/login.jpg',
      'avatar': 'assets/images/login.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: SearchWidget(),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 0.0),
            child: StoryPage(),
          ),
          ListView.builder(
            physics:
                const NeverScrollableScrollPhysics(), 
            shrinkWrap: true, // Ajusta el tamaño de la lista según su contenido
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 9.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(post['avatar']),
                      ),
                      title: Text(post['title']),
                      subtitle: Text(post['content']),
                    ),
                    Image.asset(
                      post['image'],
                      width: double.infinity,
                      height: 250.0,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 11.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.thumb_up),
                            onPressed: () {
                              AlertGeneric();
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.comment),
                            onPressed: () {
                              // Lógica para la acción de "Comentar"
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () {
                              // Lógica para la acción de "Compartir"
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
