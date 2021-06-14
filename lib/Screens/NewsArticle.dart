import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'NewsDetails.dart';

class NewsArticle extends StatefulWidget {
  final NewsDetails nd;
  NewsArticle(this.nd);
  @override
  _NewsArticleState createState() => _NewsArticleState(nd);
}

class _NewsArticleState extends State<NewsArticle> {
  final NewsDetails nd;
  _NewsArticleState(this.nd);

  openWebview(url) async {
    if (await canLaunch(url)) {
      launch(url);
      print("Inside Open Web View");
    } else
      throw 'Can not launch';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  nd.title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network("${nd.urlToImage}"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  nd.description,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  nd.content,
                  style: TextStyle(
                    wordSpacing: 2,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  openWebview(nd.url);
                },
                child: Text(
                  'View Full Article', //title
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center, //aligment
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
