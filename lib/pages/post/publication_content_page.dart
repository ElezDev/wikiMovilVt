import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:wiki_virtualt/models/response_api_publication.dart';
import 'package:wiki_virtualt/pages/post/widgets/commet_post_widget.dart';
import 'package:wiki_virtualt/widgets/custom_dialog.dart';

class PublicationItem extends StatelessWidget {
  final Publication publication;

  PublicationItem(this.publication);

  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    if (publication.multimedia.isNotEmpty) {
      return _buildCardWithImages(context);
    } else {
      return _buildCardWithoutImages(context);
    }
  }

  Widget _buildCardWithImages(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
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
                child: Description(publication: publication),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: publication.multimedia.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image:
                                NetworkImage(publication.multimedia[index].url),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                NetworkImage(publication.user.profile_img),
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
                    dotColor: const Color.fromARGB(255, 27, 218, 27),
                    size: 10.0,
                    selectedSize: 12.0,
                    itemCount: publication.multimedia.length,
                    currentPageNotifier: _currentPageNotifier,
                  ),
                ],
              ),
            ),
            Buttons()
          ],
        ),
      ),
    );
  }


  Widget _buildCardWithoutImages(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Description(publication: publication),
          ),
          const SizedBox(height: 8), // Adding some spacing
          Buttons(), // Using the correct class name
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: IconButton(
              icon: Image.asset(
                "assets/images/like.png",
                color: Colors.black,
              ),
              iconSize: 1,
              onPressed: () {
                CustomDialog.showConfirmationDialog(
                  context,
                  'No está realizado',
                  'Chao!',
                );
              },
            ),
          ),
          const Text(
            "5",
            style: TextStyle(
              color: Color.fromARGB(255, 27, 218, 27),
              fontSize: 16,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ElevatedButton.icon(
              onPressed: () {
                showBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  context: context,
                  builder: (context) => AddNewComment(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: Image.asset(
                "assets/images/comments.png",
                color: Colors.black,
                width: 24,
                height: 24,
              ),
              label: Text(
                "",
                style: TextStyle(),
              ),
            ),
          ),
          const Text(
            "8",
            style: TextStyle(
              color: Color.fromARGB(255, 27, 218, 27),
              fontSize: 16,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: IconButton(
              icon: Image.asset(
                "assets/images/share.png",
                color: Colors.black,
              ),
              iconSize: 1,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.publication,
  }) : super(key: key);

  final Publication publication;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        publication.description,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
