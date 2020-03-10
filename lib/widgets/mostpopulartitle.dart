import 'package:flutter/material.dart';

//*this class creates titles for
//*the most popular(hot) screen

class MostPopularScreenTitle extends StatelessWidget {

  final String mainTitle1;
  final String mainTitle2;
  final String subTitle;
  final Icon icon;

  MostPopularScreenTitle( {Key key, this.mainTitle1, this.mainTitle2, this.subTitle, this.icon} );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
                children: [
                SizedBox(width: 10.0),
                icon,
                SizedBox(width: 5.0),
                Text(
                  mainTitle1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                    ),
                  ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                Text(
                  mainTitle2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 20.0
                  ),
                ),
                ],
              ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                subTitle,
                style: TextStyle( color: Colors.grey[600])
              ),
            ),
          ),
        ],
    );
  }
}