import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wiki_virtualt/pages/post/post_page.dart';
import 'package:wiki_virtualt/profile/profile_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoTheme(
        data: const CupertinoThemeData(
          brightness: Brightness.light, 
        ),
        child: Scaffold(
          body: const Center(
            child: Text('Welcome to Home Page'),
          ),
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
                  activeIcon: ItemNavigationButton(
                    fileIcon: 'assets/images/añadir.png',
                    title: 'Page 2',
                    isActive: true,
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
            ),
            tabBuilder: (context, index) {
              switch (index) {
                case 0:
                  return CupertinoTabView(
                    builder: (BuildContext context) => PublicationViewPage(),
                  );
                case 1:
                  return CupertinoTabView(
                    builder: (BuildContext context) => PublicationViewPage(),
                  );
                case 2:
                  return CupertinoTabView(
                    builder: (BuildContext context) => ProfilePage(),
                  );
                default:
                  return CupertinoTabView(
                    builder: (BuildContext context) => PublicationViewPage(),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
