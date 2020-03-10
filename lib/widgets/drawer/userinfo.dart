import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/models/user.dart';
import 'package:travel_app/screens/userprofilescreen.dart';
import 'package:travel_app/services/auth.dart';
import 'package:travel_app/widgets/circularimageview/circularimageview.dart';

class UserInfo extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return Container(
      child: Column(
        children: [
          Stack(
            children: [
            Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(90, 60, 200, 1),
                  Colors.deepPurple
                ], 
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1 - MediaQuery.of(context).size.width * 0.1,
              left: 20.0
              ),
            child: GestureDetector(
              child: Hero(
                  tag: 'userProfilePicHero',
                  child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.1,
                  backgroundImage: NetworkImage('https://www.nationalgeographic.com/content/dam/animals/thumbs/rights-exempt/mammals/r/raccoon_thumb.ngsversion.1485815402351.adapt.1900.1.JPG')

                ),
              ),
              onTap: () {
                Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => UserProfileScreen())
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.075,
              left: 40.0 + MediaQuery.of(context).size.width * 0.2,
              ),
            child: Text(
              user.userid,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ]),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            child: RaisedButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(
                FontAwesomeIcons.signOutAlt,
                color: Colors.white,
              ),
              label: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white
                )
              ),
              color: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15)
                )
              )
            ),
          ),
        ],
      )
    );
  }
}