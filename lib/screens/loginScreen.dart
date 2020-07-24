import 'package:car_app/helper/costanse.dart';
import 'package:car_app/screens/homeScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kprimaryColor,
      body: Stack(
        children: <Widget>[
          // Login Car image
          Container(
            height: mediaQuery.height,
            width: mediaQuery.width,
            child: Image.asset(
              'assets/images/welcome.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Text and the bottom
          Positioned(
            bottom: 80.0,
            child: Padding(
              padding: const EdgeInsets.all(kpadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Luxury Text ............
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 50,
                      ),
                      children: [
                        TextSpan(text: 'Luxury\n'),
                        TextSpan(text: 'Car Rental'),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  // Text buildText(String text, double size, Color color) {
                  //   return Text(
                  //     Email,
                  //     style: TextStyle(
                  //       color: Colors.grey,
                  //       fontSize: 25,
                  //     ),
                  //   );
                  // }
                   
                  buildText('Email', 25, Colors.grey),
                  SizedBox(height: 10),
                  buildText('Password', 25, Colors.grey),

                  SizedBox(height: 25),

                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: kbottonColor,
                      child: Image.asset(
                        'assets/icons/right-arrow.png',
                        color: Colors.white,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: kpadding,
            child: Container(
              width: mediaQuery.width,
              margin: EdgeInsets.only(left: kpadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  buildText('SignUp', 17, Colors.blueGrey[800]),
                  SizedBox(width: 20),
                  CircleAvatar(
                    radius: 2,
                    backgroundColor: Colors.blueGrey[800],
                  ),
                  SizedBox(width: 20),
                  buildText('Forget Password', 17, Colors.blueGrey[800])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text buildText(String text, double size, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
