import 'package:car_app/helper/buildAppBar.dart';
import 'package:car_app/helper/buildContainer.dart';
import 'package:car_app/helper/costanse.dart';
import 'package:car_app/models/car.dart';
import 'package:car_app/screens/detailScreen.dart';
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
            const EdgeInsets.only(left: kpadding, right: kpadding, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BuildAppBar(iconUrl: 'assets/icons/bell.png'),
            SizedBox(height: 10),
            _buildText('Choose a Car'),
            BuildTextSwitch(),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cars.length,
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CarItem(
                    car: cars[i],
                    press: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            car: cars[i],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            _buildText('Top Dealers'),
            _buildDealerContainer(Icons.view_week, 'GreadX London', kpink),
            SizedBox(height: 10),
            _buildDealerContainer(
                Icons.panorama_fish_eye, 'National Car Rental', kblue),
            SizedBox(height: 15),
          ],
        ),
      ),
      bottomNavigationBar: BuildBottomNavigationBar(),
    );
  }
}

// 1 -  ..................................................

// this is also going to Helper Widget
// class BuildAppBar extends StatelessWidget {
//   final String iconUrl;
//   final Function func;
//   const BuildAppBar({
//     this.iconUrl,
//     this.func,
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         GestureDetector(
//           onTap: func,
//           child: BuildContainer(
//             color: kaccentColor,
//             child: Image.asset(
//               iconUrl,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         Spacer(),
//         BuildContainer(
//           color: kaccentColor,
//           child: Image.asset(
//             'assets/icons/search.png',
//             color: Colors.white,
//           ),
//         ),
//         SizedBox(width: 15),
//         BuildContainer(
//           color: kaccentColor,
//           child: Image.asset(
//             'assets/icons/adjust.png',
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class BuildContainer extends StatelessWidget {
//   final Color color;
//   final Widget child;
//   const BuildContainer({
//     this.child,
//     this.color,
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 50,
//       height: 50,
//       padding: EdgeInsets.all(12.0),
//       decoration: BoxDecoration(
//         color: color,
//         border: Border.all(color: kaccentColor, width: 1.0),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: child,
//     );
//   }
// }

// 2 - ..........................................................
Text _buildText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1,
    ),
  );
}

// 3 - ......................................................
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

//4 - ................................................
class CarItem extends StatelessWidget {
  final Car car;
  final Function press;
  CarItem({
    this.car,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            height: 280,
            width: 215,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
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
            child: Hero(
              tag: car.id,
              child: Image.asset(
                '${car.imageUrl}',
                width: 230,
              ),
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
                  SizedBox(height: 5),
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
      ),
    );
  }
}

// 5 - ................................
Container _buildDealerContainer(IconData icon, String text, Color color) {
  return Container(
    padding: EdgeInsets.all(kpadding / 2),
    width: double.infinity,
    height: 75.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      color: kaccentColor,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        BuildContainer(
          child: Icon(
            icon,
            color: Colors.white,
          ),
          color: color,
        ),
        SizedBox(width: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              '823 Mraz Wall Apt. 324',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white70,
                letterSpacing: 1,
              ),
            )
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.star, size: 15, color: Colors.yellow),
                Icon(Icons.star, size: 15, color: Colors.yellow),
                Icon(Icons.star, size: 15, color: Colors.yellow),
                Icon(Icons.star, size: 15, color: Colors.yellow),
                Icon(Icons.star_border, size: 15, color: Colors.yellow),
              ],
            ),
            Text(
              '234 Offers',
              style: TextStyle(
                fontSize: 12,
                color: Colors.blueAccent,
                letterSpacing: 1,
              ),
            )
          ],
        ),
      ],
    ),
  );
}

// 6 - ..................................................
class BuildBottomNavigationBar extends StatefulWidget {
  @override
  _BuildBottomNavigationBarState createState() =>
      _BuildBottomNavigationBarState();
}

class _BuildBottomNavigationBarState extends State<BuildBottomNavigationBar> {
  List<String> buttomNav = [
    'assets/icons/app.png',
    'assets/icons/calendar.png',
    'assets/icons/pin.png',
    'assets/icons/user.png',
  ];

  int selecTedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
      color: kaccentColor,
      height: 65,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: buttomNav.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selecTedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: kpadding * 2, left: kpadding),
            child: Image.asset(
              buttomNav[index],
              height: 40,
              color: selecTedIndex == index ? kbottonColor : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
