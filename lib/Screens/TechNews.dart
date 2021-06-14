import 'NewsDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TechNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tech(),
    );
  }
}

class Tech extends StatefulWidget {
  @override
  _TechState createState() => _TechState();
}

class _TechState extends State<Tech> with AutomaticKeepAliveClientMixin {
  String apiKey = 'e452f52f81984a5f82e6645572903d4d';
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
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("Country") == null) {
      prefs.setString("Country", "IN");
    }
    response = await http.get(Uri.parse(
        ("https://newsapi.org/v2/top-headlines?country=" +
            prefs.getString("Country") +
            "&category=technology&language=en&apiKey=" +
            apiKey)));
    var data = jsonDecode(response.body);
    response = data;
    if (data['status'] == "ok") {
      if (mounted)
        setState(() {
          print(prefs.getString("Country"));
          print("Inside setstate");
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // return Container();
    return RefreshIndicator(
      child: response != null
          ? response["articles"].length != 0
              ? ListView.builder(
                  itemCount: response["articles"].length,
                  itemBuilder: (context, index) {
                    nsd = NewsDetails.fromJson(response["articles"][index]);
                    return InkWell(
                        onTap: () {
                          openWebview(index);
                        },
                        child: Card(
                            child: nsd.urlToImage != null && nsd.title != null
                                ? Container(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                              "${nsd.urlToImage}"),
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
              : Center(
                  child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                      child: Icon(
                        Icons.speaker_notes_off,
                        size: 170,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text(
                        "Sorry.. No Articles Found",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 23.0,
                            fontFamily: 'Robosto',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                      ),
                    )
                  ],
                ))
          : Center(child: CircularProgressIndicator()),
      onRefresh: () {
        return Future.delayed(Duration(milliseconds: 500), () {
          setState(() {
            fetchNews();
            print("Inside Refresh");
          });
        });
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
