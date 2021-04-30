import 'package:flutter/material.dart';

class DrawerNavigationPage extends StatefulWidget{

  @override
  DrawerNavigationPageState createState() => DrawerNavigationPageState();
}
class DrawerNavigationPageState extends State<DrawerNavigationPage>{

  int _counter=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Drawer Navigation"),
        ),
        drawer: InkWellDrawer(),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

}


class InkWellDrawer extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.lightBlue,
                    Colors.blue
                  ])
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Padding(padding: EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/drawerHeader.png", height: 90, width: 90),
                      ),
                    ),
                    Text('Flutter', style: TextStyle(color: Colors.white, fontSize: 25.0),)
                  ],
                ),
              )),
          CustomListTile(Icons.person, 'Profile', ()=>{
            Navigator.pop(ctxt),
            Navigator.push(ctxt,
                new MaterialPageRoute(builder: (ctxt) => new DrawerNavigationPage())
            )
          }),
          CustomListTile(Icons.notifications, 'Notification', ()=>{
            Navigator.pop(ctxt),
            Navigator.push(ctxt,
                new MaterialPageRoute(builder: (ctxt) => new NotificationView())
            )
          }),
          CustomListTile(Icons.settings, 'Settings', ()=>{}),
          CustomListTile(Icons.lock, 'Log Out', ()=>{}),
        ],

      ),
    );
  }
}

class CustomListTile extends StatelessWidget{

  final IconData icon;
  final  String text;
  final Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context){
    //ToDO
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child:Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))
        ),
        child: InkWell(
            splashColor: Colors.orangeAccent,
            onTap: onTap,
            child: Container(
                height: 40,
                child: Row(
                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Icon(icon),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                      ),
                      Text(text, style: TextStyle(
                          fontSize: 16
                      ),),
                    ],),
                    Icon(Icons.arrow_right)
                  ],)
            )
        ),
      ),
    );
  }
}




class NotificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: InkWellDrawer(),
      appBar: new AppBar(title: new Text("Notifications"),),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                    height: 130.0,
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("assets/app-icon.png"),
                      ) ,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              children: <Widget>[
                Text('Hello Bhupesh!!!'),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 22.0, left: 42.0, right: 42.0),
                  child: Center(child: Text('Welcome to your Notification View!!!')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: InkWellDrawer(),
      appBar: new AppBar(title: new Text("Profile"),),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                    height: 130.0,
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/firebase.png"),
                      ) ,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              children: <Widget>[
                Text('Hello Bhupesh!!!'),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 22.0, left: 42.0, right: 42.0),
                  child: Center(child: Text('Welcome to your Profile, Although, you do not have much to say in your profile apart from your cool image!!!')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - (size.width / 4),
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
