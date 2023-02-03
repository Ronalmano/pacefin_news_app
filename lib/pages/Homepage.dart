import 'package:flutter/material.dart';
import 'package:pacefin_news_app/services/news_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<NewsHeadlines> nhl;

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
      backgroundColor: Color(0xff464646),
    );
  }
}
