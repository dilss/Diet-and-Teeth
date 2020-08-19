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
            radius: availableSize * 0.07,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text('User photo'),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('user@dummy.com'),
          )
        ],
      ),
    );
  }
}
