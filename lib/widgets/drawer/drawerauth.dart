import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/models/user.dart';
import 'package:travel_app/widgets/drawer/gotoauth.dart';
import 'package:travel_app/widgets/drawer/userinfo.dart';

//* this widget pushes onto the drawer 
//* either the user's profile(if a user is signed in),
//* either a menu that enables the user to sign in / register

class DrawerAuth extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    if(user == null) {
      return GoToAuth();
    } else {
      return UserInfo();
    }
    
  }
}