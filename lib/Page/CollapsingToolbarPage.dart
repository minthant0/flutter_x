
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollapsingToolbarPage extends StatefulWidget{

  @override
  CollapsingToolbarPageState createState() => CollapsingToolbarPageState();
}
class CollapsingToolbarPageState extends State<CollapsingToolbarPage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.amber,
                title: Text('Kindacode.com'),
                expandedHeight: 30,
                collapsedHeight: 150,
              ),
              SliverAppBar(
                backgroundColor: Colors.green,
                title: Text('Have a nice day'),
                floating: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Card(
                      margin: EdgeInsets.all(15),
                      child: Container(
                        color: Colors.blue[100 * (index % 9 + 1)],
                        height: 80,
                        alignment: Alignment.center,
                        child: Text(
                          "Item $index",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    );
                  },
                  childCount: 1000, // 1000 list items
                ),
              ),
            ],
          )
      ),
    );
    throw UnimplementedError();
  }

}
