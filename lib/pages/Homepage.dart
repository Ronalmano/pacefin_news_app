import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pacefin_news_app/services/news_class.dart';
import 'package:pacefin_news_app/services/news_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<NewsHeadlines?> nhlt;

  @override
  void initState() {
    log("HP");
    nhlt = NewsService().getNews();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 10, 16.0, 10.0),
          child: Column(
            children: [
              const Text("Body"),
              FutureBuilder<NewsHeadlines?>(
                  future: nhlt,
                  builder: (context, AsyncSnapshot<NewsHeadlines?> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          // scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data?.totalResults,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 20,
                              width: 100,
                              child: Text(snapshot.data!.articles[1].title),
                            );
                          });
                    } else {
                      return CircularProgressIndicator();
                    }
                  })
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xff464646),
    );
  }
}
