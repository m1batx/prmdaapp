import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:prmda/main.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  String data = "None";

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final fCMToken = await _firebaseMessaging.getToken();
    data = fCMToken.toString();
    // print('Token: $fCMToken');
    initPushNotification();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed(
      '/notification_screen',
      arguments: message,
    );
  }

  Future initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
