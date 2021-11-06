import 'dart:convert';

import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=da32bb3a47cc48b0ba01c64c62c7481a";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      print("Inside status ok");
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          print("DATA RETRIVE");
          ArticleModel article = ArticleModel(
            title: element['title'].toString(),
            author: element['author'].toString(),
            description: element['description'].toString(),
            url: element['url'].toString(),
            urlImage: element['urlToImage'].toString(),
            content: element['content'].toString(),
          );

          news.add(article);
        }
      });
    }
  }
}

class category_news {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=da32bb3a47cc48b0ba01c64c62c7481a";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      print("Inside status ok");
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          print("DATA RETRIVE");
          ArticleModel article = ArticleModel(
            title: element['title'].toString(),
            author: element['author'].toString(),
            description: element['description'].toString(),
            url: element['url'].toString(),
            urlImage: element['urlToImage'].toString(),
            content: element['content'].toString(),
          );

          news.add(article);
        }
      });
    }
  }
}
