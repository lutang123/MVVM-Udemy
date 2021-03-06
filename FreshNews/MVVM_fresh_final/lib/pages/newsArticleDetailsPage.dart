import 'package:flutter/material.dart';
import 'package:fresh_news/viewmodels/newsArticleViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailsPage extends StatelessWidget {
  NewsArticleDetailsPage({this.article});
  final NewsArticleViewModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${this.article.title}"),
        ),
        body: WebView(
          initialUrl: this.article.url,
        ));
  }
}
