import 'package:flutter/material.dart';
import 'package:hacker_news/pages/comment_list_page.dart';
import 'package:hacker_news/view_models/comment_list_view_model.dart';
import 'package:hacker_news/view_models/story_list_view_model.dart';
import 'package:hacker_news/view_models/story_view_model.dart';
import 'package:hacker_news/widgets/story_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<StoryListViewModel>(context, listen: false).getTopStories();
  }

  void _navigateToCommentsPage(BuildContext context, StoryViewModel story) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (context) => CommentListViewModel(),
              child: CommentListPage(story: story))),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final vm = Provider.of<StoryListViewModel>(context);
    //debugPrint("${vm.stories.length}");

    return Scaffold(
        appBar: AppBar(title: Text("Hacker News")),
        body: Consumer<StoryListViewModel>(builder: (context, vm, child) {
          return StoryList(
            stories: vm.stories,
            onSelected: (StoryViewModel story) {
              _navigateToCommentsPage(context, story);
            },
          );
        }));
  }
}
