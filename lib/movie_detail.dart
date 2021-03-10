import 'package:flutter/material.dart';
import 'package:mmvideo/movie.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ext_video_player/ext_video_player.dart';

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
    
    if(widget.movie.title.contains('Tom')) {
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
        ),
        body: ListView(
          children: [ 
            _YoutubeVideo(url: curVideo),
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

class _YoutubeVideo extends StatefulWidget {
  final String url;
 
   _YoutubeVideo({this.url});
  @override
  _YoutubeVideoState createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<_YoutubeVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.url.contains('assets') ? VideoPlayerController.asset(widget.url): VideoPlayerController.network( widget.url
      // youtubeVideoQuality: VideoQuality.high720,
    ); 
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            VideoPlayer(_controller),
            ClosedCaption(text: _controller.value.caption.text),
            _PlayPauseOverlay(controller: _controller),
            VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
