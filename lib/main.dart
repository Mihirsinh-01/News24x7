import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'Screens/GlobalNews.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: Icon(Icons.person_outline),
            title: Text(
              'DASHBOARD',
              style: TextStyle(fontSize: 16.0),
            ),
            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        child: Row(children: <Widget>[
                          Icon(Icons.public),
                          Text(" Global News")
                        ]),
                      ),
                      Tab(
                        child: Row(children: <Widget>[
                          Icon(Icons.trending_up),
                          Text(" Trending")
                        ]),
                      ),
                      Tab(
                        child: Row(children: <Widget>[
                          Icon(Icons.menu_book),
                          Text(" General")
                        ]),
                      ),
                      Tab(
                        child: Row(children: <Widget>[
                          Icon(Icons.movie),
                          Text(" Entertainment")
                        ]),
                      ),
                      Tab(
                        child: Row(children: <Widget>[
                          Icon(Icons.account_balance_wallet),
                          Text(" Business")
                        ]),
                      ),
                      Tab(
                        child: Row(children: <Widget>[
                          Icon(Icons.favorite),
                          Text(" Health")
                        ]),
                      ),
                      Tab(
                        child: Row(children: <Widget>[
                          Icon(Icons.school),
                          Text(" Science")
                        ]),
                      ),
                      Tab(
                        child: Row(children: <Widget>[
                          Icon(Icons.sports_cricket),
                          Text(" Sports")
                        ]),
                      ),
                      Tab(
                        child: Row(children: <Widget>[
                          Icon(Icons.tablet_mac),
                          Text(" Technology")
                        ]),
                      ),
                    ]),
                preferredSize: Size.fromHeight(30.0)),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.location_on),
                  onPressed: () {
                    showCountryPicker(
                      context: context,
                      countryFilter: <String>[
                        'AE',
                        'AR',
                        'AT',
                        'AU',
                        'BE',
                        'BG',
                        'BR',
                        'CA',
                        'CH',
                        'CN',
                        'CO',
                        'CU',
                        'CZ',
                        'DE',
                        'EG',
                        'FR',
                        'GB',
                        'GR',
                        'HK',
                        'HU',
                        'ID',
                        'IE',
                        'IL',
                        'IN',
                        'IT',
                        'JP',
                        'KR',
                        'LT',
                        'LV',
                        'MA',
                        'MX',
                        'MY',
                        'NG',
                        'NL',
                        'NO',
                        'NZ',
                        'PH',
                        'PL',
                        'PT',
                        'RO',
                        'RS',
                        'RU',
                        'SA',
                        'SE',
                        'SG',
                        'SI',
                        'SK',
                        'TH',
                        'TR',
                        'TW',
                        'UA',
                        'US',
                        'VE',
                        'ZA'
                      ],

                      showPhoneCode:
                          false, // optional. Shows phone code before the country name.
                      onSelect: (Country country) {
                        print('Select country: ${country.countryCode}');
                      },
                    );
                  })
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                child: Center(
                  child: GlobalNews(),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Ext 2'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Ext 3'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 2'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 3'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 4'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 5'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 6'),
                ),
              ),
            ],
          )),
    );
  }
}
