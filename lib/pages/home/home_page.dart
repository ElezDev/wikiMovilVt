import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wiki_virtualt/pages/post/post_page.dart';
import 'package:wiki_virtualt/profile/profile_page.dart';

import '../../widgets/item_navigation_buttom.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Center(
          child: Text('Welcome to Home Page'),
        ),
        bottomNavigationBar: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            height: 62,
            items: const [
              BottomNavigationBarItem(
                icon: ItemNavigationButton(
                  fileIcon: 'assets/images/logo.png',
                  title: 'Myworld',
                ),
                activeIcon: ItemNavigationButton(
                  fileIcon: 'assets/images/logo.png',
                  title: 'Home',
                  isActive: true,
                ),
              ),
              BottomNavigationBarItem(
                icon: ItemNavigationButton(
                  fileIcon: 'assets/images/logo.png',
                  title: 'Page 1',
                ),
                activeIcon: ItemNavigationButton(
                  fileIcon: 'assets/images/logo.png',
                  title: 'Page 2',
                  isActive: true,
                ),
              ),
              BottomNavigationBarItem(
                icon: ItemNavigationButton(
                  fileIcon: 'assets/images/profile_icon.png',
                  title: 'Perfil',
                ),
                activeIcon: ItemNavigationButton(
                  fileIcon: 'assets/images/profile_icon.png',
                  title: 'Perfil',
                  isActive: true,
                ),
              ),
            ],
          ),
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (BuildContext context) => FacebookPostsScreen(),
                );
              case 1:
                return CupertinoTabView(
                  builder: (BuildContext context) => FacebookPostsScreen(),
                );
              case 2:
                return CupertinoTabView(
                  builder: (BuildContext context) =>  MyView(),
                );
              case 3:
                return CupertinoTabView(
                  builder: (BuildContext context) => FacebookPostsScreen(),
                );
              default:
                return CupertinoTabView(
                  builder: (BuildContext context) => FacebookPostsScreen(),
                );
            }
          },
        ),
      ),
    );
  }
}
