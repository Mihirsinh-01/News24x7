import 'package:flutter/material.dart';
// import 'package:floating_search_bar/floating_search_bar.dart';

class SearchNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetTextFieldValue(),
    );
  }
}

class GetTextFieldValue extends StatefulWidget {
  _TextFieldValueState createState() => _TextFieldValueState();
}

class _TextFieldValueState extends State<GetTextFieldValue> {
  final textFieldValueHolder = TextEditingController();

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      flexibleSpace: Row(children: <Widget>[
        SizedBox(height: 200),
        SizedBox(width: 20),
        Icon(Icons.search),
        SizedBox(width: 20),
        SizedBox(
            width: 150,
            child: TextField(
              controller: textFieldValueHolder,
              autocorrect: true,
              decoration: InputDecoration(hintText: 'Enter Some Text Here'),
            )),
      ]),
    );
  }

  String result = '';

  getTextInputData() {
    setState(() {
      result = textFieldValueHolder.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildBar(context),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.left,
            children: <Widget>[
              Container(

                  // width: MediaQuery.of(context).size.width,
                  // padding: EdgeInsets.all(5.0),
                  // child: Row(children: <Widget>[
                  //   SizedBox(width:20),
                  //   Icon(Icons.search),
                  //   SizedBox(width:20),
                  //   SizedBox(width: 200, child: TextField(controller: textFieldValueHolder,
                  //     autocorrect: true,
                  //     decoration: InputDecoration(hintText: 'Enter Some Text Here'),)),

                  // ]),
                  ),
              RaisedButton(
                onPressed: getTextInputData,
                color: Colors.blue,
                textColor: Colors.white,
                // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text('Click Here To Get Text Field Entered Data'),
              ),
              Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text("Entered Text is = $result",
                      style: TextStyle(fontSize: 20)))
            ],
          ),
        ));
  }
}
