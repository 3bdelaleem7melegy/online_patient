// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

final List<Item> items = [
  Item(
      imgg: "assets/download.jpg",
      
      price: 2500000,
      location: "ALFA",
      Text:
          "  Pharmacy is the science and practice of discovering, producing, preparing, dispensing, reviewing and monitoring medications, aiming to ensure the safe, effective, and affordable use of medicines. It is a miscellaneous science as it links health sciences with pharmaceutical sciences and natural sciences."),
  Item(
      imgg: "assets/download (1).jpg",
      price: 50000000,
      Text:
          "Pharmacy is the science and practice of discovering, producing, preparing, dispensing, reviewing and monitoring medications, aiming to ensure the safe, effective, and affordable use of medicines. It is a miscellaneous science as it links health sciences with pharmaceutical sciences and natural sciences."),
  Item(
      imgg: "assets/images.jpg",
      price: 8500000,
      Text:
            "Pharmacy is the science and practice of discovering, producing, preparing, dispensing, reviewing and monitoring medications, aiming to ensure the safe, effective, and affordable use of medicines. It is a miscellaneous science as it links health sciences with pharmaceutical sciences and natural sciences."),
  Item(
      imgg: "assets/images (1).jpg",
      price: 8252000,
      Text:
            "Pharmacy is the science and practice of discovering, producing, preparing, dispensing, reviewing and monitoring medications, aiming to ensure the safe, effective, and affordable use of medicines. It is a miscellaneous science as it links health sciences with pharmaceutical sciences and natural sciences."),
  Item(
      imgg: "assets/images (2).jpg",
      price: 3500000,
      Text:
            "Pharmacy is the science and practice of discovering, producing, preparing, dispensing, reviewing and monitoring medications, aiming to ensure the safe, effective, and affordable use of medicines. It is a miscellaneous science as it links health sciences with pharmaceutical sciences and natural sciences."),
  Item(
      imgg: "assets/images (3).jpg",
      price: 1000000,
      Text:
            "Pharmacy is the science and practice of discovering, producing, preparing, dispensing, reviewing and monitoring medications, aiming to ensure the safe, effective, and affordable use of medicines. It is a miscellaneous science as it links health sciences with pharmaceutical sciences and natural sciences."),
  Item(
      imgg: "assets/images (4).jpg",
      price: 1500000,
      Text:
            "Pharmacy is the science and practice of discovering, producing, preparing, dispensing, reviewing and monitoring medications, aiming to ensure the safe, effective, and affordable use of medicines. It is a miscellaneous science as it links health sciences with pharmaceutical sciences and natural sciences."),
  Item(
      imgg: "assets/images (5).jpg",
      price: 700000,
      Text:
          "Pharmacy is the science and practice of discovering, producing, preparing, dispensing, reviewing and monitoring medications, aiming to ensure the safe, effective, and affordable use of medicines. It is a miscellaneous science as it links health sciences with pharmaceutical sciences and natural sciences."),
];

class Item {
  String imgg;
  var price;

  var location;

  var Text;

  Item({
    required this.imgg,
    required this.price,
    this.location = "Alfaa",
    required this.Text,
  });
}
