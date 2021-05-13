import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{

  @override
  LoginPageState createState() => LoginPageState();
  
}

class LoginPageState extends State<LoginPage>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.only(left: 7.0, right: 7.0, top: 180.0),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                elevation: 2,
                // margin: EdgeInsets.all(19),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('User Login Form',
                              style: TextStyle(fontSize: 21))),
                      Divider(),

                      Container(
                          margin: EdgeInsets.all(20),
                          child: TextField(
                           /* controller: emailController,
                            onChanged: (value) {
                              _myPreferences.user = value;
                              _myPreferences.commit();
                            },*/
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                            ),
                          )
                      ),
                      Container(
                          margin: EdgeInsets.all(20),
                          child: TextField(
                           /* controller: passwordController,
                            onChanged: (value) {
                              _myPreferences.password = value;
                              _myPreferences.commit();
                            },*/
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User password',
                            ),
                          )
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),),
                          // Divider(),

                          RaisedButton(
                           // onPressed: userLogin,
                            color: Colors.amberAccent,
                            textColor: Colors.white,
                            padding: EdgeInsets.fromLTRB(100, 18, 100, 18),
                            child: Text('Click Here To Login'),

                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),),
                          //  Divider(),
                          FlatButton(
                            textColor: Colors.black,
                            padding: EdgeInsets.fromLTRB(100, 18, 100, 18),
                            onPressed: () {
                             /* Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterUser()
                              ),);*/
                            },
                            child: Text("New User click here",
                            ),
                          ),


                        ],
                      ),
                      Visibility(
                         // visible: visible,
                          child: Container(
                              margin: EdgeInsets.only(bottom: 30),
                              child: CircularProgressIndicator()
                          )
                      ),
                    ],
                  ),
                )
            )

        ),
      ),
    );
    throw UnimplementedError();
  }

}

