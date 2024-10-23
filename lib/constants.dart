import 'package:flutter/material.dart';
import 'package:othaim/models/product.dart';

const String imagePlaceholder = 'https://picsum.photos/200/300';
const TextStyle primaryTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: 'circularStd');

bool inTestMode = const bool.fromEnvironment('dart.vm.product') == false;
Product sampleProduct = Product(
  id: 1,
  title: 'Red Shirt',
  price: 29.99,
  description: 'A red shirt - it is pretty red!',
  image: imagePlaceholder,
  category: 'Shirt',
  rating: Rating(rate: 4.5, count: 10),
);
