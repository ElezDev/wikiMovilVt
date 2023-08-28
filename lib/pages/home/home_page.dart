import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wiki_virtualt/pages/post/create_post_page.dart';
import 'package:wiki_virtualt/pages/post/post_page.dart';
import 'package:wiki_virtualt/profile/profile_page.dart';
import 'package:wiki_virtualt/profile/profile_prueba.dart';
import 'package:wiki_virtualt/widgets/notification.dart';

import '../../widgets/item_navigation_buttom.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Keep track of the selected tab index
  int _selectedIndex = 0;

  // Define the pages for each tab
  final List<Widget> _tabPages = [
    PublicationViewPage(), // Assuming this is the correct page
    CreatePostPage(),
    ProfilePagePrueba(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoTheme(
        data: const CupertinoThemeData(
          brightness: Brightness.light,
        ),
        child: Scaffold(
          body: _tabPages[_selectedIndex], // Show the selected tab page
          bottomNavigationBar: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              backgroundColor: Colors.transparent,
              height: 54,
              items: const [
                BottomNavigationBarItem(
                  icon: ItemNavigationButton(
                    fileIcon: 'assets/images/home.png',
                    title: 'Home',
                  ),
                  activeIcon: ItemNavigationButton(
                    fileIcon: 'assets/images/home.png',
                    title: 'Home',
                    isActive: true,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: ItemNavigationButton(
                    fileIcon: 'assets/images/añadir.png',
                    title: 'Page 1',
                  ),
                ),
                BottomNavigationBarItem(
                  icon: ItemNavigationButton(
                    fileIcon: 'assets/images/profile.png',
                    title: 'Perfil',
                  ),
                  activeIcon: ItemNavigationButton(
                    fileIcon: 'assets/images/profile.png',
                    title: 'Perfil',
                    isActive: true,
                  ),
                ),
              ],
              currentIndex: _selectedIndex, // Set the current index
              onTap: (index) {
                // Change the selected tab index when a tab is tapped
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            tabBuilder: (context, index) {
              return CupertinoTabView(builder: (BuildContext context) {
                // Use the correct page for each tab
                return _tabPages[index];
              });
            },
          ),
        ),
      ),
    );
  }
}
