import 'package:flutter/material.dart';
import '../model/movie.dart';
import '../screen/detail.dart';
class Vertical extends StatelessWidget {
  final int index;
  Vertical(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(Detail.routeName,arguments: {
              'id':         bestMovieList[index].id,
              'title':      bestMovieList[index].title,
              'imageUrl':   bestMovieList[index].imageUrl,
              'description':bestMovieList[index].description ,
              'rating':     bestMovieList[index].rating,
              'year':       bestMovieList[index].year,
              'duration':   bestMovieList[index].duration,
              'link ': bestMovieList[index].link,
            },);
          },
          child: Card(
            color: Colors.transparent,
            elevation: 5,
            child: Row(
              children: [
                Hero(
                  tag: bestMovieList[index].id,
                  child: Container(
                    height:150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(bestMovieList[index].imageUrl),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget> [
                      Text(
                        bestMovieList[index].title,
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white,),
                      ),
                      Container(
                        width: 240,
                        child: Text(
                            bestMovieList[index].description ,style: TextStyle(color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
