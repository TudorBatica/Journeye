import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/screens/authenticatescreen.dart';

//*this widget appears at the top of
//*the drawer, when there is no user
//*signed in

class GoToAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logofinal1.png'),
                radius: MediaQuery.of(context).size.width * 0.1,
              ),
          ),
          ]),

          SizedBox(height: 10),
          RaisedButton.icon(
            onPressed:() { 
              Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => AuthenticateScreen(initialScreenIndex: 0))
              );
            },
            icon: Icon(
              FontAwesomeIcons.signInAlt,
              color: Colors.white,
            ),
            label: Text(
              ' Authenticate',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            color: Colors.deepPurple,
             shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15)
              )
            )
            ),
        ]
      ),
    );
  }
}