import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pacefin_news_app/services/news_class.dart';

class newsService {
  Future<NewsHeadlines> getNews() async {
    dynamic nhl;
    var client = http.Client();
    var url = Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2023-01-03&sortBy=publishedAt&apiKey=0b31ae75f1ed40ce9f3b5c742196034c");
    var response = await client.get(
      url,
    );

    if (response.statusCode == 200) {
      var jsondata = jsonEncode(response.body);
      var res = jsonDecode(jsondata);
      nhl = NewsHeadlines.fromJson(res);
      return nhl;
    }
    return nhl;
  }
}
