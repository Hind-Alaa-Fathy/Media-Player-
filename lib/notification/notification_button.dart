import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationButton2 extends StatelessWidget {
const NotificationButton2({
  required this.onPressed,
  required this.text,
  super.key,
});
final VoidCallback onPressed;
final String text;
@override
  Widget build(BuildContext context){
  return SizedBox(
      child:  ElevatedButton(
          onPressed: onPressed,
          child: Text(text,style: TextStyle(fontSize: 25)),
        ),

  );
}
}