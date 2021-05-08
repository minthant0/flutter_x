
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InternetConditionPage extends StatefulWidget {
  InternetConditionPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  InternetConditionPageState createState() => InternetConditionPageState();
}

class InternetConditionPageState extends State<InternetConditionPage> {
  var connectionStatus;
  var _scafoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    connectionStatus = Provider.of<ConnectivityResult>(context);
    return Scaffold(
        key: _scafoldkey,
        appBar: AppBar(
          title: Text('Internet connectivity'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "You are ${(connectionStatus != ConnectivityResult.none ? 'Online' : 'Offline')}",
                style: Theme.of(context).textTheme.display1,
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                onPressed: () {
                  if (connectionStatus == ConnectivityResult.wifi ||
                      connectionStatus == ConnectivityResult.mobile) {
                    _scafoldkey.currentState.hideCurrentSnackBar();
                    _scafoldkey.currentState.showSnackBar(SnackBar(
                        content: Text(
                          ""
                              "You are online!",
                          style: TextStyle(color: Colors.red,fontSize:18.0),
                        )));
                  } else {
                    _scafoldkey.currentState.hideCurrentSnackBar();
                    _scafoldkey.currentState.showSnackBar(SnackBar(
                        content: Text(
                          ""
                              "You are offline!",
                          style: TextStyle(color: Colors.red,fontSize:18.0),
                        )));
                  }
                },
                child: Text('Check Status'),
              )
            ],
          ),
        ));
  }
}



