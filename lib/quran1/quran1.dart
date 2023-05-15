import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:media_player/notification/notification_service.dart';
import 'package:media_player/quran1/quran11.dart';

import '../notification/notification_button.dart';

class quran1 extends StatefulWidget {

  @override
  State<quran1> createState() => _quran1State();
}

class _quran1State extends State<quran1> {


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
                         child: Text( "ماهر المعيقلي",
                             style: TextStyle(
                                 color: Colors.teal,fontSize: 30)),
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
