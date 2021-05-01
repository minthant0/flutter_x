import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_x/Note/NotePage.dart';
import 'package:flutter_x/Page/BottomNavigation.dart';
import 'package:flutter_x/Page/CardView.dart';
import 'package:flutter_x/Page/CarouselSlider.dart';
import 'package:flutter_x/Page/CollapsingToolbarPage.dart';
import 'package:flutter_x/Page/DrawerNavigation.dart';
import 'package:flutter_x/Page/FIrebaseOtpPage.dart';
import 'package:flutter_x/Page/FacebookLoginPage.dart';
import 'package:flutter_x/Page/FirebaseNotiPage.dart';
import 'package:flutter_x/Page/ImageUpload.dart';
import 'package:flutter_x/Page/Login.dart';
import 'package:flutter_x/Obj/CardData.dart';
import 'package:flutter_x/Page/LoginRegisterPage.dart';
import 'package:flutter_x/Page/LoginUi.dart';
import 'package:flutter_x/Page/RetrofitPage.dart';
import 'package:flutter_x/Page/SharedPreference.dart';
import 'package:flutter_x/Page/google_map_picker.dart';
import 'package:flutter_x/phone_auth/get_phone.dart';

import 'Page/ProductBox.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var text = ["Card View","Login UI","Retrofit API","Shared Preference","Image Upload","Login and Register",
               "CollapsingToolbar","Facebook Login","Firebase Notification","Firebase OTP","Google Map Picker",
                "Sqlite Note","Drawer Navigation","Bottom Navigation","Image Slider"];


  @override
  void initState() {
    super.initState();

  }


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
              itemCount: text.length,
              itemBuilder: (BuildContext context, int position) {

                 return Container(
                     padding: EdgeInsets.all(3),
                     height: 100,
                     child: Card(
                       child: new InkWell(
                         onTap: (){
                           if(position==0){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => CardView()),
                             );
                           }else if(position==1){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => LoginUiPage()),
                             );
                           }else if(position==2){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => RetrofitPage()),
                             );
                           }else if(position==3){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => SharedPreferencePage()),
                             );
                           }else if(position==4){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => ImageUploadPage()),
                             );
                           }else if(position==5){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => LoginRegisterPage()),
                             );
                           }else if(position==6){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => CollapsingToolbarPage()),
                             );
                           }else if(position==7){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => FacebookLoginPage()),
                             );
                           }else if(position==8){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => FirebaseNotiPage()),
                             );
                           }else if(position==9){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => FirebaseOtpPage()),
                             );
                           }else if(position==10){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => GoogleMapPickerPage()),
                             );
                           }else if(position==11){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => NotePage()),
                             );
                           }else if(position==12){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => DrawerNavigationPage()),
                             );
                           }else if(position==13){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => BottomNavigationPage()),
                             );
                           }else if(position==14){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => CarouselSliderPage()),
                             );
                           }
                         },
                         child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: <Widget>[
                               Text(text[position],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                             ]))));
               },
            ))
    );
  }


}
