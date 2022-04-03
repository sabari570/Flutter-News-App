import 'package:flutter/material.dart';
import 'package:flutter_news/helper/categoryArticles.dart';
import 'package:flutter_news/models/newsModel.dart';
import 'package:flutter_news/views/blogs.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});
  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<NewsArticle> articles = new List<NewsArticle>();
  bool _isLoading = true;
  void getCategoryNewsHeadlines() async {
    CategoryArticles categoryArticles = new CategoryArticles();
    await categoryArticles.getCategoryNews(widget.category);
    articles = categoryArticles.CategoryNewsBlog;
    print('${widget.category}');

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategoryNewsHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/FlutterIcon.png'),
            ),
            Text(
              ' Flutter',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text('News',
                style: TextStyle(
                  color: Colors.blue,
                )),
            CircleAvatar(
              backgroundImage: AssetImage('assets/sk_logo.png'),
            ),
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return BlogTile(
                              title: articles[index].title,
                              description: articles[index].description,
                              imageUrl: articles[index].urlToImage,
                              url: articles[index].url,
                              publishedAt: articles[index].publishedAt,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
