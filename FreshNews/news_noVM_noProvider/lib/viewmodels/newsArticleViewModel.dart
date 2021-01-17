//this app not using VM
import 'package:newsapp/model/news_article.dart';
import 'package:flutter/material.dart';

class NewsArticleViewModel {
  // //at beginning we write this but as soon as we say this._ it will be an error

//  NewsArticle _newsArticle;
//  NewsArticleViewModel({this._newsArticle})

// //instead we do the following:
  //this is to say we make _newsArticle as private but can be accessed from public via article

  final NewsArticle _newsArticle;
  NewsArticleViewModel({NewsArticle article}) : _newsArticle = article;

  String get title {
    return _newsArticle.title;
  }

  String get description {
    return _newsArticle.description;
  }

  String get imageURL {
    return _newsArticle.urlToImage;
  }

  String get url {
    return _newsArticle.url;
  }
}

//this is just to show an example about :
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
