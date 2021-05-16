import 'package:diet_and_teeth_app/hygiene_dashboard/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HeroAnimationWidget extends StatefulWidget {
  final String pageTitle;
  final String heroTag;
  final String videoPath;

  HeroAnimationWidget({this.pageTitle, this.heroTag, this.videoPath});

  @override
  _HeroAnimationWidgetState createState() => _HeroAnimationWidgetState();
}

class _HeroAnimationWidgetState extends State<HeroAnimationWidget> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)..initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoScreen(
            title: widget.pageTitle,
            heroTag: widget.heroTag,
            videoPath: widget.videoPath,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GridTile(
          child: Hero(
            tag: widget.heroTag,
            child: VideoPlayer(_controller),
          ),
          footer: GridTileBar(
            title: Text(
              widget.pageTitle,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
