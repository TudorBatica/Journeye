import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitDoubleBounce(
        color: Colors.deepPurple,
        size: 50.0,
      )
    );
  }
}