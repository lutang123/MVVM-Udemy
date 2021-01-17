import 'package:flutter/material.dart';
import 'package:newsapp/webservice.dart';
import 'package:newsapp/model/news_article.dart';
import 'news_detail_page.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

//class LoadingScreen extends StatefulWidget {
//  @override
//  _LoadingScreenState createState() => _LoadingScreenState();
//}
//
//class _LoadingScreenState extends State<LoadingScreen> {
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    showTopHeadlines();
//  }
//
//  void showTopHeadlines() async {
//    //this function returns Future<List<NewsArticle>>
//    var newsList = await Webservice().fetchTopHeadlines();
//
//    await Navigator.push(context,
//        MaterialPageRoute(builder: (context) => NewsPage(newsList: newsList)));
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: SpinKitDoubleBounce(
//          color: Colors.white,
//          size: 100,
//        ),
//      ),
//    );
//  }
//}

class NewsPage extends StatefulWidget {
  //I was trying to get data from Loading page and then pass data to this page
  // just like weather app but actually no need.
//  NewsPage({this.newsList});
//  final newsList;

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final _controller = TextEditingController();
  //this app not use provider, so UI page directly access data
  //newsListPage is the data we will show on UI
  List<NewsArticle> newsListPage = [];

  @override
  void initState() {
    super.initState();
    showTopHeadlines();
  }

  void showTopHeadlines() async {
    //this function returns Future<List<NewsArticle>>
    newsListPage = await Webservice().fetchTopHeadlines();
    updateUI(newsListPage);
  }

  //this function will be used when people search news and when clear search result
  //so whatever new data comes, we update our newsListPage, which will then update UI
  void updateUI(var newsList) {
    setState(() {
      newsListPage = newsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            onSubmitted: (value) async {
              if (value.isNotEmpty) {
                var newsListBySearch =
                    await Webservice().fetchNewsByKeywords(value);
                updateUI(newsListBySearch);
              }
            },
            decoration: InputDecoration(
              labelText: 'Enter search term',
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () async {
                    _controller.clear();
                    var newsList = await Webservice().fetchTopHeadlines();
                    updateUI(newsList);
                  }),
            ),
          ),
          //must wrap into Expanded otherwise not show anything but not error either
          Expanded(
            child: ListView.builder(
              itemCount: newsListPage.length,
              itemBuilder: (context, index) {
                final article = newsListPage[index];
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
                  leading: Container(
                    width: 100,
                    height: 100,
                    child: article.urlToImage == null
                        ? Image.asset('images/news-placeholder.png')
                        //this is a get function that return a string
                        : Image.network(article.urlToImage),
                  ),
                  title: Text(article.title),
                );
              },
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
