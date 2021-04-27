import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ProductBox.dart';

class CardView extends StatelessWidget{
  var card_data = [
    ProductBox(
        name: "iPhone",
        description: "iPhone is the stylist phone ever",
        price: 1000,
        image: "app-icon.png"),
    ProductBox(
        name: "Pixel",
        description: "Pixel is the most featureful phone ever",
        price: 800,
        image: "cdm.png"),
    ProductBox(
        name: "Laptop",
        description: "Laptop is most productive development tool",
        price: 2000,
        image: "check_green_icon.png"),
    ProductBox(
        name: "Tablet",
        description: "Tablet is the most useful device ever for meeting",
        price: 1500,
        image: "current_location_icon.png"),
    ProductBox(
        name: "Pendrive",
        description: "Pendrive is useful storage medium",
        price: 100,
        image: "phone_green_circle.png"),
  ];
  @override
  Widget build(BuildContext context) {


    return new MaterialApp(
        title: "Home Screen",
        theme: new ThemeData(
            primaryColor: Colors.blue,
            primarySwatch: Colors.blue,
            accentColor: Colors.red),
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text(
                "FlutterX",
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),

            body: ListView.builder(
              /*shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),*/
              itemCount: card_data.length,
              itemBuilder: (BuildContext context, int position) {

                return Container(
                    padding: EdgeInsets.all(3),
                    height: 120,
                    child: Card(
                        child: new InkWell(
                            onTap: (){
                              _showDialog(context,data: card_data[position]);
                              /*Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) => DetailScreen(todo: todos[index]),
                             ),
                           );*/
                            },

                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset("assets/" + card_data[position].image),
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Text(card_data[position].name,
                                                  style: TextStyle(fontWeight: FontWeight.bold)),
                                              Text(card_data[position].description),
                                              Text("Price: " + card_data[position].price.toString()),
                                            ],
                                          )))
                                ]))));
              },
            ))
    );

    throw UnimplementedError();
  }
  void _showDialog(BuildContext context, {ProductBox data}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(data.name),
          content: new Text(data.description),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}