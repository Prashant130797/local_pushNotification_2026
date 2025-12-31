import 'package:firebase_messaging/firebase_messaging.dart';
import 'local_notification_service.dart';
import 'notification_navigation.dart';

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    /// Permission
    await _messaging.requestPermission(alert: true, badge: true, sound: true);

    /// Token
    String? token = await _messaging.getToken();
    print('🔥 FCM Token: $token');

    /// Token refresh
    FirebaseMessaging.instance.onTokenRefresh.listen((token) {
      print('🔄 Token Refreshed: $token');
    });

    /// Foreground
    FirebaseMessaging.onMessage.listen(_onForegroundMessage);

    /// Notification click (background)
    FirebaseMessaging.onMessageOpenedApp.listen(
      NotificationNavigation.handleNavigation,
    );
  }

  /// App killed state
  Future<void> checkTerminatedState() async {
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();

    if (message != null) {
      NotificationNavigation.handleNavigation(message);
    }
  }

  void _onForegroundMessage(RemoteMessage message) {
    final notification = message.notification;
    if (notification != null) {
      LocalNotificationService.showNotification(
        title: notification.title ?? '',
        body: notification.body ?? '',
      );
    }
  }


}
