import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_virtualt/models/response_api_login.dart';
import 'package:wiki_virtualt/models/response_api_publication.dart';
import 'package:wiki_virtualt/pages/login/user_log_controller.dart';
import 'package:wiki_virtualt/pages/post/post_interaction.dart';
import 'package:wiki_virtualt/pages/post/publication_content_page.dart';
import 'package:wiki_virtualt/pages/stories/story.dart';
import 'package:wiki_virtualt/profile/profile_controller.dart';
import 'package:wiki_virtualt/provider/publication_provider.dart';
import 'package:wiki_virtualt/widgets/custom_dialog.dart';
import 'package:wiki_virtualt/widgets/notification.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class PublicationViewPage extends StatelessWidget {
  final PublicationProvider publicationProvider = PublicationProvider();

  PublicationViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();
    final Userlog? user = userController.user;
    final ProfileController _profileController = ProfileController();
    final String? profileImageUrl = user?.profileImg;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Center(
          child:
              CircleAvatar( backgroundColor: Color.fromARGB(255, 27, 218, 27)),
        ),
        title: SizedBox(
          width: 300,
          height: 33,
          child: TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              hintText: 'Buscar',
              hintStyle: TextStyle(color: Colors.black),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.black),
            ),
            style: TextStyle(color: Colors.black),
            onChanged: (query) {},
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationsPage(),
                    ),
                  );
                },
              ),
              Positioned(
                right: 5,
                top: 7,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(
                        255, 27, 218, 27), 
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    "5",
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.only(
                      //       bottom: 10), // Agrega 10 puntos de espacio vertical
                      //   child: PublicationInteractiont(),
                      // ),
                      StoryPage(),
                    ],
                  )
                ],
              ),
            ),
          ];
        },
        body: FutureBuilder<ResponseApiPublications>(
          future: publicationProvider.getPublications(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error loading data'),
              );
            } else if (snapshot.hasData) {
              List<Publication> publications = snapshot.data!.data.publications;
              if (publications.isEmpty) {
                return const Center(
                  child: Text('No publications found.'),
                );
              }
              return ListView.builder(
                itemCount: publications.length,
                itemBuilder: (context, index) {
                  var publication = publications[index];
                  return PublicationItem(publication);
                },
              );
            } else {
              return const Center();
            }
          },
        ),
      ),
    );
  }
}
