import 'package:car_app/helper/costanse.dart';
import 'package:flutter/material.dart';

import 'buildContainer.dart';

class BuildAppBar extends StatelessWidget {
  final String iconUrl;
  final Function func;
  const BuildAppBar({
    this.iconUrl,
    this.func,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: func,
          child: BuildContainer(
            color: kaccentColor,
            child: Image.asset(
              iconUrl,
              color: Colors.white,
            ),
          ),
        ),
        Spacer(),
        BuildContainer(
          color: kaccentColor,
          child: Image.asset(
            'assets/icons/search.png',
            color: Colors.white,
          ),
        ),
        SizedBox(width: 15),
        BuildContainer(
          color: kaccentColor,
          child: Image.asset(
            'assets/icons/adjust.png',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
