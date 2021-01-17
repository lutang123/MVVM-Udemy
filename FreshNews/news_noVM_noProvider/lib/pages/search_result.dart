//we actuall do not need this page, just here to serve as thought process

import 'package:flutter/material.dart';
import 'package:newsapp/webservice.dart';
import 'package:newsapp/model/news_article.dart';
import 'news_detail_page.dart';

class SearchResult extends StatefulWidget {
  SearchResult({this.keyword});
  final String keyword;

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  Webservice webservice;
  List<NewsArticle> newsListSearch = [];

  @override
  void initState() {
    super.initState();

    webservice = Webservice();
    search(widget.keyword);
  }

  Future<void> search(String keyword) async {
    //this function returns Future<List<NewsArticle>>
    newsListSearch = await webservice.fetchNewsByKeywords(keyword);
    return newsListSearch;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News related to ${widget.keyword}'),
      ),
      body: ListView.builder(
        //List<NewsArticleViewModel> articles, articles is our final list
        itemCount: newsListSearch.length,
        itemBuilder: (context, index) {
          final article = newsListSearch[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return NewsDetailsPage(article: article);
                  },
                ),
              );
            },
            //we wrap image in a container to make sure all image is in the same size
            leading: NewWidget(article: article),
            title: Text(article.title),
          );

          // By default, show a loading spinner.
//          return CircularProgressIndicator();
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//not necessary to extract as a new widget
class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
    @required this.article,
  }) : super(key: key);

  final NewsArticle article;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: article.urlToImage == null
          ? Image.asset('images/news-placeholder.png')
          //this is a get function that return a string
          : Image.network(article.urlToImage),
    );
  }
}
