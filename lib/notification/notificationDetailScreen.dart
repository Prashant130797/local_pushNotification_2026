import 'package:flutter/material.dart';

class NotificationDetailScreen extends StatelessWidget {
  final String title;
  final String body;
  NotificationDetailScreen({
    super.key,
    required this.body,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notification detail Screen")),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(body), SizedBox(height: 10), Text(title)],
        ),
      ),
    );
  }
}
