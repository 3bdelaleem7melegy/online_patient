// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_patient/screen/Booking/bookingscreenCholestrol.dart';

class Detailscholestrol extends StatelessWidget {
  const Detailscholestrol({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, '/Labsurvice');
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        title: Text(
          type,
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Image.asset(
                    "assets/Labs.jpg",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            child: Text(
                "Details:                                                                            Overview A complete cholesterol screen, also called a lipidogram or lipid profile, is a blood test that can measure the amount of cholesterol and triglycerides in the blood. A cholesterol test can help determine the risk of fatty deposits (plaque) accumulating in your arteries, which can cause narrowing or blockage of the arteries throughout your body (atherosclerosis).",
                style: TextStyle(fontSize: 19)),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Title(
                color: Colors.black,
                child: Text(
                  "Active:24h",
                  style: TextStyle(fontSize: 25),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => bookingscreenCholestrol(
                      name:
                          FirebaseAuth.instance.currentUser!.displayName ?? "",
                      type: type,
                      id: FirebaseAuth.instance.currentUser!.uid ?? "",
                    ),
                  ));
            },
            child: Text("Book Appointment"),
          )
        ],
      ),
    );
  }
}
