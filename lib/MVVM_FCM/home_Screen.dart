import 'package:flutter/material.dart';
import 'package:main_firebase_pushnotification/MVVM_FCM/local_notification_service.dart';
import 'package:main_firebase_pushnotification/MVVM_FCM/notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      LocalNotificationService.requestPermission();
    });
    _notificationService.initialize();
    _notificationService.checkTerminatedState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        icon: Icon(Icons.baby_changing_station),
        onPressed: () {
          LocalNotificationService.showNotification(
            title: 'Hello',
            body: 'Local notification triggered 🚀',
          );
        },
      ),
      body: Center(
        child: Text(
          'Push Notifications Ready 🚀',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
