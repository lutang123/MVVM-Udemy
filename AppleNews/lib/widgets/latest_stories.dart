import 'package:flutter/material.dart';

class LatestStories extends StatelessWidget {

  final _newsImages = ["news2.png","news3.png","news4.png","news5.png"];
  final _stories = ["3 soldiers killed when fired started","Uber received nearly 500 applications","Hundreds of parents are deep in financial debt","A heartfelt note was found in the airplace"];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.horizontal,
      crossAxisSpacing: 20,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Image.asset("images/news2.png",width: 200,height: 200),
        Text(_stories[0],style: TextStyle(color: Colors.white, fontSize: 22)),
         Image.asset("images/news3.png",width: 200,height: 200),
        Text(_stories[1],style: TextStyle(color: Colors.white, fontSize: 22)),
         Image.asset("images/news4.png",width: 200,height: 200),
        Text(_stories[2],style: TextStyle(color: Colors.white, fontSize: 22)),
         Image.asset("images/news1.png",width: 200,height: 200),
        Text(_stories[3],style: TextStyle(color: Colors.white, fontSize: 22)),
        
      ],
    );
  }
}
