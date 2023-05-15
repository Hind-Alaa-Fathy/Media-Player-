import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:media_player/notification/notification_service.dart';

import '../notification/notification_button.dart';
import '../quran1/quran11.dart';

class quran2 extends StatelessWidget {
  const quran2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 5,
                      child: Center(
                        child: Text( "مشاري بن راشد العفاسي",
                            style: TextStyle(
                                color: Color.fromRGBO(12, 203, 229, 1.0),fontSize: 30)),
                      )),
                  Expanded(
                    child: NotificationButton2(
                      text: "*",
                      onPressed: ()async{
                        await  notificationservice.showNotification(
                          title: 'from app',
                          body: 'لا تنسى ذكر الله',
                          summary: 'تذكير',
                          notificationLayout: NotificationLayout.Inbox,
                        );
                      },
                    ),
                  ),
                ],
              ),
              quran11(audio: "audio01.mp3",imgname: "https://png.pngtree.com/png-vector/20230206/ourmid/pngtree-quran-chapter-name-surah-al-fatiha-in-arabic-calligraphy-png-image_253149.png"),
              quran11(audio: "audio01.mp3",imgname: "https://png.pngtree.com/png-vector/20230206/ourmid/pngtree-quran-chapter-name-surah-al-fatiha-in-arabic-calligraphy-png-image_253149.png"),

            ],
          ),
        ),
      ),
    );
  }
}
