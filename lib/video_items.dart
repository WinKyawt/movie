import 'package:ext_video_player/ext_video_player.dart';
import 'package:flutter/material.dart';

class YoutubeVideo extends StatefulWidget {
  final String url;
 
   YoutubeVideo({this.url});
  @override
  YoutubeVideoState createState() => YoutubeVideoState();
}

class YoutubeVideoState extends State<YoutubeVideo> {
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
      padding: const EdgeInsets.all(8),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(10),
                ),
      child: AspectRatio(
        aspectRatio: 6/4,
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