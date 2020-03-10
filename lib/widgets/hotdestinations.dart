import 'package:flutter/material.dart';

//*this is the list that displays
//*the most popular destinations
//*(on the hot screen)

class HotDestinationsContainer extends StatelessWidget {

  
  final List<String> destinationNames = [
    'Bangkok',
    'Berlin',
    'Madrid',
    'Tokyo',
  ];
  final List<String> countryNames = [
    'Thailand',
    'Germany',
    'Spain',
    'Japan'
  ];
  final List<String> destinationPics = [
    'https://static.wixstatic.com/media/03d418_c8fbe96bb56441c3b2ad80c8ac7547b5~mv2.jpg',
    'https://www.lg.com/ro/lg-magazine/images/how-to/2018/berlin_itinerary/ifa-2018_your-best-berlin-itinerary_article_key-visual.jpg',
    'https://www.cathaypacific.com/content/dam/destinations/Madrid/cityguide-gallery/madrid_puerta_del_sol_920x500.jpg',
    'https://www.fodors.com/wp-content/uploads/2019/07/TokyoNeighborhoodGame__HERO_jezael-melgoza-1409793-unsplash.jpg'
  ];


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.deepPurple, Color.fromRGBO(80, 60, 200, 1)]
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), 
            topRight: Radius.circular(40.0)
          )
        ),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: destinationNames.length,
            itemBuilder: (BuildContext context, int index) {
            return Stack(
                alignment: Alignment.bottomCenter,
                children: [ 
                Container(
                margin: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)
                  ),
                  image: DecorationImage(
                    image: NetworkImage(destinationPics[index]),
                    fit: BoxFit.cover
                  )
                ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.width * 0.07,  
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)
                    ),
                    boxShadow: [BoxShadow(
                      color: Colors.grey[500],
                      blurRadius: 2.0,
                      spreadRadius: 2.0
                    )
                    ]
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: destinationNames[index],
                      style: TextStyle(
                        fontSize:  18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                      children: [
                        TextSpan(
                          text: ', ' + countryNames[index],
                          style: TextStyle(fontSize: 16)
                        )
                      ]
                    ),
                  ),
                )
              ]
            );
          }
        )
      )
    );
  }
}