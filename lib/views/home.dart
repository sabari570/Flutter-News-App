import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/helper/newsBlog.dart';
import 'package:flutter_news/models/category_models.dart';
import 'package:flutter_news/models/newsModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_news/views/article_view.dart';
import 'package:flutter_news/views/blogs.dart';
import 'package:flutter_news/views/category_news.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<NewsArticle> articles = new List<NewsArticle>();
  bool _isLoading = true;

  void getNewsHeadlines() async {
    NewsBLog newsBlog = new NewsBLog();
    await newsBlog.getNews();
    articles = newsBlog.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNewsHeadlines();
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
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Container(
                          height: 70,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                categoryName: categories[index].categoryName,
                                imageUrl: categories[index].imageUrl,
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
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
              ));
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryNews(
            category: categoryName.toLowerCase(),
          );
        }));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 90,
                width: 120,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            Container(
              alignment: Alignment.center,
              height: 70,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
