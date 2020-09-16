import 'package:flutter/material.dart';

class DrawerNavItem extends StatelessWidget {
  final String image;
  final String label;
  final TextStyle textStyle;
  final double size;
  final Color color;
  final Color background;

  const DrawerNavItem(
      {Key key,
      @required this.image,
      this.label = "",
      this.size = 25.0,
      this.color = Colors.black54,
      this.textStyle,
      this.background = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(this.size)),
      color: this.background,
      type: MaterialType.button,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: this.label.isNotEmpty
              ? <Widget>[
                  Image.asset(
                    image,
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(width: 5),
                  Text(
                    label,
                    style: textStyle ?? TextStyle(color: this.color),
                  ),
                ]
              : <Widget>[
                  Image.asset(
                    image,
                    width: 25,
                    height: 25,
                  ),
                ],
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final bool isEndDrawer;
  final double width;
  final Color color;
  final ValueChanged<int> onTap;
  final String image;

  NavButton(
      {this.onTap,
      this.position,
      this.length,
      this.isEndDrawer,
      this.width,
      this.color,
      this.index,
      this.image});

  @override
  Widget build(BuildContext context) {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    final directionMultiplier = isEndDrawer ? 1 : -1;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap(index);
        },
        child: Container(
            width: this.width,
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(
                  difference < 1.0 / length
                      ? verticalAlignment * directionMultiplier * 40
                      : 0,
                  0),
              child: Opacity(
                  opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
                  child: Image.asset(
                    image,
                    width: 50.0,
                    height: 50.0,
                  )),
            )),
      ),
    );
  }
}
