import 'package:diet_and_teeth_app/hygiene_dashboard/hero_animation_widget.dart';
import 'package:flutter/material.dart';

class HygieneScreen extends StatefulWidget {
  @override
  _HygieneScreenState createState() => _HygieneScreenState();
}

class _HygieneScreenState extends State<HygieneScreen> {
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
              childAspectRatio: 352 / 640, //VideoWidth / videoHeight
              children: [
                HeroAnimationWidget(
                  heroTag: '1',
                  pageTitle: '1º Passo',
                  videoPath: 'assets/videos/1.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '2',
                  pageTitle: '2º Passo',
                  videoPath: 'assets/videos/2.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '3',
                  pageTitle: '3º Passo',
                  videoPath: 'assets/videos/3.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '4',
                  pageTitle: '4º Passo',
                  videoPath: 'assets/videos/4.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '5',
                  pageTitle: '5º Passo',
                  videoPath: 'assets/videos/5.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '6',
                  pageTitle: '6º Passo',
                  videoPath: 'assets/videos/6.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '7',
                  pageTitle: '7º Passo',
                  videoPath: 'assets/videos/7.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '8',
                  pageTitle: '8º Passo',
                  videoPath: 'assets/videos/8.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '9',
                  pageTitle: '9º Passo',
                  videoPath: 'assets/videos/9.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '10',
                  pageTitle: '10º Passo',
                  videoPath: 'assets/videos/10.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '11',
                  pageTitle: '11º Passo',
                  videoPath: 'assets/videos/11.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '12',
                  pageTitle: '12º Passo',
                  videoPath: 'assets/videos/12.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '13',
                  pageTitle: '13º Passo',
                  videoPath: 'assets/videos/13.mp4',
                ),
                HeroAnimationWidget(
                  heroTag: '14',
                  pageTitle: '14º Passo',
                  videoPath: 'assets/videos/14.mp4',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
