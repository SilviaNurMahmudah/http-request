import 'package:flutter/material.dart';
import 'package:http_request/pages/movie_detail.dart';
import 'package:http_request/service/http_service.dart';

class MovieList extends StatefulWidget {
  @override 
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  //inisialisasi variabel
  int moviesCount;
  List movies;
  HttpService service;

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  final String imgPath = 'https://image.tmdb.org/t/p/w500/';
  
  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
        backgroundColor: Colors.blue[200],
      ),
      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (context, int position){
          return Card(
            color: Colors.blue[100],
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(imgPath + movies[position].posterPath),
              ),
              title: Text(movies[position].title),
              subtitle: Text(
                'Rating = ' + movies[position].voteAverage.toString(),
              ),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (_) => MovieDetail(movies[position])
                );
                Navigator.push(context, route);
              },
            )
          );
        },
      ),
    );
  }
}