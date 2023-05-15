import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String title;
  const TopBar({
    required this.title,
    super.key,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
           colors: [

             Color.fromRGBO(224, 144, 94, 1.0),
             Color.fromRGBO(192, 124, 10, 1.0),

            // Theme.of(context).shadowColor,
           ]
        )
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
