import 'package:flutter_news/models/newsModel.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class NewsBLog {
  List<NewsArticle> news = [];

  String url =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=e36ebb077fc84a1cadd3be3cecaee2a5';
  Future<void> getNews() async {
    String datetime;
    String time;
    try {
      var response = await get(Uri.parse(url));

      var jsonData = jsonDecode(response.body);

      if (jsonData['status'] == 'ok') {
        jsonData['articles'].forEach(
          (element) {
            if (element['urlToImage'] != null &&
                element['description'] != null) {
              datetime = element['publishedAt'];
              DateTime now = DateTime.parse(datetime);
              time = DateFormat.jm().format(now);
              NewsArticle newsArticle = NewsArticle(
                title: element['title'],
                description: element['description'],
                urlToImage: element["urlToImage"],
                url: element['url'],
                publishedAt: time,
              );
              news.add(newsArticle);
            }
          },
        );
      }
    } catch (e) {
      print('Exception is: $e');
    }
  }
}
