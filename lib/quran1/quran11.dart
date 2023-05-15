import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class quran11 extends StatefulWidget {
  //audio01.mp3
  String audio = "";
  //سورة البقرة
  String imgname = "";

  quran11({required this.audio,required this.imgname});

  @override
  State<quran11> createState() => _quran11State();
}

class _quran11State extends State<quran11> {
  final player = AudioPlayer();

  bool isplaying = false;

  Duration duration = Duration.zero;

  Duration position = Duration.zero;

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    player.dispose();
    player.onPlayerStateChanged.listen(null).cancel();
    player.onDurationChanged.listen(null).cancel();
    player.onPositionChanged.listen(null).cancel();
    super.dispose();
  }
  void initState()  {
    super.initState();
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isplaying = state ==PlayerState.playing;
      });
    });
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    //onAudioPositionChanged
    player.onPositionChanged.listen((newposition) {
      setState(() {
        position = newposition ;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(right: 30,left: 30),
          decoration: BoxDecoration(border: Border.all(color: Colors.green),borderRadius: BorderRadius.circular(20),
              color: Colors.white70),
          child: Column(
            children: [
              Image(image: NetworkImage(widget.imgname),height: 200,width: 500),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(
                      width: 300,
                      child: Slider(min: 0,max: duration.inSeconds.toDouble(), value: position.inSeconds.toDouble(), onChanged: (value){
                        final position = Duration(seconds: value.toInt());
                        player.seek(position);
                        player.resume();
                      })),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(formatTime(position)),
                      Text(formatTime((duration-position))),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // IconButton(onPressed: (){}, icon: Icon(Icons.first_page),iconSize: 35,),
                      IconButton(onPressed: () async {
                        if(isplaying){
                          setState(() {
                            isplaying = false;
                          });
                          player.pause();
                          //stopquran();
                        }
                        else{
                          setState(() {
                            isplaying = true;
                          });
                          await player.play(AssetSource('audio/${widget.audio}'));
                        }
                      }, icon: isplaying?Icon(Icons.pause) : Icon(Icons.play_arrow),iconSize: 35,),
                      // IconButton(onPressed: (){}, icon: Icon(Icons.last_page),iconSize: 35,),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5,)
            ],
          ),
        ),
        //audio01.mp3

      ],
    );
  }
}
