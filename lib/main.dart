import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cron/cron.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:media_player/notification/notification_service.dart';
import 'SplashScreen.dart';
import 'login_register/firebase_options.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async{
  //await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}
Future<void> main() async {
  FirebaseMessaging.onBackgroundMessage( _firebaseMessagingBackgroundHandler);

  WidgetsFlutterBinding.ensureInitialized();
  await notificationservice.initialNotification();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  /////////////////////////////////////////////////////
  ////////////schedual notification //////////////////
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase. initializeApp( options: DefaultFirebaseOptions. currentPlatform, ); 

  AwesomeNotifications().initialize(
      null, // icon for your app notification
      [
        NotificationChannel(
            channelKey: 'key1',
            channelName: 'Proto Coders Point',
            channelDescription: "Notification example",
            defaultColor: Color(0XFF9050DD),
            ledColor: Colors.white,
            playSound: true,
            enableLights:true,
            enableVibration: false
        )
      ]
  );
  final cron = Cron();
  cron.schedule(Schedule.parse('*/5 * * * *'), () async {
    print('every 5 minutes');
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'key1',
            title:'from app',
            body: 'لا تنسى قراءة القران اليوم'
        )
    );
  });

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
      //audio()
      //notification()
      //SplashScreen() ,

    );
  }
}

