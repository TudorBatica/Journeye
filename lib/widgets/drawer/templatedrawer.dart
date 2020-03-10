import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/drawer/drawerauth.dart';

//* This is the drawer used throughout the
//* aplication; consists of 2 parts:
//* the top part displays user information or
//* lets the user go to the sign in/register screen
//* the second part is the settings part

class TemplateDrawer extends StatefulWidget {
  @override
  _TemplateDrawerState createState() => _TemplateDrawerState();
}

class _TemplateDrawerState extends State<TemplateDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          DrawerAuth() 
        ]
      ),
    );
  }
}