// ignore_for_file: file_names, prefer_const_constructors, sort_child_properties_last, unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:online_patient/model/item.dart';

class Labs extends StatelessWidget {
  const Labs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Labs",
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

            padding: EdgeInsets.only(top:100),
            child: Column(


              children: [

                Card(
margin:EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                    child: Column(

                  children: [

                    Image.asset("assets/Lab6.jpg"),
                    SingleChildScrollView(

                      scrollDirection: Axis.horizontal,
                      child: Row(

                        children: [
                          Text(
                            "Al Burj October Center of Excellence",
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.only(left: 50)),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/Labsurvice');
                              },
                              child: Text("Click Here"),
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
                  height: 35,
                ),
                Card(
                    child: Column(
                  children: [
                    Image.asset("assets/Rumors.jpg",width:600,),
                    SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,

                      child: Row(
                        children: [
                          Text(
                            "Alpha Scan Rumors center",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.only(left: 50)),
                          ElevatedButton(
                              onPressed: () {  Navigator.pushNamed(
                                    context, '/RumorsCenter');},
                              child: Text("Click Here"),
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
                // Card(
                //     child: Column(
                //   children: [
                //     Image.asset("assets/Labs3.jpg"),
                //     SingleChildScrollView(
                //                             scrollDirection: Axis.horizontal,

                //       child: Row(
                //         children: [
                //           Text(
                //             "Heart Test",
                //             style: TextStyle(fontSize: 25),
                //             textAlign: TextAlign.center,
                //           ),
                //           Padding(padding: EdgeInsets.only(left: 80)),
                //           ElevatedButton(
                //               onPressed: () {  Navigator.pushNamed(
                //                     context, '/HeartTest');},
                //               child: Text("Lots of details click here"),
                //               style: ButtonStyle(
                //                 backgroundColor:
                //                     MaterialStateProperty.all(Colors.blue),
                //               ))
                //         ],
                //       ),
                //     ),
                //   ],
                // )),
                SizedBox(
                  height: 12,
                ),
                // Card(
                //     child: Column(
                //   children: [
                //     Image.asset("assets/Labs4.jpg"),
                //     SingleChildScrollView(
                //                             scrollDirection: Axis.horizontal,

                //       child: Row(
                //         children: [
                //           Text(
                //             "Creatinine Test",
                //             style: TextStyle(fontSize: 22),
                //             textAlign: TextAlign.center,
                //           ),
                //           Padding(padding: EdgeInsets.only(left: 40)),
                //           ElevatedButton(
                //               onPressed: () {  Navigator.pushNamed(
                //                     context, '/CreatinineTest');},
                //               child: Text("Lots of details click here"),
                //               style: ButtonStyle(
                //                 backgroundColor:
                //                     MaterialStateProperty.all(Colors.blue),
                //               ))
                //         ],
                //       ),
                //     ),
                //   ],
                // )),
                // Card(
                //     child: Column(
                //   children: [
                //     Image.asset("assets/Labs5.jpg"),
                //     SingleChildScrollView(
                //                             scrollDirection: Axis.horizontal,

                //       child: Row(
                //         children: [
                //           Text(
                //             "Live Function Test",
                //             style: TextStyle(fontSize: 19),
                //             textAlign: TextAlign.center,
                //           ),
                //           Padding(padding: EdgeInsets.only(left: 40)),
                //           ElevatedButton(
                //               onPressed: () {  Navigator.pushNamed(
                //                     context, '/LiveFunctionTest');},
                //               child: Text("Lots of details click here"),
                //               style: ButtonStyle(
                //                 backgroundColor:
                //                     MaterialStateProperty.all(Colors.blue),
                //               ))
                //         ],
                //       ),
                //     ),
                //   ],
                // ))
              ],
          ),
      ),
    )
    );
  }
}
