
import 'package:flutter/material.dart';

class TrendingStories extends StatelessWidget {

  final _stories = ["3 soldiers killed when fired started","Uber received nearly 500 applications","Hundreds of parents are deep in financial debt","A heartfelt note was found in the airplace"];

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
          child: Container(
        height: 300,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.all(15),
              leading: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.orange,
                  )
                ),
                child: Text("${index+1}",style: TextStyle(color: Colors.orange, fontSize: 22))),
              title: Text(_stories[index],style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold))
            );
          }
        ),
      ),
    );
    
    
   
  }

}