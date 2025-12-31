import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:main_firebase_pushnotification/notification/notificationDetailScreen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  void firebaseMessaging() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

    String? token = await firebaseMessaging.getToken();
    print("the FCM token is ${token}");

    //App in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage remotemessage) {
      final title = remotemessage.notification?.title ?? "N/A";
      final body = remotemessage.notification?.body ?? "N/A";
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title.toString()),
            content: Text(
              body,
              maxLines: 1,
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NotificationDetailScreen(
                          body: body,
                          title: title,
                        );
                      },
                    ),
                  );
                },
                child: Text("NEXT"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
            ],
          );
        },
      );
    });

    //app in background and push to screen
    FirebaseMessaging.onMessage.listen((RemoteMessage remotemessage) {
      final title = remotemessage.notification?.title ?? "N/A";
      final body = remotemessage.notification?.body ?? "N/A";
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return NotificationDetailScreen(body: body, title: title);
          },
        ),
      );
    });

    //app is in termination state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final title = message.notification?.title ?? "N/A";
        final body = message.notification?.body ?? "N/A";
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return NotificationDetailScreen(body: body, title: title);
            },
          ),
        );
      }
    });
  }

  @override
  void initState() {
    firebaseMessaging();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        foregroundColor: Colors.white,
        title: Text("Push Notification"),
        centerTitle: true,
      ),
    );
  }
}
