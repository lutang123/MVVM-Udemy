//this factory function will take a dictionary which will be a json and
//use that json dictionary we can construct a brand new news article object

////https://newsapi.org/docs/endpoints/top-headlines

//https://stackoverflow.com/questions/53886304/understanding-factory-constructor-code-example-dart
//https://flutter.dev/docs/cookbook/networking/fetch-data
//https://flutter.dev/docs/cookbook/networking/background-parsing
//https://flutter.dev/docs/development/data-and-backend/json
//this function will be responsible for creating new instances of the news article object from NewsArticle class
//the json will have a string key and for value we don't know the type, so we put as dynamic

class NewsArticle {
  final String title;
  final String description;
  final String urlToImage;
  final String url;

  NewsArticle({this.title, this.description, this.urlToImage, this.url});

  factory NewsArticle.fromJSON(Map<String, dynamic> json) {
    return NewsArticle(
        title: json["title"],
        description: json["description"],
        urlToImage: json["urlToImage"],
        url: json["url"]);
  }
}
