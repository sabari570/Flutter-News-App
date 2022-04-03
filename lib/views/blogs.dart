import 'package:flutter/material.dart';
import 'package:flutter_news/views/article_view.dart';

class BlogTile extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String url;
  final String publishedAt;
  BlogTile({
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.url,
    @required this.publishedAt,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (conetxt) => ArticleView(
                      blogUrl: url,
                      imageUrl: imageUrl,
                    )));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.network(
                imageUrl,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Published At: $publishedAt',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
