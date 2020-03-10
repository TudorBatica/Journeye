import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/models/user.dart';
import 'package:travel_app/screens/feedscreen.dart';
import 'package:travel_app/screens/most_popular/mostpopular.dart';
import 'package:travel_app/services/auth.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: PageSelector()
      ), 
    );
  }
}

class PageSelector extends StatefulWidget {
  @override
  _PageSelectorState createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {

  int _pageIndex = 0;

  final List<Widget> _pages = [
    MostPopularScreen(),
    FeedScreen(),
    Scaffold()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],

      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _pageIndex,
        items: 
        [
          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.fireAlt),
            title: Text('Hot'),
            textAlign: TextAlign.center,
            activeColor: Colors.deepPurple[800],
            inactiveColor: Colors.deepPurple[800],
            
          ),
          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.images), 
            title: Text('Journeys'),
            textAlign: TextAlign.center,
            activeColor: Colors.deepPurple[800],
            inactiveColor: Colors.deepPurple[800]
          ),
          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.dollarSign), 
            title: Text('Deals'),
            textAlign: TextAlign.center,
            activeColor: Colors.deepPurple[800],
            inactiveColor: Colors.deepPurple[800]
          )
        ], 
        onItemSelected:(index){ 
          setState(() => _pageIndex = index);
        },
        itemCornerRadius: 100.0,
        backgroundColor: Colors.white,
        showElevation: true,
        animationDuration: Duration(milliseconds: 150),
      ),
    );
  }
}
