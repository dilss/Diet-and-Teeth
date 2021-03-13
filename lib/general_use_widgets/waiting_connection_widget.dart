import 'package:flutter/material.dart';

class WaitingConnectionWidget extends StatelessWidget {
  const WaitingConnectionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.sentiment_neutral),
          Text("Aguardando conexão..."),
        ],
      ),
    );
  }
}
