import 'package:car_app/helper/costanse.dart';
import 'package:flutter/material.dart';

class BuildContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  const BuildContainer({
    this.child,
    this.color,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: kaccentColor, width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}