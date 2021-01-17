//this app not using VM, this is just to show the difference with and without VM
import 'package:newsapp/webservice.dart';
import 'package:newsapp/viewmodels/newsArticleViewModel.dart';

//NewsArticleViewModel is just a regular class, but this one extends ChangeNotifier
//and this way we can add function
//enum LoadingStatus { completed, searching, empty }

//I was trying not to use ChangeNotifier and provider but keep VM

//class NewsArticleListViewModel extends ChangeNotifier {
class NewsArticleListViewModel {
//  //what is this? here we call the _populateTopHeadlines() inside our constructor
//  //in this way when we initialize NewsArticleListViewModel, we directly get access to  the news list
//  //it's working, but this is not what we want
//  NewsArticleListViewModel() {
//    populateTopHeadlines();
//  }

//  var loadingStatus = LoadingStatus.searching;
  List<NewsArticleViewModel> articles = [];

  Future<void> search(String keyword) async {
//    loadingStatus = LoadingStatus.searching;
//    notifyListeners();
    //this function returns Future<List<NewsArticle>>
    var newsArticles = await Webservice().fetchNewsByKeywords(keyword);
    articles = newsArticles
        .map(
          (article) => NewsArticleViewModel(article: article),
        )
        .toList();
//
//    loadingStatus =
//        articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;

//    notifyListeners();
  }

  //this function not returning anything, but to get List<NewsArticleViewModel> articles
  //when i write return articles, notifyListeners() becomes dead code.
  Future<void> populateTopHeadlines() async {
//    loadingStatus = LoadingStatus.searching;
//    notifyListeners();
    //Webservice().fetchTopHeadlines() use http.get(url) and then use
    // jsonDecode(response.body) to decode Json, then iterate through the
    //list of dictionary for each article, converted each article to NewsArticle
    //object and then put it into a new list as List<NewsArticle>
    var newsArticles = await Webservice().fetchTopHeadlines();
    //then we put each NewsArticle to construct NewsArticleViewModel(article: article)
    articles = newsArticles
        .map(
          //article is the type: NewsArticle
          (article) => NewsArticleViewModel(article: article),
        )
        .toList();

//    //this is to notify UI about the changes.
//    notifyListeners();
  }
}

//class NewsArticleViewModel {
//  //NewsArticle is the class we created
//
//  NewsArticle _newsArticle;
//
//  NewsArticleViewModel({NewsArticle article}) : _newsArticle = article;
//
//  String get title {
//    return _newsArticle.title;
//  }
//
//  String get description {
//    return _newsArticle.description;
//  }
//
//  String get imageURL {
//    return _newsArticle.urlToImage;
//  }
//
//  String get url {
//    return _newsArticle.url;
//  }
//}

//final response = await http.get(url);
//
//final result = jsonDecode(response.body);
////result is a json, we want the key for articles
////list is list of json for each article
//Iterable list = result["articles"];
//return list
//    .map(
//(article) => NewsArticle.fromJSON(article),
//)
//    .toList();
