import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{
  final FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();


    // Future<void> initNotification() async {
    //   AndroidInitializationSettings initializationSettingsAndroid =
    //   const AndroidInitializationSettings('facebook');

    //   var initializationSettingsIOS = DarwinInitializationSettings(
    //     requestAlertPermission: true,
    //     requestBadgePermission: true,
    //     requestSoundPermission: true,);

    //   var initializationSettings = InitializationSettings(
    //     android: initializationSettingsAndroid, iOS: initializationSettingsIOS
    //   );

    //   await notificationsPlugin.initialize(initializationSettings,
    //   onDidReceiveBackgroundNotificationResponse: (NotificationResponse NotificationResponse) async {
        
    //   },);

    
    // }


  Future<void> initNotification() async {
    const androidSettings = AndroidInitializationSettings('facebook');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await notificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (response) async {
        // Handle notification responses
      },
    );
  }

    notificationDetails(){
      return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName', importance: Importance.max),
        iOS: DarwinNotificationDetails(),
      );
    }


    Future showNotification({int id = 0, String? title, String? body, String? payLoad}) async {
      return notificationsPlugin.show(id, title, body, notificationDetails());
    }
}