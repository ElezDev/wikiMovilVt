import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Notifications'),
      ),
      child: SafeArea(
        top: false, 
        child: ListView.builder(
          itemCount: 5, 
          itemBuilder: (context, index) {
            return NotificationItem(
              title: 'Notification Title $index',
              content: 'This is the content of notification $index.',
              time: '1m ago', // Replace this with the actual time of the notification
            );
          },
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String content;
  final String time;

  NotificationItem({
    required this.title,
    required this.content,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      leading: const CircleAvatar(
        // Replace this with the profile picture of the sender
        backgroundColor: Color.fromARGB(255, 231, 228, 228),
        child: Icon(CupertinoIcons.person, color: Color.fromARGB(255, 27, 218, 27)),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5), // Add padding here
            child: Text(content),
          ),
          Text(
            time,
            style: const TextStyle(
              color: CupertinoColors.systemGrey,
            ),
          ),
        ],
      ),
      onTap: () {
        // Add navigation or action when tapping the notification
      },
    );
  }
}
