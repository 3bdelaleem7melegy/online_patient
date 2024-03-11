// ignore_for_file: file_names, prefer_const_constructors, sort_child_properties_last, unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:online_patient/model/item.dart';

class RumorsCenter extends StatelessWidget {
  const RumorsCenter({super.key});

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
          "Rumors Center",
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
                    Image.asset("assets/Heart Rumor.jpg"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "Heart Rumor",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.only(left: 50)),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/EchoRumors',
                                    arguments: "Heart Rumor");
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
                    Image.asset("assets/Brain Rumor.jpg"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "Brain Rumor",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.only(left: 50)),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/EchoRumors',
                                    arguments: "Brain Rumor");
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
                    Image.asset("assets/Echo Rumour.jpg"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "Echo Rumour",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.only(left: 50)),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/EchoRumors',
                                    arguments: "Echo Rumor");
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
                    Image.asset(
                      "assets/CT scan.jpg",
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "CT scan",
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.only(left: 83)),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/EchoRumors',
                                    arguments: "CT scan");
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
                    Image.asset("assets/Bone Rumor.jpg"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "Bone Rumor",
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.only(left: 70)),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/EchoRumors',
                                    arguments: "Bone Rumor");
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
