import 'package:flutter/material.dart';
import 'package:pacefin_news_app/services/news_class.dart';
import 'package:pacefin_news_app/services/news_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<NewsHeadlines> nhl;

  @override
  void initstate() {
    super.initState();
    nhl = newsService().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HEADLINES",
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Text("Body"),
          FutureBuilder(
              future: nhl,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("Body");
                } else {
                  return CircularProgressIndicator();
                }
              })
        ],
      ),
      backgroundColor: Color(0xff464646),
    );
  }
}
