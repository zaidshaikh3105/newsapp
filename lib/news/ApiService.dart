import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/news/Nmodel.dart';
import 'package:newsapp/news/news.dart';
//Now let's make the HTTP request services
// this class will alows us to make a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService {
  //let's add an Endpoint URL, you can check the website documentation
  // and learn about the different Endpoint
  //for this example I'm going to use a single endpoint

  //NOTE: make sure to use your OWN apikey, you can make a free acount and
  // choose a developer option it's FREE
  var endPointUrl = Uri.parse(
      "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=641fb411ae214ecd98b446912fc2d444");

  //e http request function

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    ///check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles = body
          .map((dynamic item) => Article(
                title: item['title'],
                author: item['author'] ?? "---",
                description: item['description'],
                urlToImage: item['urlToImage'],
                publshedAt: DateTime.parse(item['publishedAt']),
                content: item["content"] ?? "---",
                articleUrl: item["url"],
              ))
          .toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
