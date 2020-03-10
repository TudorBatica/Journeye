import 'package:flutter/material.dart';

//*this class creates the
//*list that displays the hottest
//*secret location trips

class HotSecretTrips extends StatelessWidget {

  final List<String> hotSecretPics = [
    'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-540x360/07/84/6a/38.jpg',
    'https://img.theculturetrip.com/768x432/wp-content/uploads/2018/02/shutterstock_522001627.jpg',
    'https://study-eu.s3.amazonaws.com/uploads/image/path/197/wide_fullhd_31724831106_d54f852297_o.jpg',
    'https://pix10.agoda.net/hotelImages/4877634/0/db7ebdd6192005597fb67a0632c3a153.jpg?s=1024x768',
    'https://www.romania-insider.com/sites/default/files/styles/article_large_image/public/featured_images/cec-bank-palace-bucharest-shutterstock.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hotSecretPics.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              image: DecorationImage(
                image: NetworkImage(hotSecretPics[index]),
                fit: BoxFit.cover
              )
            ),
          );
        }
      )
    );
  }
}