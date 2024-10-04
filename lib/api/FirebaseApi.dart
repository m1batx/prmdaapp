import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:prmda/main.dart';
import 'package:prmda/models/notification.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  String data = "None";

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final fCMToken = await _firebaseMessaging.getToken();
    data = fCMToken.toString();
    //print('Token: $fCMToken');
    initPushNotification();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) {
    }
    else{
      storeNotification(
        message.notification!.title.toString(), 
        message.notification!.body.toString(), 
        message.data);
      navigatorKey.currentState?.pushNamed(
        '/notification_screen',
        arguments: message,
      );
    }
  }

  Future initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Future<void> storeNotification(String title, String body, Map<String, dynamic> data) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      dynamic newMessage = NotificationModel(id: "",title:title,message: body,timestamp: DateTime.now()).toJson();
      await _firestore.collection('notifications').add(newMessage);
    }
  }

  // Load all notifications by user ID and date
  Future<List<Map<String, dynamic>>> loadNotifications() async {
    User? user = FirebaseAuth.instance.currentUser;
    
    QuerySnapshot querySnapshot = await _firestore
        .collection('notifications')
        .orderBy('timestamp', descending: true)
        .get();
    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  
    
  }
  // Future<List<Map<String, dynamic>>> loadNotifications() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     QuerySnapshot querySnapshot = await _firestore
  //         .collection('notifications')
  //         .where('userId', isEqualTo: user.uid)
  //         .orderBy('timestamp', descending: true)
  //         .get();

  //     return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  //   }
  //   return [];
  // }
}
