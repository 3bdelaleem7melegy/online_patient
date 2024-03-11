// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BannerModel {
  String text;
  List<Color> cardBackground;
  String image;

  BannerModel(this.text, this.cardBackground, this.image);
}

List<BannerModel> bannerCards = [
  BannerModel(
      "Check Disease",
      [
        const Color(0xffa1d4ed),
        const Color(0xffc0eaff),
      ],
      "assets/414-bg.png"),
  BannerModel(
      "Covid-19",
      [
        const Color(0xffb6d4fa),
        const Color(0xffcfe3fc),
      ],
      "assets/covid-bg.png"),
];

class BannerModelSpecial {
  String text;
  List<Color> cardBackground;
  String image;

  BannerModelSpecial(this.text, this.cardBackground, this.image);
}

List<BannerModel> bannerSpecial = [
  BannerModel(
    "Cardiologist",
    [
      const Color(0xffa1d4ed),
      const Color(0xffc0eaff),
    ],
    "assets/cardiologist.png",
  ),
  BannerModel(
      "Dentist",
      [
        const Color(0xffb6d4fa),
        const Color(0xffcfe3fc),
      ],
      "assets/dentistry.png"),
  BannerModel(
      "ophthalmologist",
      [
        const Color(0xffb6d4fa),
        const Color(0xffcfe3fc),
      ],
      "assets/ophthalmologist.png"),
  BannerModel(
      "SpecialList",
      [
        const Color(0xffb6d4fa),
        const Color(0xffcfe3fc),
      ],
      "assets/select-all.png"),
];
List<BannerModel> bannerSpecial1 = [
  BannerModel(
    "Cardiologist",
    [
      const Color(0xffa1d4ed),
      const Color(0xffc0eaff),
    ],
    "assets/cardiologist.png",
  ),
  BannerModel(
      "Dentist",
      [
        const Color(0xffb6d4fa),
        const Color(0xffcfe3fc),
      ],
      "assets/dentistry.png"),
  BannerModel(
      "ophthalmologist",
      [
        const Color(0xffb6d4fa),
        const Color(0xffcfe3fc),
      ],
      "assets/ophthalmologist.png"),
  BannerModel(
    "Paediatrician",
    [
      const Color(0xffa1d4ed),
      const Color(0xffc0eaff),
    ],
    "assets/examination.jpg",
  ),
  BannerModel(
    "orthopedics",
    [
      const Color(0xffa1d4ed),
      const Color(0xffc0eaff),
    ],
    "assets/orthopedics.png",
  ),
];
