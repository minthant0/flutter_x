import 'package:flutter/material.dart';

class ComeSoonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: Text('Coming Soon...'),),
    );
  }

  static void show(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => ComeSoonPage()));
  }
}


