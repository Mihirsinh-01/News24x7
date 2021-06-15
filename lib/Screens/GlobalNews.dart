import 'NewsDetails.dart';
import 'NewsArticle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class GlobalNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Global(),
    );
  }
}

class Global extends StatefulWidget {
  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  // String apiKey = 'e452f52f81984a5f82e6645572903d4d';
  String apiKey = 'c8fdb18f039e4c12a7fa4cede6bd7d87';
  // Autogenerated a;
  var response;
  NewsDetails nsd;
  List<NewsDetails> news = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    response = await http.get(Uri.parse(
        ("https://newsapi.org/v2/everything?q=global&language=en&apiKey=" +
            apiKey)));
    var data = jsonDecode(response.body);
    response = data;
    if (data['status'] == "ok") {
      if (mounted)
        setState(() {
          print("inside setstate");
        });
    } else {
      throw Exception();
    }
  }

  openWebview(index) async {
    String url = NewsDetails.fromJson(response["articles"][index]).url;
    if (await canLaunch(url)) {
      launch(url);
      print("Inside Open Web View");
    } else
      throw 'Can not launch';
  }

  openNewPage(index) {
    print("Opening New Page");
    NewsDetails nwd = NewsDetails.fromJson(response["articles"][index]);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return NewsArticle(nwd);
    }));
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Image.asset('icons/flags/png/de.png', package: 'country_icons'),
    // );
    return RefreshIndicator(
      child: response != null
          ? ListView.builder(
              itemCount: response["articles"].length,
              itemBuilder: (context, index) {
                nsd = NewsDetails.fromJson(response["articles"][index]);
                return InkWell(
                    onTap: () {
                      // openWebview(index);
                      openNewPage(index);
                    },
                    child: Card(
                        // elevation: 10,
                        child: nsd.urlToImage != null && nsd.title != null
                            ? Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network("${nsd.urlToImage}"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                    ),
                                    Text(
                                      "${nsd.title}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                    ),
                                    Text("${nsd.description}"),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                    ),
                                  ],
                                ),
                              )
                            : Container()));
              },
            )
          : Center(child: CircularProgressIndicator()),
      onRefresh: () {
        return Future.delayed(Duration(seconds: 1), () {
          setState(() {
            print("Inside Refresh");
          });
        });
      },
    );
  }
}
