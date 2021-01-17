import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../model/news_article.dart';

class NewsDetailsPage extends StatelessWidget {
  NewsDetailsPage({this.article});
  final NewsArticle article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${article.title}'),
      ),
      body: WebView(
        initialUrl: article.url,
      ),
    );
  }
}
