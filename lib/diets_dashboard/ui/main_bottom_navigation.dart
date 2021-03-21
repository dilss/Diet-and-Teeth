import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainBottomNavigationBar extends StatefulWidget {
  final PageController pageController;
  final Function changePageTitle;
  final int bottomCurrentIndex;

  const MainBottomNavigationBar(
      {Key key,
      this.pageController,
      this.changePageTitle,
      this.bottomCurrentIndex})
      : super(key: key);

  @override
  _MainBottomNavigationBarState createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  var _bottomSelectedPageIndex;

  @override
  void initState() {
    super.initState();
    _bottomSelectedPageIndex = widget.bottomCurrentIndex;
  }

  void _bottomTaped(int index) {
    setState(() {
      _bottomSelectedPageIndex = index;
      widget.pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.decelerate);
      widget.changePageTitle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.black,
      currentIndex: _bottomSelectedPageIndex,
      onTap: (value) {
        _bottomTaped(value);
      },
      items: [
        BottomNavigationBarItem(
          icon: Container(
            height: 40,
            child: SvgPicture.asset(
              'assets/svg/coffee.svg',
              height: 40,
            ),
          ),
          label: 'Café',
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 40,
            child: SvgPicture.asset(
              'assets/svg/lunch.svg',
              height: 40,
            ),
          ),
          label: 'Almoço',
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 40,
            child: SvgPicture.asset(
              'assets/svg/afternoonSnack.svg',
              height: 40,
            ),
          ),
          label: 'Lanche',
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 40,
            child: SvgPicture.asset(
              'assets/svg/dinner.svg',
              height: 40,
            ),
          ),
          label: 'Jantar',
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 40,
            child: SvgPicture.asset(
              'assets/svg/candy.svg',
              height: 40,
            ),
          ),
          label: 'Extras',
        ),
      ],
    );
  }
}
