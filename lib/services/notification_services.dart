
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices{
  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async{
    AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings("logo.png");
    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestCriticalPermission: true,
      onDidReceiveLocalNotification: 
        (int id, String? title, String? body, String? payload) async{});

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS
    );
    await notificationsPlugin.initialize(initializationSettings, 
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {}
    );
  }


  notificationDetails(){
    return const NotificationDetails(
      android: AndroidNotificationDetails("channelId", "channelName",
      importance: Importance.max),
      iOS: DarwinNotificationDetails()
    );
  }


  Future showNotification({
    int id = 0, String? title, String? body, String? payload 
  }) async{
    return notificationsPlugin.show(id, title, body, await notificationDetails());
  }

}