import 'package:flutter/material.dart';
import 'package:test/test.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My App')),
      body: Center(
        child: OutlinedButton(
          child: Text('Open Dialog'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return MyDialog();
              },
            );
          },
        ),
      ),
    );
  }
}
