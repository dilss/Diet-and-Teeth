import 'package:diet_and_teeth_app/hygiene_dash_board/video_screen.dart';
import 'package:flutter/material.dart';

class HeroAnimationWidget extends StatelessWidget {
  final String pageTitle;
  final String heroTag;
  final String imagePath;
  final String videoPath;

  HeroAnimationWidget(
      {this.pageTitle, this.heroTag, this.imagePath, this.videoPath});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoScreen(
              title: pageTitle,
              heroTag: heroTag,
              videoPath: videoPath,
            ),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GridTile(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            footer: GridTileBar(
              title: Text(
                pageTitle,
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
      ),
    );
  }
}
