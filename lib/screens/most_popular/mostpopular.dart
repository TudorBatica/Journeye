
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:travel_app/widgets/drawer/templatedrawer.dart';
import 'package:travel_app/widgets/hotdestinations.dart';
import 'package:travel_app/widgets/hotsecret.dart';
import 'package:travel_app/widgets/mostpopulartitle.dart';


//* Most Popular Screen
//* Displays most popular secret locations stories
//* And most popular destinations

class MostPopularScreen extends StatefulWidget {
  @override
  _MostPopularScreenState createState() => _MostPopularScreenState();
}

class _MostPopularScreenState extends State<MostPopularScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Tooltip(
          child:
            Icon(
            FontAwesomeIcons.hotjar,
            color: Colors.deepPurple,
            ),
          message: 'Most popular destinations and secret trip stories',
          ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.deepPurple),
      ),
      drawer: Drawer(
        child: TemplateDrawer(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          MostPopularScreenTitle(
            mainTitle1: 'Secret',
            icon: Icon(FontAwesomeIcons.questionCircle, color: Colors.deepPurple),
            mainTitle2: 'Places',
            subTitle: 'Great journeys in undisclosed locations',
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          HotSecretTrips(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          MostPopularScreenTitle(
            mainTitle1: 'Popular',
            mainTitle2: 'Destinations',
            icon: Icon(FontAwesomeIcons.plane, color: Colors.deepPurple),
            subTitle: 'Most adventures lead here',
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          HotDestinationsContainer()
        ],
      ),
      
    );
  }
}