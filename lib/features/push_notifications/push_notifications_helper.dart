import 'dart:developer';
import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ninjaa/utils/common_library.dart';
import 'package:ninjaa/utils/local_storage/local_storage.dart';

class PushNotificationHelper with LocalStorageHelper {
  final fcm = FirebaseMessaging.instance;

  Future<void> initializeNotification() async {
    AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelGroupKey: 'ninjamart_notification_channel',
              channelKey: 'ninjamart_notifications',
              channelName: 'ninjamart Notifications',
              channelDescription: 'Notification channel for ninjamart',
              playSound: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultColor: const Color(0xFF9D50DD),
              ledColor: Colors.white)
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'ninjamart_notification_channel',
              channelGroupName: 'ninjamart')
        ],
        debug: true);
    final isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  @pragma('vm:entry-point')
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await setupFlutterNotifications().then((value) {
      showFlutterNotification(message);
    });

    print('Handling a background message ${message.messageId}');
  }

  void getIOSpermission() {
    fcm.requestPermission(
        alert: true, badge: true, sound: true, provisional: false);
  }

  Future<void> setupFlutterNotifications() async {
    initializeNotification();

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    final storedFcmkey = await retrieveToken();
    final storedFcmkeyDate = await retrieveTokenDate();
    log("Retrieved Token is $storedFcmkey");
    bool isTokenExpired = true;
    if (storedFcmkey.isNotEmpty || storedFcmkeyDate.isNotEmpty) {
      isTokenExpired =
          DateTime.parse(storedFcmkeyDate).difference(DateTime.now()).inDays >
              30;
      log("Date time difference is ${DateTime.now().difference(DateTime.parse(storedFcmkeyDate)).inDays}");
    }
    log("Is token expired is $isTokenExpired");
    if (isTokenExpired) {
      final token = await fcm.getToken();
      saveToken(token: token ?? "");
    } else {
      log("FCM Token is 2 ${storedFcmkey}");
    }
    FirebaseMessaging.onBackgroundMessage((message) async {
      log("On msg is ${message.toMap()}");
      showFlutterNotification(message, isBackGround: true);
    });
    final initialMsg = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMsg != null) {
      log("Initial msg is ${initialMsg.toMap()}");
      showFlutterNotification(initialMsg);
    }
    FirebaseMessaging.onMessage.any((message) {
      log("On msg is ${message.toMap()}");
      log("FCM Message data is ${message.data}");
      log("FCM Message title is ${message.notification!.title} && Body is ${message.notification!.title}");
      log("FCM Message data is ${message.notification!.android!.toMap().entries}");

      showFlutterNotification(message);
      return true;
    });
  }

  void showFlutterNotification(RemoteMessage message,
      {bool isBackGround = false}) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 10,
            channelKey: 'ninjamart_notifications',
            actionType: ActionType.Default,
            title: isBackGround ? "Background nsg" : notification.title,
            body: notification.body,
          ),
          actionButtons: [
            NotificationActionButton(key: "orderKey", label: "Track Now")
          ]);
    }
  }
}
