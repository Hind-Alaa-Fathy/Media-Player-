import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:media_player/quran1/quran1.dart';
import 'package:media_player/quran%202/quran2.dart';
import 'package:media_player/quran3/quran3.dart';
class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> screens = [quran1(),quran2(),quran3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromRGBO(29, 150, 117, 1.0),
        backgroundColor: Colors.white,
        height: 50,
        animationDuration: Duration(milliseconds: 100),
        items: [
          Icon(
            Icons.record_voice_over_sharp,
            size: 30,
            color: Colors.white70,
          ),
          Icon(
            Icons.speaker_rounded,
            size: 30,
            color: Colors.white70,
          ),
          Icon(
            Icons.speaker_phone_sharp,
            size: 30,
            color: Colors.white70,
          ),

        ],
        onTap: (index) {
          print(index);
          setState((){
            currentIndex = index;
          });
        },

      ),
      // drawer:const NavigationDrawer(),
      body: screens[currentIndex],
    );
  }
}

