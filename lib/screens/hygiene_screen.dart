import 'package:flutter/material.dart';

class HygieneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableSize = constraints.maxHeight;
        return Scaffold(
          body: Center(
            child: Text('Nada'),
          ),
        );
      },
    );
  }
}
