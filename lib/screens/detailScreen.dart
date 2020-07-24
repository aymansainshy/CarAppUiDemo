import 'package:car_app/helper/buildAppBar.dart';
import 'package:car_app/helper/costanse.dart';
import 'package:car_app/models/car.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Car car;

  const DetailScreen({
    Key key,
    this.car,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
            BuildAppBar(
              iconUrl: 'assets/icons/left-arrow.png',
              func: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: 20),
            _buildRichText(),
            Hero(
              tag: widget.car.id,
              child: Container(
                width: double.infinity,
                height: 170,
                child: Image.asset(
                  widget.car.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildCircleAvatar(),
                SizedBox(width: 10),
                _buildCircleAvatar(color: Colors.grey),
                SizedBox(width: 10),
                _buildCircleAvatar(),
                SizedBox(width: 10),
                _buildCircleAvatar(),
              ],
            ),
            _buildText('Specifications'),
            BuildGrid(),
            _buildText('Gallery'),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNav(widget.car.price),
    );
  }

// 2 - ....................................
  RichText _buildRichText() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${widget.car.type}\n',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 35,
                letterSpacing: 1),
          ),
          TextSpan(
            text: '${widget.car.name}',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}

// 3 - ...............................
CircleAvatar _buildCircleAvatar({Color color = kaccentColor}) {
  return CircleAvatar(
    radius: 6,
    backgroundColor: color,
  );
}

// 4 - ..............
Text _buildText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1,
    ),
  );
}

//5 ...................................................
class BuildGrid extends StatelessWidget {
  final List<Map<String, dynamic>> spicification = [
    {
      'icon': 'assets/icons/engine.png',
      'title': 'Engine Power',
      'description': '610 CV (449 kw)',
      'color': kaccentColor
    },
    {
      'icon': 'assets/icons/windshield.png',
      'title': 'Acceleration',
      'description': '0-100 km/h - 3.5s',
      'color': Colors.blueGrey[700]
    },
    {
      'icon': 'assets/icons/dashboard.png',
      'title': 'Max Speed',
      'description': '324 km/h',
      'color': kaccentColor
    },
    {
      'icon': 'assets/icons/information.png',
      'title': 'Max Torque',
      'description': '560Nm @6.500 rpm',
      'color': kaccentColor
    },
    {
      'icon': 'assets/icons/breakdown.png',
      'title': 'Breakes',
      'description': '8 Pistons (front)',
      'color': kaccentColor
    },
    {
      'icon': 'assets/icons/climatization.png',
      'title': 'Seats',
      'description': '2 seats',
      'color': kaccentColor
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: spicification.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => GridItem(
          color: spicification[index]['color'],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                spicification[index]['icon'],
                height: 45,
                width: 45,
                color: Colors.grey,
              ),
              SizedBox(height: 10),
              Expanded(
                child: FittedBox(
                  child: Text(
                    spicification[index]['title'],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FittedBox(
                  child: Text(
                    spicification[index]['description'],
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 1,
                      fontSize: 10,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final Widget child;
  final Color color;
  const GridItem({
    this.color,
    this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

//6 - ...........................

Stack buildBottomNav(double price) {
  return Stack(
    children: <Widget>[
      Container(
        width: double.infinity,
        height: 60,
        color: kaccentColor,
      ),
      Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: kpadding),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Per Day\n',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                  TextSpan(
                    text: '\$$price',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: kbottonColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  'Rent Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
