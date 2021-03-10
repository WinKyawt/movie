import 'package:flutter/material.dart';
import 'package:mmvideo/video_items.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text('xxVideo'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          VideoItems(
            videoPlayerController: VideoPlayerController.asset(
              'assets/v1.mp4',
            ),
            looping: true,
            autoplay: true,
          ),
          VideoItems(
            videoPlayerController: VideoPlayerController.asset(
              'assets/v9.mp4',
            ),
            looping: true,
            autoplay: true,
          ),
          VideoItems(
            videoPlayerController: VideoPlayerController.asset(
              'assets/v8.mp4',
            ),
            looping: true,
            autoplay: true,
          ),
          VideoItems(
            videoPlayerController: VideoPlayerController.asset(
              'assets/v7.mp4',
            ),
            looping: false,
            autoplay: false,
          ),
          VideoItems(
            videoPlayerController: VideoPlayerController.asset(
              'assets/v6.mp4',
            ),
            autoplay: true,
          ),
          VideoItems(
            videoPlayerController: VideoPlayerController.asset(
              'assets/v6.mp4',
            ),
            looping: false,
            autoplay: false,
          ),
          VideoItems(
            videoPlayerController: VideoPlayerController.asset(
              'assets/v5.mp4',
            ),
            looping: false,
            autoplay: false,
          ),
          VideoItems(
            videoPlayerController: VideoPlayerController.asset(
              'assets/v2.mp4',
            ),
            looping: false,
            autoplay: false,
          ),
        ],
      ),
    );
  }
}
