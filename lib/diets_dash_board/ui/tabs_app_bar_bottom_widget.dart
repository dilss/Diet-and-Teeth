import 'package:flutter/material.dart';

class TabsAppBarBottomWidget extends StatelessWidget implements PreferredSize {
  const TabsAppBarBottomWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  Widget get child => Text(
        'Meal Category',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      );

  @override
  Size get preferredSize => Size.fromHeight(16);
}
