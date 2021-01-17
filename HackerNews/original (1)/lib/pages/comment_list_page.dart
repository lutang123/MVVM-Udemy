

import 'package:flutter/material.dart';
import 'package:hacker_news/view_models/comment_list_view_model.dart';
import 'package:hacker_news/view_models/story_view_model.dart';
import 'package:hacker_news/widgets/comment_list.dart';
import 'package:provider/provider.dart';

class CommentListPage extends StatefulWidget {

  final StoryViewModel story; 
  CommentListPage({this.story});

  @override 
  _CommentListPageState createState() => _CommentListPageState(); 
}

class _CommentListPageState extends State<CommentListPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<CommentListViewModel>(context, listen: false).getCommentsByStory(this.widget.story);
  }

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<CommentListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.story.title)
      ),
      body: CommentList(comments: vm.comments)
    );
    
  }

}