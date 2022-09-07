import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_request/main.dart';
import 'package:http_request/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';
  MovieDetail(this.movie);

  @override 
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    }else {
      path = 'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.blue[200],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: <Widget> [
            Center(
              child: Card(
                elevation: 5,
                child: Container(
                  height: 450,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(path)
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(
              movie.title, style: 
              TextStyle(
                fontSize: 28, 
                fontWeight: FontWeight.bold, 
                letterSpacing: 2.5
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Simbol(movie: movie),
                Simbol(movie: movie),
                Simbol(movie: movie),
              ],
            ),
            SizedBox(height: 20,),
            Text(
              movie.overview,
              style: TextStyle(
                fontSize: 18,
                height: 1.5
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      bottomNavigationBar: RaisedButton(
        padding: const EdgeInsets.only(
          top: 15, 
          bottom: 15,
        ),
        onPressed: () {
          Navigator.pop(context, MyHomePage());
        },
        color: Colors.blue[200],
        textColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.arrow_back,
            ),
            Container(height: 5,width: 5,),
            Text(
              'Back',
              style: TextStyle(
                fontSize: 18
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Simbol extends StatelessWidget {
  const Simbol({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.star_border,
              size: 45,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 10,),
            Text(
              movie.voteAverage.toString(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      )
    );
  }
}