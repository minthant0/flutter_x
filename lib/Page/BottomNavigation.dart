

import 'package:flutter/material.dart';
import 'package:flutter_x/Page/CardView.dart';
import 'package:flutter_x/Page/DrawerNavigation.dart';
import 'package:flutter_x/Page/RetrofitPage.dart';
import 'package:flutter_x/Page/come_soon_page.dart';

class BottomNavigationPage extends StatefulWidget{

  @override
  BottomNavigationPageState createState() => BottomNavigationPageState();
}
class BottomNavigationPageState extends State<BottomNavigationPage>{

  bool isHome = true;
  int _selectedIndex = 0;



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _selectedPage() {
    switch (_selectedIndex) {
      case 0:
        return ComeSoonPage();
        break;
      case 1:
        return RetrofitPage();
        break;
      case 2:
        return CardView();
        break;
      case 3:
        return ProfileView();
        break;
    }
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      unselectedIconTheme: Theme.of(context).iconTheme ,
      elevation: 4,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          title: Text('Favorite'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black54,
      onTap: _onItemTapped,
    );
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        bottomNavigationBar: _buildBottomNavigationBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                switchInCurve: Curves.easeInToLinear,
                switchOutCurve: Curves.easeOutBack,
                child: _selectedPage(),
              ),
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }


}


class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text('Min Thant Tun!!!'),
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
