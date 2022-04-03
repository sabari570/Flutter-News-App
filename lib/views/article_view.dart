import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  final String imageUrl;
  ArticleView({this.blogUrl, this.imageUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  Completer<WebViewController> _completer = new Completer<WebViewController>();

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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.blogUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: ((WebViewController controller) {
            _completer.complete(controller);
          }),
        ),
      ),
    );
  }
}
