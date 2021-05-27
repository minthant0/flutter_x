
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:trust_fall/trust_fall.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:trust_location/trust_location.dart';

class TrustLocationPage extends StatefulWidget{

  @override
  TrustLocationPageState createState() => TrustLocationPageState();

}

class TrustLocationPageState extends State<TrustLocationPage>{

  String _platformVersion = 'Unknown';
  bool isJailBroken = false;
  bool canMockLocation = false;
  bool isRealDevice = true;
  bool isOnExternalStorage = false;
  bool isTrustFall = false;


  String _latitude;
  String _longitude;
  bool isMockLocation;


  @override
  void initState() {
    super.initState();
    print('MockLocation>>>>');
    requestLocationPermission();
    TrustLocation.start(5);
    initPlatformState();


  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
//    String platformVersion;

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // Platform messages may fail, so we use a try/catch PlatformException.ßß
    try{
      isJailBroken = await TrustFall.isJailBroken;
      canMockLocation = await TrustFall.canMockLocation;
      print('Bool Mock>>>> $canMockLocation');
      isRealDevice = await TrustFall.isRealDevice;
      isOnExternalStorage = await TrustFall.isOnExternalStorage;
      isTrustFall = await TrustFall.isTrustFall;
      isMockLocation = await TrustLocation.isMockLocation;
      print('Mock Location>>> $isMockLocation');
    }catch(error){
      print(error);
    }

    setState(() {
      isJailBroken = isJailBroken;
      canMockLocation = canMockLocation;
      isRealDevice = isRealDevice;
      isOnExternalStorage = isOnExternalStorage;
      isTrustFall = isTrustFall;
    });
  }

  /// get location method, use a try/catch PlatformException.
 /* Future<void> getLocation() async {
    try {
      TrustLocation.onChange.listen((values) => setState(() {
        _latitude = values.latitude;
        _longitude = values.longitude;
        _isMockLocation = values.isMockLocation;
      }));
    } on PlatformException catch (e) {
      print('PlatformException $e');
    }
  }*/

  /// request location permission at runtime.
  void requestLocationPermission() async {
    PermissionStatus permission =
    await LocationPermissions().requestPermissions();
    print('permissions: $permission');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Trust Location"),),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children:<Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('isJailBroken():'),
                    SizedBox(
                      width: 8,
                    ),
                    Text('${isJailBroken ? "Yes" : "No"}', style: TextStyle(fontWeight: FontWeight.w600),),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('canMockLocation():'),
                    SizedBox(
                      width: 8,
                    ),
                    Text('${canMockLocation ? "Yes" : "No"}', style: TextStyle(fontWeight: FontWeight.w600),),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('isRealDevice():'),
                    SizedBox(
                      width: 8,
                    ),
                    Text('${isRealDevice ? "Yes" : "No"}', style: TextStyle(fontWeight: FontWeight.w600),),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('isOnExternalStorage():'),
                    SizedBox(
                      width: 8,
                    ),
                    Text('${isOnExternalStorage ? "Yes" : "No"}', style: TextStyle(fontWeight: FontWeight.w600),),
                  ],
                ),SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('isTrustFall():'),
                    SizedBox(
                      width: 8,
                    ),
                    Text('${isTrustFall ? "Yes" : "False"}', style: TextStyle(fontWeight: FontWeight.w600),),
                  ],
                ),
              ] ,
            ),

          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

}


