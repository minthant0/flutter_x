
import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget{

  @override
  DialogPageState createState() => DialogPageState();

}

class DialogPageState extends State<DialogPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Custom Dialog"),),
      body: Center(
        child: RaisedButton(
          child: Text('Simple Alert Dialog'),
          onPressed: () {
            showDialog(context: context,
                builder: (BuildContext context) {
                  return AdvanceCustomAlert();
                });
          },),
      ),
    );
    throw UnimplementedError();
  }

}

class AdvanceCustomAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text('Warning !!!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 5,),
                    Text('You can not access this file', style: TextStyle(fontSize: 20),),
                    SizedBox(height: 20,),
                    RaisedButton(onPressed: () {
                      Navigator.of(context).pop();
                    },
                      color: Colors.redAccent,
                      child: Text('Okay', style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -45,
                child: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  radius: 45,
                  child: Icon(Icons.assistant_photo, color: Colors.white, size: 50,),
                )
            ),
          ],
        )
    );
  }
}