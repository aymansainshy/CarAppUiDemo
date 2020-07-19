import 'package:flutter/material.dart';

class Car {
  final int id;
  final double price;
  final String type, name, imageUrl;
  final Color fColor, sColor;

  Car({
    @required this.id,
    @required this.price,
    @required this.type,
    @required this.name,
    @required this.imageUrl,
    @required this.fColor,
    @required this.sColor,
  });
}

List<Car> cars = [
  Car(
    id: 1,
    price: 325.0,
    type: 'Jaguar',
    name: 'Jaguar M557',
    imageUrl: 'assets/images/ford1.png',
    fColor: Colors.blue[600],
    sColor: Colors.black87,
  ),
  Car(
    id: 2,
    price: 223.0,
    type: 'Ford',
    name: 'Ford MG57',
    imageUrl: 'assets/images/ford3.png',
    fColor: Colors.red[300],
    sColor: Colors.redAccent[700],
  ),
  Car(
    id: 3,
    price: 253.0,
    type: 'Lamborigini',
    name: 'Aventador',
    imageUrl: 'assets/images/lamborghini5.png',
    fColor: Colors.white70,
    sColor: Colors.black87,
  ),
  Car(
    id: 4,
    price: 240.0,
    type: 'Ford',
    name: 'Ford GN12',
    imageUrl: 'assets/images/ford4.png',
    fColor: Colors.limeAccent,
    sColor: Colors.teal[900],
  ),
  Car(
    id: 5,
    price: 156.0,
    type: 'Ford',
    name: 'Huracan',
    imageUrl: 'assets/images/ford5.png',
    fColor: Colors.black45,
    sColor: Colors.black87,
  ),
  Car(
    id: 6,
    price: 140.0,
    type: 'Honda',
    name: 'RG5Z',
    imageUrl: 'assets/images/honda1.png',
    fColor: Colors.white70,
    sColor: Colors.blue[900],
  ),
];
