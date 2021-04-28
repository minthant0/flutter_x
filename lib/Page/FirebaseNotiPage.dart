import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotiPage extends StatefulWidget{

  @override
  FirebaseNotiPageState createState() => FirebaseNotiPageState();
}
class FirebaseNotiPageState extends State<FirebaseNotiPage>{
  String message = 'Firebase message will show up here';
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;


  void _showNotification() async {
    await notificationSchedule();
  }


  @override
  void initState() {
    super.initState();
    initializing();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
        _setMessageText(message.toString());
         displayNotification(message);

      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );

    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));

    _firebaseMessaging.getToken().then((token) {
      print(token);
    });
  }

  _setMessageText(String text) {
    setState(() {
      message = text;
    });
  }

  Future<void> notificationSchedule() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your other channel id',
        'your other channel name',
        'your other channel description');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0,
        'Hi there',
        'Subscibe my youtube channel',
        // scheduledNotificationDateTime,
        platformChannelSpecifics);
  }
  _resetText() {
    _setMessageText('Firebase message will show up here');
  }

  _bodyWidget() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              message,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(

        appBar: new AppBar(
          title: new Text("Firebase Notification"),
        ),
        body: _bodyWidget(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.notifications),
          onPressed: () {
            _showNotification();
          },
        ),
      ),
    );
    throw UnimplementedError();
  }


  void initializing() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher'); // <- default icon name is @mipmap/ic_launcher
    var initializationSettingsIOS = IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);

  }


  Future onSelectNotification(String payLoad) {
    if (payLoad != null) {
      debugPrint("$payLoad");
    }
    print("Notification Tab");
// If we tab in the notification we can set the nagivator to navigate to the next page,
  }
  Future onDidReceiveLocalNotification(
      int id, String title, String body, String paload) async {
    return showDialog(
        context: context,
        builder: (
            BuildContext context,
            ) =>
            CupertinoAlertDialog(
              title: Text(title),
              content: Text(body),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("Okay"),
                  onPressed: () {
                    // naviagate to desire page
                  },
                )
              ],
            ));

  }

  Future displayNotification(Map<String, dynamic> message) async{
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        '320952640886', 'fcm', 'flutter_x',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      message['notification']['title'],
      message['notification']['body'],
      platformChannelSpecifics,
      payload: 'fcm',);
  }




}
