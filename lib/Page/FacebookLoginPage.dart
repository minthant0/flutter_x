import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookLoginPage extends StatefulWidget{

  @override
  FacebookLoginPageState createState() => FacebookLoginPageState();
}
class FacebookLoginPageState extends State<FacebookLoginPage>{

  bool _isLoggedIn = false;
  Map _userObj = {};


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          title: Text("Facebook Login"),
        ),
        body: Container(
          child: _isLoggedIn
              ? Column(
            children: [
              Image.network(_userObj["picture"]["data"]["url"]),
              Text(_userObj["name"]),
              Text(_userObj["email"]),
              TextButton(
                  onPressed: () {
                    FacebookAuth.instance.logOut().then((value) {
                      setState(() {
                        _isLoggedIn = false;
                        _userObj = {};
                      });
                    });
                  },
                  child: Text("Logout"))
            ],
          )
              : Center(
            child: ElevatedButton(
              child: Text("Login with Facebook"),
              onPressed: () async {
                FacebookAuth.instance.login(
                    permissions: ["public_profile", "email"]).then((value) {
                  FacebookAuth.instance.getUserData().then((userData) {
                    setState(() {
                      _isLoggedIn = true;
                      _userObj = userData;
                    });
                  });
                });
              },
            ),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }


}

