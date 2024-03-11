// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:online_patient/app/screens/doctor/Special_List.dart';
import 'package:online_patient/model/bannerModel.dart';
import 'package:online_patient/screen/Cardiologist%20Special/Cardiologist.dart';
import 'package:online_patient/screen/Dentist%20Special/Dentist.dart';
import 'package:online_patient/screen/EyeSpecial/Eye%20Special.dart';
import 'package:online_patient/screen/Special.dart';

class CarouselsliderSpecial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
        itemCount: bannerSpecial.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            //alignment:  Alignment.centerLeft,
            //width: MediaQuery.of(context).size.width,
            height: 140,
            margin: EdgeInsets.only(left: 0, right: 0, bottom: 20),
            padding: EdgeInsets.only(left: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                stops: [0.3, 0.7],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: bannerSpecial[index].cardBackground,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                if (index >= bannerSpecial.length - 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpecialList(),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpecailList(
                          specailList: bannerSpecial[index].text),
                    ),
                  );
                }

                // if (index == 0) {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (BuildContext context) {
                //       return Cardiologist();
                //     }),
                //   );
                // } else if (index==1) {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (BuildContext context) {
                //     return Dentist();
                //   }),);
                // } else if (index==2){
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (BuildContext context) {
                //       return EyeSpecial();
                //     }),
                //   );
                // }
                // else{
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (BuildContext context) {
                //       return All();
                //     }),
                //   );
                // }
              },
              child: Stack(
                children: [
                  Image.asset(
                    bannerSpecial[index].image,
                    //'assets/414.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 7, right: 5),
                    alignment: Alignment.topRight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          bannerSpecial[index].text,
                          //'Check Disease',
                          style: TextStyle(
                            color: Colors.lightBlue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.lightBlue[900],
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          scrollPhysics: ClampingScrollPhysics(),
        ),
      ),
    );
  }
}
