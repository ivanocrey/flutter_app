import 'package:flutter/material.dart';
import '../widget/vertikal.dart';
import '../model//movie.dart';
import '../widget/horizontal.dart';
class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Movie App')),
      backgroundColor: Colors.deepOrange,
      actions: <Widget>[
      ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Recommended',
                    style: TextStyle(
                        fontSize:18 ,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                ),
              ),
                  FlatButton(
                    child: Text('View All',
                    style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Container(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder: (ctx,i )=> Horizontal(i),
              ),
            ),
            SizedBox( height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Best of 2019',
                    style: TextStyle(
                        fontSize:18 ,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ),
                  ),
                  FlatButton(
                    child: Text('View All',
                    style: TextStyle(color: Colors.white,),),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Container(
              height: 500,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: bestMovieList.length,
                itemBuilder: (ctx,i)=> Vertical(i),
              ),
            ),
            SizedBox(height: 10,),
          ]//,
        ),
      ),
    );
  }
}
