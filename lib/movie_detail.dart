import 'package:flutter/material.dart';
import 'package:mmvideo/movie.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mmvideo/video_items.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({this.movie});

  final Movie movie;

  @override
  State<StatefulWidget> createState() {
    return _MovieDetailState();
  }
}

class _MovieDetailState extends State<MovieDetail> {
  String curVideo = '';
  @override
  void initState() {
    super.initState();

    if (widget.movie.title.contains('Tom')) {
      curVideo = 'https://www.youtube.com/watch?v=kP9TfCWaQT4';
    }
    if (widget.movie.title.contains('Raya')) {
      curVideo = 'https://www.youtube.com/watch?v=9BPMTr-NS9s';
    }
    if (widget.movie.title.contains('Monster')) {
      curVideo = 'https://www.youtube.com/watch?v=3od-kQMTZ9M';
    }
    if (widget.movie.title.contains('Wonder')) {
      curVideo = 'https://www.youtube.com/watch?v=kP9TfCWaQT4';
    }
    if (widget.movie.title.contains('Soul')) {
      curVideo = 'https://www.youtube.com/watch?v=kP9TfCWaQT4';
    } else {
      curVideo = 'assets/v1.mp4';
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.movie.title),
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    const Color(0xFF86221A),
                    const Color(0xFF1F1B18),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        body: ListView(
          children: [
            YoutubeVideo(url: curVideo),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.movie.title,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30,
                  itemPadding:
                      EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.redAccent,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.movie.release_date,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.movie.overview,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ));
  }
}
