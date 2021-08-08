import 'package:http/http.dart' as http;
import 'package:newsapp/news/Nmodel.dart';
import 'dart:convert';

//import 'package:news_app_api/secret.dart';
class News {
  List<Article> news = [];

  Future<void> getNews() async {
    var url = Uri.parse(
        "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=641fb411ae214ecd98b446912fc2d444");

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
          print(Article);
        }
      });
    }
  }
}
