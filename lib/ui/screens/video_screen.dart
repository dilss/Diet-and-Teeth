import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String title;
  final String heroTag;
  final String videoPath;

  VideoScreen({this.title, this.heroTag, this.videoPath});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize()
      ..setVolume(0.0)
      ..setLooping(true)
      ..play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'KidsHandwriting',
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Hero(
          tag: widget.heroTag,
          child: Container(
            height: constraints.maxHeight,
            child: VideoPlayer(_controller),
          ),
        ),
      ),
    );
  }
}
