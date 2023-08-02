// import 'package:flutter/material.dart';
// import 'package:chewie/chewie.dart';
// import 'package:page_view_indicators/page_view_indicators.dart';
// import 'package:video_player/video_player.dart';
// import 'package:wiki_virtualt/widgets/custom_dialog.dart';

// class PublicationItem extends StatefulWidget {
//   final Publication publication;

//   PublicationItem(this.publication);

//   @override
//   _PublicationItemState createState() => _PublicationItemState();
// }

// class _PublicationItemState extends State<PublicationItem> {
//   final _pageController = PageController();
//   final _currentPageNotifier = ValueNotifier<int>(0);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.white,
//       elevation: 1.0,
//       margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(1.0),
//       ),
//       child: AspectRatio(
//         aspectRatio: 15 / 23,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   widget.publication.description,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w300,
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: widget.publication.multimedia.length > 1
//                   ? Stack(
//                       alignment: Alignment.bottomCenter,
//                       children: [
//                         PageView.builder(
//                           controller: _pageController,
//                           itemCount: widget.publication.multimedia.length,
//                           itemBuilder: (context, index) {
//                             final multimedia = widget.publication.multimedia[index];
//                             if (multimedia.type == MediaType.image) {
//                               return _buildImageSlide(multimedia.url);
//                             } else if (multimedia.type == MediaType.video) {
//                               return _buildVideoSlide(multimedia.url);
//                             } else {
//                               return Container();
//                             }
//                           },
//                           onPageChanged: (index) {
//                             _currentPageNotifier.value = index;
//                           },
//                         ),
//                         CirclePageIndicator(
//                           selectedDotColor: Colors.white,
//                           dotColor: Colors.grey,
//                           size: 10.0,
//                           selectedSize: 12.0,
//                           itemCount: widget.publication.multimedia.length,
//                           currentPageNotifier: _currentPageNotifier,
//                         ),
//                       ],
//                     )
//                   : Container(
//                       height: 250,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                         image: DecorationImage(
//                           image: NetworkImage(widget.publication.multimedia[0].url),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: NetworkImage(widget.publication.user.profile_img),
//                         ),
//                         title: Text(
//                           widget.publication.user.name,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ),
//             ),
//             Container(
//               color: Colors.transparent,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(
//                     icon: Image.asset(
//                       "assets/images/like.png",
//                       color: Colors.black,
//                     ),
//                     onPressed: () {
//                       CustomDialog.showConfirmationDialog(
//                         context,
//                         'No está realizado',
//                         'Chao!',
//                       );
//                     },
//                   ),
//                   IconButton(
//                     icon: Image.asset(
//                       "assets/images/comments.png",
//                       color: Colors.black,
//                     ),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: Image.asset(
//                       "assets/images/share.png",
//                       color: Colors.black,
//                     ),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildImageSlide(String imageUrl) {
//     return Container(
//       height: 2,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15.0),
//         image: DecorationImage(
//           image: NetworkImage(imageUrl),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage(widget.publication.user.profile_img),
//         ),
//         title: Text(
//           widget.publication.user.name,
//           style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildVideoSlide(String videoUrl) {
//     final videoPlayerController = VideoPlayerController.network(videoUrl);
//     final chewieController = ChewieController(
//       videoPlayerController: videoPlayerController,
//       autoPlay: false,
//       looping: false,
//     );

//     return AspectRatio(
//       aspectRatio: 16 / 9,
//       child: Chewie(controller: chewieController),
//     );
//   }
// }

