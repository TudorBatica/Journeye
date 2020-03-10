import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.deepPurple, Color.fromRGBO(80, 60, 200, 1)]
                    ),
                  ),
                ),  
              ),
              Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.05
                    ),
                  child: Hero(
                    tag: 'userProfilePicHero',
                    child: Card(
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.20,
                        backgroundImage: NetworkImage('https://www.nationalgeographic.com/content/dam/animals/thumbs/rights-exempt/mammals/r/raccoon_thumb.ngsversion.1485815402351.adapt.1900.1.JPG')
                        ),
                      elevation: 10.0,
                      shape: CircleBorder(),
                    ),
                  ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.5,
                  top: MediaQuery.of(context).size.height * 0.075
                ),
                child: Text(
                  'Crazy Raccoon User',
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2,
                  left: MediaQuery.of(context).size.width * 0.5
                ),
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                         BoxShadow(
                           color: Colors.grey, 
                           blurRadius: 1.0,
                           offset: Offset(2.0, 2.0),
                        )
                          
                        ]
                      ),
                
                child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.065,
                      child: Icon(
                        Icons.notifications_active,
                        color: Colors.deepPurple
                      ),
                      //TODO implement notifications
                    ),
                    onTap: () {print('notifications');},
                  ),
                  GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Icon(
                        Icons.share,
                        color: Colors.deepPurple
                      ),
                      //TODO implement share 
                    ),
                  ),
                ]
              ),)
              ]
            ),
            Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                    left: 10.0,
                    right: 10.0
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: '" ',
                      style: TextStyle(color: Colors.deepPurple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                      ),
                    children: [
                      TextSpan(
                      text: 'Hi there! This is the default description. I am a raccoon. Welcome to my profile',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black54
                        )
                      ),
                    TextSpan(
                      text: ' "',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                        ), 
                    )
                    ],
                    )
                  ),
                )
            ),
            SizedBox(height: 50),
            RichText(
              text: TextSpan(
                text: 'Crazy Raccoon\'s Journeys',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                )
              ),
              textAlign: TextAlign.left,
            )
          ],
          
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height * 0.7);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height * 0.7);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, 
                          firstEndPoint.dx, firstEndPoint.dy);
    
    var secondControlPoint = 
                    Offset(size.width - (size.width / 3.6), size.height * 0.5);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, 
                          secondEndPoint.dx, secondEndPoint.dy);
    
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}