import 'package:flutter/material.dart';

//this widget gets the url of an image
//and display it in a circle

class CircularImageView extends StatelessWidget {

  final String imageURL;
  final double radius;

  CircularImageView({Key key, this.imageURL, this.radius}) : super(key : key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit:BoxFit.fill,
          image: NetworkImage(this.imageURL)
        )
      ),
    );
  }
}