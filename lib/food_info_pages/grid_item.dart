import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GridItem extends StatefulWidget {
  final Color color;
  final String text;
  final String imgPath;
  final Function callBack;

  const GridItem({
    Key key,
    @required this.color,
    @required this.text,
    @required this.imgPath,
    @required this.callBack,
  }) : super(key: key);
  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraint) {
        return Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 6,
            child: InkWell(
              onTap: () {
                widget.callBack();
              },
              customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              splashColor: widget.color,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: widget.color, width: 2),
                  gradient: LinearGradient(
                    colors: [
                      widget.color.withOpacity(0.0),
                      widget.color.withOpacity(0.6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: SvgPicture.asset(
                        widget.imgPath,
                        height: 70,
                      ),
                      height: constraint.maxHeight * 0.4,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      child: Text(
                        widget.text,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
