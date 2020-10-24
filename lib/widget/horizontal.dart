import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/screen/detail.dart';

class Horizontal extends StatelessWidget {
  final int index;
  Horizontal(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 160,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(Detail.routeName,arguments: {
            'id': movieList[index].id,
            'title': movieList[index].title,
            'imageUrl': movieList[index].imageUrl,
            'description':movieList[index].description ,
            'rating':movieList[index].rating,
            'year': movieList[index].year,
            'duration':movieList[index].duration,
            'link':movieList[index].link,
          },);
        },
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Hero(
                tag: movieList[index].id,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          movieList[index].imageUrl),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(movieList[index].title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white,
                ),
                textAlign: TextAlign.center
            ),
          ],
        ),
      ),
    );
  }
}
