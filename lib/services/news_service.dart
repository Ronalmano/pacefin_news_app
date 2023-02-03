import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pacefin_news_app/services/news_class.dart';

class newsService {
  Future getNews() async {
    dynamic nhl;
    var client = http.Client();
    var url = Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2022-12-28&sortBy=publishedAt&apiKey=634ac0d0c9044814a32eb5d360b5202f");
    var response = await client.get(
      url,
    );

    if (response.statusCode == 200) {
      var jsondata = jsonEncode(response.body);
      var res = jsonDecode(jsondata);
      nhl = NewsHeadlines.fromJson(res);
      return nhl;
    }
    return null;
  }
}
