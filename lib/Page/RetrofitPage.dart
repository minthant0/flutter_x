import 'package:connectivity/connectivity.dart';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/post_api_service.dart';

class RetrofitPage extends StatefulWidget{
  RetrofitPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  RetrofitPageState createState() => RetrofitPageState();

}

class RetrofitPageState extends State<RetrofitPage> {
  var connectionStatus;
  var _scafoldkey = GlobalKey<ScaffoldState>();

  void Call_API() {
    setState(() {
      build_api(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scafoldkey,
      appBar: new AppBar(
        title: new Text(
          "Retrofit",
          style: new TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ConnectivityWidget(
          onlineCallback: Call_API,
          builder: (context, isOnline)  => Center(
            child: build_api(context),
          ),
        ),

      ),
    );
  }

}

FutureBuilder<List<Post>> build_api(BuildContext context) {
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder<List<Post>>(
    future: client.getTasks(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final List<Post> posts = snapshot.data;
        if(snapshot.data!=null){
          return _buildPosts(context, posts);
        }else{
          return Center(
           // child: CircularProgressIndicator(),
          );
        }
      }else{
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}
ListView _buildPosts(BuildContext context, List<Post> posts) {
  return ListView.builder(
    itemCount: posts.length,
    padding: EdgeInsets.all(8),
    itemBuilder: (context, index) {
      print(posts[index].avatar);
      return Container(

          padding: EdgeInsets.all(3),
          height: 120,
          child: Card(
              child: new InkWell(
                  onTap: (){

                  },

                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: <Widget>[
                        // Image.network(posts[index].avatar),
                        Image.network('https://picsum.photos/250?image=9'),

                        Expanded(
                            child: Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(posts[index].name,
                                        style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text(posts[index].email),
                                    /*Text("Price: " + card_data[position].price.toString()),*/
                                  ],
                                )))

                      ]))));

    },
  );
}




/*

Future<bool> isInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    // I am connected to a mobile network, make sure there is actually a net connection.
    if (await DataConnectionChecker().hasConnection) {
      // Mobile data detected & internet connection confirmed.
      return true;
    } else {
      // Mobile data detected but no internet connection found.
      return false;
    }
  } else if (connectivityResult == ConnectivityResult.wifi) {
    // I am connected to a WIFI network, make sure there is actually a net connection.
    if (await DataConnectionChecker().hasConnection) {
      // Wifi detected & internet connection confirmed.
      return true;
    } else {
      // Wifi detected but no internet connection found.
      return false;
    }
  } else {
    // Neither mobile data or WIFI detected, not internet connection found.
    return false;
  }
}


*/
