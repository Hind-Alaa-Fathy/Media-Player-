import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_player/homelayout.dart';

import '../main.dart';

class notificationservice{
  static Future<void> initialNotification() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelGroupKey: 'high_importance_channel',
            channelKey: 'high_importance_channel',
            channelName: 'basic notifications',
            channelDescription: 'notification channel for basic tests',
            defaultColor: const Color(0xFF9D500D),
            ledColor: Colors.white,
            importance: NotificationImportance.Max,
            channelShowBadge: true,
            onlyAlertOnce: true,
            playSound: true,
            criticalAlerts: true
        )
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'high_importance_channel_group',
            channelGroupName: 'group 1')
      ],
      debug: true,
    );
    await AwesomeNotifications().isNotificationAllowed().then(
          (isAllowed) async {
        if(!isAllowed){
          await AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod:onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }
//use this method to detect when a new notification or schedule is created
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification)async{
    debugPrint('onNotificationCreatedMethod');
  }
//use this method to detect when every time that a new notification is displayed
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification)async{
    debugPrint('onNotificationDisplayedMethod');
  }
//use this method to detect if user dismissed a notification
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction)async{
    debugPrint('onDismissActionReceivedMethod');
  }
//use this method to detect when user taps on a notification or action
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction)async{
    debugPrint('onActionReceivedMethod');
    final payload = receivedAction.payload ??{};
    if(payload["navigation"]== "true"){
      MyApp.navigatorkey.currentState?.push(
        MaterialPageRoute(builder: (_)=> HomeLayout()),
      );
    }
  }
  static Future<void> showNotification({
    required final String title,
    required final String body,
    final String? summary,
    final Map<String,String>? payload,
    final ActionType actionType = ActionType.Default,
    final NotificationLayout notificationLayout = NotificationLayout.Default,
    final NotificationCategory? category,
    final String? bigPicture,
    final List<NotificationActionButton>? actionButtons,
    final bool schedule = false,
    final int? interval,
  })async{
    assert(!schedule || (schedule && interval!=null));
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: -1,
          channelKey: 'high_importance_channel',
          title: title,
          body: body,
          actionType: actionType,
          notificationLayout: notificationLayout,
          summary: summary,
          category: category,
          payload: payload,
          bigPicture: bigPicture,
        ),
        actionButtons: actionButtons,
        schedule: schedule?NotificationInterval(
          interval: interval,
          timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
          preciseAlarm: true,
          repeats: false,
        )
            :null
    );
  }
}