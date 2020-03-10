import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:travel_app/screens/registerscreen.dart';
import 'package:travel_app/screens/signinscreen.dart';

class AuthenticateScreen extends StatefulWidget {

  final int initialScreenIndex;

  AuthenticateScreen({ Key key, this.initialScreenIndex});

  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 50,
          title: Text(
            'Authenticate'
          ),
          centerTitle: true,
          bottom: TabBar(
            
            indicatorColor: Colors.white,
            indicatorWeight: 3.0,
            isScrollable: true,
            tabs:[
              Tab(
                text: 'Sign in',
                icon: Icon(FontAwesome5.user)
              ),
              Tab(
                text: 'Register',
                icon: Icon(FontAwesome.user_plus)
              )
            ]
          ),
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(100, 100),
              bottomRight: Radius.elliptical(100, 100),
            )
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(80, 60, 200, 1),
                  Colors.deepPurple
                ]
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(100, 100),
                bottomRight: Radius.elliptical(100, 100),
              )
            ),
          ), 
          backgroundColor: Color.fromRGBO(80, 60, 200, 1),
        ),
        body: TabBarView(
          children: <Widget>[
            SignInScreen(),
            RegisterScreen()
          ],
        ),
      )
    );
  }
}