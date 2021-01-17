

import 'package:flutter/material.dart';

class TopStories extends StatelessWidget {
  const TopStories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Text("Top Stores",
           style: TextStyle(
               color: Colors.red,
               fontSize: 50,
               fontWeight: FontWeight.bold)),
      ),
     Image.asset("images/news1.png"), 
     Padding(
       padding: const EdgeInsets.only(top: 10.0),
       child: Text("FOX NEWS",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
     ), 
     Text("Trump dares House to impeach after Pelosi advances probe",style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold))
    ],
      );
  }
}