import 'package:flutter/material.dart';
import 'package:flutter_news/views/article_view.dart';
import 'package:flutter_news/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter News',
      theme: ThemeData(primaryColor: Colors.white),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/articleView': (context) => ArticleView(),
      },
    );
  }
}
