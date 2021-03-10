import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mmvideo/home_screen.dart';
import 'package:mmvideo/movie.dart';
import 'package:mmvideo/movie_detail.dart';

class HomeGridPage extends StatefulWidget {
  HomeGridPage({Key key}) : super(key: key);

  @override
  _HomeGridPageState createState() => _HomeGridPageState();
}

class _HomeGridPageState extends State<HomeGridPage> {
  List<Movie> movies = [];
  @override
  void initState() {
    super.initState();
    getMovies();
  }

  getMovies() async {
    var url =
        'https://api.themoviedb.org/3/movie/popular?api_key=afdcd475833e8e0d4d610c1bbaa5bfbd&language=en-US&page=1'; //$uid// temporary
    var response = await Dio().get(url);
    final results = List<Map<String, dynamic>>.from(response.data['results']);
    movies = results
        .map((movieData) => Movie.fromMap(movieData))
        .toList(growable: false);
    setState(() {});
    return movies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('MMovie'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.menu,
                size: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.extent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
          children: movies.map((movie) => _MovieBox(movie: movie)).toList(),
        ),
      ),
    );
  }
}

class _MovieBox extends StatelessWidget {
  final Movie movie;

  const _MovieBox({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MovieDetail(
                  movie: movie,
                )));
      },
      child: Stack(
        children: [
          Image.network(
            movie.fullImageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _FrontBanner(text: movie.title),
          ),
        ],
      ),
    );
  }
}

class _FrontBanner extends StatelessWidget {
  const _FrontBanner({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.grey.shade200.withOpacity(0.5),
          height: 60,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
