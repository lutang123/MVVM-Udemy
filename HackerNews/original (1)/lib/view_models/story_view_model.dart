

import 'package:hacker_news/models/story.dart';

class StoryViewModel {

  final Story story; 

  StoryViewModel({this.story});

  String get title {
    return this.story.title; 
  }

  String get url {
    return this.story.url; 
  }

  int get noOfComments {
    return this.story.commentIds.length; 
  }

}