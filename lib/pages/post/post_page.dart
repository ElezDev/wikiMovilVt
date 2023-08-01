import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_virtualt/models/response_api_login.dart';
import 'package:wiki_virtualt/models/response_api_publication.dart';
import 'package:wiki_virtualt/pages/login/user_log_controller.dart';
import 'package:wiki_virtualt/pages/post/post_interaction.dart';
import 'package:wiki_virtualt/pages/stories/story.dart';
import 'package:wiki_virtualt/profile/profile_controller.dart';
import 'package:wiki_virtualt/provider/publication_provider.dart';

class PublicationView extends StatelessWidget {
  final PublicationProvider publicationProvider = PublicationProvider();

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();
    final Userlog? user = userController.user;
    final ProfileController _profileController = ProfileController();
    final String? profileImageUrl = user?.profileImg;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          title: Row(
            children: [
              const Spacer(),
              Text('Nombre App'),
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                ), 
                onPressed: () {
                },
              ),
                IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ), 
                onPressed: () {
                },
              ),
            ],
          ),
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

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            15.0), // Adjust the value to set the roundness
      ),
      child: AspectRatio(
        aspectRatio: 16 / 16, // You can adjust the aspect ratio as needed
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), //
            image: DecorationImage(
              image: NetworkImage(publication.multimedia[0].url),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
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
                  subtitle: Text(publication.description),
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.comment_sharp,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
