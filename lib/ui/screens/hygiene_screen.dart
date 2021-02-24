import 'package:diet_and_teeth_app/ui/widgets/hero_animation_widget.dart';
import 'package:flutter/material.dart';

class HygieneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Higiene Bucal',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: 'KidsHandwriting',
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                HeroAnimationWidget(
                  heroTag: '1',
                  imagePath: 'assets/images/1.jpg',
                  pageTitle: '1º Passo',
                  videoPath: 'assets/videos/1.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '2',
                  imagePath: 'assets/images/2.jpg',
                  pageTitle: '2º Passo',
                  videoPath: 'assets/videos/2.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '3',
                  imagePath: 'assets/images/3.jpg',
                  pageTitle: '3º Passo',
                  videoPath: 'assets/videos/3.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '4',
                  imagePath: 'assets/images/4.jpg',
                  pageTitle: '4º Passo',
                  videoPath: 'assets/videos/4.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '5',
                  imagePath: 'assets/images/5.jpg',
                  pageTitle: '5º Passo',
                  videoPath: 'assets/videos/5.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '6',
                  imagePath: 'assets/images/6.jpg',
                  pageTitle: '6º Passo',
                  videoPath: 'assets/videos/6.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '7',
                  imagePath: 'assets/images/7.jpg',
                  pageTitle: '7º Passo',
                  videoPath: 'assets/videos/7.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '8',
                  imagePath: 'assets/images/8.jpg',
                  pageTitle: '8º Passo',
                  videoPath: 'assets/videos/8.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '9',
                  imagePath: 'assets/images/9.jpg',
                  pageTitle: '9º Passo',
                  videoPath: 'assets/videos/9.mp4',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
