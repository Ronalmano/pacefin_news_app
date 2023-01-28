import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class newsService {
  Future getNews() async {
    var client = http.Client();
    var url = Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2022-12-28&sortBy=publishedAt&apiKey=634ac0d0c9044814a32eb5d360b5202f");
    var response = await client.get(
      url,
    );

    if (response.statusCode == 200) {
      return "Passed";
    } else {
      return "Failed";
    }
  }
}
