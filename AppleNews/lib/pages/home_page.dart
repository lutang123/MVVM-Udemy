import 'package:apple_news/widgets/latest_stories.dart';
import 'package:apple_news/widgets/top_stories.dart';
import 'package:apple_news/widgets/trending_stories.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(12),
          color: Colors.black,
          child: SingleChildScrollView(
            primary: true,
          child: SafeArea(
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("News",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold)),
                Text("December 5",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 50,
                        fontWeight: FontWeight.bold)),
                Divider(color: Colors.grey[700]),
                TopStories(),
                Container(
                  height: 300,
                  child: LatestStories() 
                ), 
                Text("Trending Stories",
           style: TextStyle(
               color: Colors.orange,
               fontSize: 40,
               fontWeight: FontWeight.bold)),
                 TrendingStories()
             
              ]),
            ),
          ),
      ),
    );
  }
}
