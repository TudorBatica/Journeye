import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/widgets/drawer/templatedrawer.dart';



class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Icon(FontAwesome.suitcase),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: TemplateDrawer()
      ),
      floatingActionButton: 
        FloatingActionButton(
          onPressed: (){},
          backgroundColor: Colors.white,
          child: Icon(
            FontAwesome.plus,
            color: Colors.deepPurple,
          ),
          
        ),
    );
  }
}