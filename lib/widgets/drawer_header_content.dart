import 'package:flutter/material.dart';

class DrawerHeaderContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final availableSize = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundImage: null, // NetworkImage(),
            radius: availableSize * 0.07,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('test'),
          )
        ],
      ),
    );
  }
}
