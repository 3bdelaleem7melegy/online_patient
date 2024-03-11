// ignore_for_file: file_names, prefer_const_constructors, sort_child_properties_last, unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:online_patient/model/item.dart';

class Labsurvice extends StatelessWidget {
  const Labsurvice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, '/Labs');
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Lab survice",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        centerTitle: true,
        // actions: [
        //   Row(
        //     children: [
        // IconButton(
        //   color: Colors.black,
        //   onPressed: () {},
        //   icon: Icon(Icons.add_shopping_cart),
        // ),
        //       Padding(
        //         padding: EdgeInsets.only(right: 10),
        //         child: Text(
        //           "\$",
        //           style: TextStyle(
        //             fontSize: 25,
        //             color: Colors.black,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                    child: Column(
                  children: [
                    Image.asset("assets/Labs.jpg"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "Cholesterol Test",
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.only(left: 50)),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/Detailscholestrol',
                                    arguments: "Cholesterol Test");
                              },
                              child: Text("Lots of details click here"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ))
                        ],
                      ),
                    ),
                  ],
                )),
                SizedBox(
                  height: 12,
                ),
                Card(
                    child: Column(
                  children: [
                    Image.asset("assets/Labs2.jpg"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "CBC Test",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.only(left: 90)),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/Detailscholestrol',
                                    arguments: "CBC Test");
                              },
                              child: Text("Lots of details click here"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ))
                        ],
                      ),
                    ),
                  ],
                )),
                SizedBox(
                  height: 12,
                ),
                Card(
                    child: Column(
                  children: [
                    Image.asset("assets/Labs3.jpg"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "Heart Test",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.only(left: 80)),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/Detailscholestrol',
                                    arguments: "Heart Test");
                              },
                              child: Text("Lots of details click here"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ))
                        ],
                      ),
                    ),
                  ],
                )),
                SizedBox(
                  height: 12,
                ),
                Card(
                    child: Column(
                  children: [
                    Image.asset("assets/Labs4.jpg"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "Creatinine Test",
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.only(left: 40)),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/Detailscholestrol',
                                    arguments: "Creatinine Test");
                              },
                              child: Text("Lots of details click here"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ))
                        ],
                      ),
                    ),
                  ],
                )),
                Card(
                    child: Column(
                  children: [
                    Image.asset("assets/Labs5.jpg"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "Live Function Test",
                            style: TextStyle(fontSize: 19),
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.only(left: 40)),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/Detailscholestrol',
                                    arguments: "Live Function Test");
                              },
                              child: Text("Lots of details click here"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ))
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            )),
      ),
    );
  }
}
