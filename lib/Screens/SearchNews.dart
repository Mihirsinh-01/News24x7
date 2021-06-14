import 'package:flutter/material.dart';
// import 'package:floating_search_bar/floating_search_bar.dart';

class SearchNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title: Text('Get Text Field Value')),
            body: Center(child: GetTextFieldValue())));
  }
}

class GetTextFieldValue extends StatefulWidget {
  _TextFieldValueState createState() => _TextFieldValueState();
}

class _TextFieldValueState extends State<GetTextFieldValue> {
  final textFieldValueHolder = TextEditingController();

  String result = '';

  getTextInputData() {
    setState(() {
      result = textFieldValueHolder.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: textFieldValueHolder,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Enter Some Text Here'),
              )),
          RaisedButton(
            onPressed: getTextInputData,
            color: Colors.blue,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text('Click Here To Get Text Field Entered Data'),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Entered Text is = $result",
                  style: TextStyle(fontSize: 20)))
        ],
      ),
    ));
  }
}
