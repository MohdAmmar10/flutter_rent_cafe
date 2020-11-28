import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rent_cafe/HomePage.dart';
import 'package:rent_cafe/ListingPage.dart';
import 'package:rent_cafe/Login.dart';
import 'package:rent_cafe/ProfilePage.dart';
import 'package:rent_cafe/SavedPage.dart';
import 'package:rent_cafe/Signup.dart';
import 'package:rent_cafe/Welcome.dart';
class MyBottomNav extends StatefulWidget {
  final uname;
  MyBottomNav({Key key, @required this.uname}) : super(key: key);
  _MyBottomNavState createState() => _MyBottomNavState(uname: "$uname");
}

class _MyBottomNavState extends State<MyBottomNav> {
  int _currentIndex=0;
  final uname;
  _MyBottomNavState({ @required this.uname}) ;
  // final List<Widget> _children = [
    
  //   HomePage(),
  //   SavedPage(),
  //   ListingPage(),
  //   ProfielPage(uname: "$uname")
  // ];
  
  Widget getPage(int index,uname) {
    if (index == 0) {
      return HomePage(uname: "$uname");
    }
    if (index == 1) {
      return SavedPage(uname: "$uname");
    }
    if (index == 2) {
      return ListingPage(uname: "$uname");
    }
    if (index == 3) {
      return ProfielPage(uname: "$uname");
    }
    
    // A fallback, in this case just PageOne
    return HomePage(uname: "$uname");
  }
  void onTappedBar(int index){
    setState(() {
      _currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: getPage(_currentIndex,uname),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        backgroundColor: HexColor("#d8edf0"),
        selectedItemColor: HexColor("#071A52"),
        unselectedItemColor: HexColor("#7A999F"),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: new Icon(Icons.home,size: 37),
          title: new Text("Explore",  )
          ),
          BottomNavigationBarItem(icon: new Icon(Icons.favorite,size: 37),
          title: new Text("Saved")
          ),
          BottomNavigationBarItem(icon: new Icon(Icons.featured_play_list,size: 37),
          title: new Text("My Listing")
          ),
          BottomNavigationBarItem(icon: new Icon(Icons.portrait_rounded,size: 37),
          title: new Text("Profile")
          ),
        ],
        ),
    );
  }
}