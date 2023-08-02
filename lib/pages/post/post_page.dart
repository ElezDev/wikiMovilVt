import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_virtualt/models/response_api_login.dart';
import 'package:wiki_virtualt/models/response_api_publication.dart';
import 'package:wiki_virtualt/pages/login/user_log_controller.dart';
import 'package:wiki_virtualt/pages/post/post_interaction.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Center(
          child:
              CircleAvatar(backgroundColor: Color.fromARGB(255, 27, 218, 27)),
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
                        builder: (context) => NotificationsPage()),
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
                        255, 27, 218, 27), // Color del fondo del número
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    "5",
                    style: TextStyle(
                      color: Colors.white, // Color del texto del número
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
                  StoryPage(),
                  // const PublicationInteractiont(),
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



class PublicationItem extends StatelessWidget {
  final Publication publication;

  PublicationItem(this.publication);

  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.0),
      ),
      child: AspectRatio(
        aspectRatio: 15 / 23,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  publication.description,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Expanded(
              child: publication.multimedia.length > 1
                  ? Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        PageView.builder(
                          controller: _pageController,
                          itemCount: publication.multimedia.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 2, // Ajusta la altura del contenedor para que la imagen se vea más grande
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  image: NetworkImage(publication.multimedia[index].url),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(publication.user.profile_img),
                                ),
                                title: Text(
                                  publication.user.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            );
                          },
                          onPageChanged: (index) {
                            _currentPageNotifier.value = index;
                          },
                        ),
                        CirclePageIndicator(
                          selectedDotColor: Colors.white,
                          dotColor: Colors.grey,
                          size: 10.0,
                          selectedSize: 12.0,
                          itemCount: publication.multimedia.length,
                          currentPageNotifier: _currentPageNotifier,
                        ),
                      ],
                    )
                  : Container(
                      height: 250, // Ajusta la altura del contenedor para que la imagen se vea más grande
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: NetworkImage(publication.multimedia[0].url),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(publication.user.profile_img),
                        ),
                        title: Text(
                          publication.user.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
            ),
            Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Image.asset(
                      "assets/images/like.png",
                      color: Colors.black,
                    ),
                    onPressed: () {
                      CustomDialog.showConfirmationDialog(
                        context,
                        'No está realizado',
                        'Chao!',
                      );
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/images/comments.png",
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/images/share.png",
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
