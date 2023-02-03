import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:pacefin_news_app/services/news_class.dart';

class NewsService {
  Future<NewsHeadlines?> getNews() async {
    log("Fucntion called");
    NewsHeadlines? nhl;

    var url = Uri.parse(
      "https://newsapi.org/v2/everything?q=tesla&from=2023-01-03&sortBy=publishedAt&apiKey=0b31ae75f1ed40ce9f3b5c742196034c",
    );
    var response = await http.get(
      url,
    );
    // log(response.body);

    if (response.statusCode == 200) {
      // log(response.body);
      var jsondata = json.encode(response.body);
      // log(jsondata);
      var res = json.decode(response.body);
      log(res.toString());
      nhl = NewsHeadlines.fromJson(res);
      return nhl;
    }
    return null;
  }
}
