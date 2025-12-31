import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationNavigation {
  static void handleNavigation(RemoteMessage message) {
    final data = message.data;

    if (data['type'] == 'order') {
      print('➡ Navigate to Order Screen');
    } else if (data['type'] == 'profile') {
      print('➡ Navigate to Profile Screen');
    }
  }
}
