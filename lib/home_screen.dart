import 'package:flutter/material.dart';
import 'package:mmvideo/video_items.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
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
        title: Text('xxVideo'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          YoutubeVideo(url: 'assets/v1.mp4'),
          YoutubeVideo(url: 'assets/v1.mp4'),
          YoutubeVideo(url: 'assets/v3.mp4'),
          YoutubeVideo(url: 'assets/v1.mp4'),
          YoutubeVideo(url: 'assets/v1.mp4'),
          YoutubeVideo(url: 'assets/v3.mp4'),
          YoutubeVideo(url: 'https://www.youtube.com/watch?v=kP9TfCWaQT4'), 
          YoutubeVideo(url: 'https://www.youtube.com/watch?v=kP9TfCWaQT4'), 
          YoutubeVideo(url: 'https://www.youtube.com/watch?v=kP9TfCWaQT4'), //assets/v10.mp4
        ],
      ),
    );
  }
}
