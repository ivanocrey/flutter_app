import 'package:flutter/material.dart';
import '../model/movie.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  static const routeName = '/movie-details';
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String ,String> ;
    final id = routeArgs['id'];


    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
       // title: Center(child: Text('halo')),
        backgroundColor: Colors.black38,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepOrange),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Column(
          children: <Widget>[
            Center(
              child: Card(
                elevation: 5,
                child: Hero(
                  tag: id,
                  child: Container(
                    height: 450,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(routeArgs['imageUrl']),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(routeArgs['title'], style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5,
            ),
              textAlign:  TextAlign.center,
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Column(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 45,
                          color: Colors.black38,
                        ),
                        SizedBox(height: 10,),
                        Text(
                          routeArgs['duration'],
                          style: TextStyle(
                            fontSize: 14 ,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Column(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 45,
                          color: Colors.black38,
                        ),
                        SizedBox(height: 10,),
                        Text(
                          routeArgs['year'],
                          style: TextStyle(
                              fontSize: 14 ,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],

                    ),
                  ),
                ),Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Column(
                      children: [
                        Icon(
                          Icons.star,
                          size: 45,
                          color: Colors.black38,
                        ),
                        SizedBox(height: 10,),
                        Text(
                          routeArgs['rating'],
                          style: TextStyle(
                              fontSize: 14 ,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Text(routeArgs['description'],
            style: TextStyle(fontSize: 18,height:1.5 ,color: Colors.white,fontFamily: 'Gotham'),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar:
      Row(
        children: [
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(top :20,bottom: 20),
                onPressed:() async {
                const url = 'https://youtu.be/Z1BCujX3pw8' ;
                if (await canLaunch(url)){
                  await launch(url);
                }else {
                  throw 'Could not launch $url';
                }
            } ,
              color: Colors.deepOrange,
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.play_circle_outline),
                  Text('Tonton Trailer' ,style: TextStyle(fontSize: 18),)
                ],
              ),
            ),
          ),Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(top :20,bottom: 20),
              onPressed: (){},
              color : Color(0xfff4f4f4) ,
              textColor: Colors.orange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_circle_outline),
                  Container(height: 5, width: 5 ,),
                  Text('Buy Now' ,style: TextStyle(fontSize: 18),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
