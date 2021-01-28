import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SuccessCheckMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final availableSize = MediaQuery.of(context).size.height;
    return Container(
      width: availableSize * 0.3,
      height: availableSize * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: FlareActor(
        'assets/animations/successCheck.flr',
        animation: 'Untitled',
        //snapToEnd: true,
        callback: (name) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
      ),
    );
  }
}
