import 'package:car_app/helper/buildContainer.dart';
import 'package:car_app/helper/costanse.dart';
import 'package:car_app/models/car.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: Padding(
        padding:
            const EdgeInsets.only(left: kpadding, right: kpadding, top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BuildAppBar(),
            SizedBox(height: 20),

            Text(
              'Choose a Car',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),

            BuildTextSwitch(),

            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cars.length,
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CarItem(car: cars[i]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//3 - ................................................
class CarItem extends StatelessWidget {
  final Car car;
  CarItem({this.car});

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          height: 280,
          width: 215,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                car.fColor,
                car.sColor,
              ],
            ),
          ),
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(kpadding),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${car.type}\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  TextSpan(
                    text: '${car.name}',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 70,
          left: kpadding / 2,
          child: Image.asset(
            '${car.imageUrl}',
            width: 230,
          ),
        ),
        Positioned(
          top: 170,
          child: Padding(
            padding: const EdgeInsets.all(kpadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Per Day\n',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      TextSpan(
                        text: '\$${car.price}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'View Details',
                  style: TextStyle(
                    color: Colors.white70,
                    letterSpacing: 1,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 1 -  ..................................................
class BuildAppBar extends StatelessWidget {
  const BuildAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        BuildContainer(
          color: kaccentColor,
          child: Image.asset(
            'assets/icons/bell.png',
            color: Colors.white,
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

// Widget _buildContainer(BuildContext ctx, Color color, Widget child) {
//   return Container(
//     width: 50,
//     height: 50,
//     padding: EdgeInsets.all(12.0),
//     decoration: BoxDecoration(
//       color: color,
//       border: Border.all(color: kaccentColor, width: 1.0),
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: child,
//   );
// }

// 2 - ..........................................................
class BuildTextSwitch extends StatefulWidget {
  @override
  _BuildTextSwitchState createState() => _BuildTextSwitchState();
}

class _BuildTextSwitchState extends State<BuildTextSwitch> {
  var driverOn = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'With a Driver',
          style: TextStyle(fontSize: 15, color: Colors.grey, letterSpacing: 1),
        ),
        Spacer(),
        Switch(
          activeColor: Colors.white,
          value: driverOn,
          onChanged: (value) {
            setState(() {
              driverOn = value;
            });
          },
        ),
      ],
    );
  }
}
