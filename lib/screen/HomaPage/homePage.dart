// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, file_names, library_private_types_in_public_api, unused_element, avoid_unnecessary_containers, prefer_const_constructors, deprecated_member_use

import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:online_patient/firestore-data/searchList.dart';
import 'package:online_patient/model/bannerModel.dart';
import 'package:online_patient/model/carouselSliderSpecialSpecail.dart';
import 'package:online_patient/screen/DoctorsVideoCall/Videocall.dart';
import 'package:online_patient/screen/HomaPage/carouselSliderSpecial.dart';
import 'package:online_patient/screen/videocall/Call.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_patient/screen/HomaPage/carouselSlider.dart';
import 'package:online_patient/firestore-data/notificationList.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _doctorName = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;

  Future<void> _getUser() async {
    user = _auth.currentUser!;
  }

  Future _signOut() async {
    await _auth.signOut();
  }

  @override
  void initState() {
    super.initState();
    _getUser();
    _doctorName = TextEditingController();
  }

  @override
  void dispose() {
    _doctorName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late String _message;
    DateTime now = DateTime.now();
    String _currentHour = DateFormat('kk').format(now);
    int hour = int.parse(_currentHour);

    setState(
      () {
        if (hour >= 5 && hour < 12) {
          _message = 'Good Morning';
        } else if (hour >= 12 && hour <= 17) {
          _message = 'Good Afternoon';
        } else {
          _message = 'Good Evening';
        }
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[Container()],
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                //width: MediaQuery.of(context).size.width/1.3,
                alignment: Alignment.center,
                child: Text(
                  _message,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                width: 55,
              ),
              IconButton(
                splashRadius: 20,
                icon: const Icon(Icons.notifications_active),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contex) => const NotificationList()));
                },
              ),
            ],
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          // onNotification: (OverscrollIndicatorNotification overscroll) {
          //   overscroll.disallowIndicator();
          //   return;
          // },
          child: ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20, bottom: 10),
                    child: Text(
                      "Hello ${user.displayName}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20, bottom: 25),
                    child: const Text(
                      "Let's Find Your\nDoctor",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
                    child: TextFormField(
                      textInputAction: TextInputAction.search,
                      controller: _doctorName,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 20, top: 10, bottom: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Search doctor',
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[900]?.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IconButton(
                            iconSize: 20,
                            splashRadius: 20,
                            color: Colors.white,
                            icon: const Icon(Icons.search),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                      onFieldSubmitted: (String value) {
                        setState(
                          () {
                            value.isEmpty
                                ? Container()
                                // : Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => SearchList(
                                //         searchKey: value,
                                //       ),
                                //     ),
                                //   );
                                : Navigator.push(context, MaterialPageRoute(builder: (context) => SearchList(searchKey: value),));
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 23, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "We care for you",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Carouselslider(),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Specialists",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CarouselsliderSpecial(),
                  ),
                  // SingleChildScrollView(
                  //     scrollDirection: Axis.horizontal,
                  //     child: Row(children: [
                  //       Container(
                  //         padding: EdgeInsets.symmetric(
                  //             horizontal: 10, vertical: 10),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(15),
                  //           color: Colors.white,
                  //         ),
                  //         child: Column(
                  //           children: [
                  //             Container(
                  //               child: Column(
                  //                 children: [
                  //                   ElevatedButton(
                  //                       onPressed: () {
                  //                         Navigator.pushNamed(
                  //                             context, '/Cardiologist');
                  //                       },
                  //                       child: Icon(CupertinoIcons.heart,
                  //                           size: 120)),
                  //                   SizedBox(
                  //                     height: 5,
                  //                   ),
                  //                   Text(
                  //                     "Cardiologist",
                  //                     style: TextStyle(fontSize: 20),
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //             SizedBox(
                  //               width: 10,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         padding: EdgeInsets.symmetric(
                  //             horizontal: 10, vertical: 10),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(15),
                  //           color: Colors.white,
                  //         ),
                  //         child: Column(children: [
                  //           Container(
                  //             child: Column(
                  //               children: [
                  //                 ElevatedButton(
                  //                     onPressed: () {
                  //                       Navigator.pushNamed(
                  //                           context, '/Dentist');
                  //                     },
                  //                     child: Icon(
                  //                         Icons.density_medium_sharp,
                  //                         size: 120)),
                  //                 SizedBox(
                  //                   height: 5,
                  //                 ),
                  //
                  //                 Text(
                  //                   "Dentist",
                  //                   style: TextStyle(fontSize: 20),
                  //                 )
                  //               ],
                  //             ),
                  //           )
                  //         ]),
                  //       ),
                  //       SizedBox(
                  //         width: 3,
                  //       ),
                  //       Container(
                  //         padding: EdgeInsets.symmetric(
                  //             horizontal: 10, vertical: 10),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(15),
                  //           color: Colors.white,
                  //         ),
                  //         child: Column(children: [
                  //           Container(
                  //             child: Column(
                  //               children: [
                  //                 ElevatedButton(
                  //                     onPressed: () {
                  //                       Navigator.pushNamed(
                  //                           context, '/EyeSpecial');
                  //                     },
                  //                     child: Icon(Icons.remove_red_eye_outlined,
                  //                         size: 120)),
                  //                 SizedBox(
                  //                   height: 5,
                  //                 ),
                  //                 Text(
                  //                   "Eye Special",
                  //                   style: TextStyle(fontSize: 20),
                  //                 )
                  //               ],
                  //             ),
                  //           )
                  //         ]),
                  //       ),
                  //       SizedBox(
                  //         width: 3,
                  //       ),
                  //       Container(
                  //         padding: EdgeInsets.symmetric(
                  //             horizontal: 10, vertical: 10),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(15),
                  //           color: Colors.white,
                  //         ),
                  //         child: Column(children: [
                  //           Container(
                  //             child: Column(
                  //               children: [
                  //                 ElevatedButton(
                  //                     onPressed: () {
                  //                       Navigator.pushNamed(
                  //                           context, '/Orthopaedic');
                  //                     },
                  //                     child: Icon(Icons.ads_click,
                  //                         size: 120)),
                  //                 SizedBox(
                  //                   height: 5,
                  //                 ),
                  //                 Text(
                  //                   "alot of",
                  //                   style: TextStyle(fontSize: 20),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //         ]),
                  //       ),
                        SizedBox(
                          width: 3,
                        ),
                        // Container(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 10, vertical: 10),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(15),
                        //     color: Colors.white,
                        //   ),
                        //   child: Column(children: [
                        //     // Container(
                        //     //   child: Column(
                        //     //     children: [
                        //     //       ElevatedButton(
                        //     //           onPressed: () {
                        //     //             Navigator.pushNamed(
                        //     //                 context, '/Paediatrician');
                        //     //           },
                        //     //           child: Icon(Icons.baby_changing_station,
                        //     //               size: 120)),
                        //     //       SizedBox(
                        //     //         height: 5,
                        //     //       ),
                        //     //       Text(
                        //     //         "Paediatrician",
                        //     //         style: TextStyle(fontSize: 20),
                        //     //       )
                        //     //     ],
                        //     //   ),
                        //     // )
                        //   ]),
                        // ),
                      // ])),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Communication with Doctors",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Container(
                  //   padding: const EdgeInsets.only(left: 15, right: 15),
                  //   // child: const TopRatedList(),
                  //
                  // ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: 10, vertical: 10),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(15),
                  //     color: Colors.white,
                  //   ),
                  //   child: Column(children: [
                  //     Container(
                  //       child: Column(
                  //         children: [
                  //           ElevatedButton(
                  //               onPressed: () {
                  //                 Navigator.pushNamed(
                  //                     context, '/videocallSpecial');
                  //               },
                  //               child: Icon(Icons.video_call,
                  //                   size: 120)),
                  //           SizedBox(
                  //             height: 5,
                  //           ),
                  //           Text(
                  //             "Video Call",
                  //             style: TextStyle(fontSize: 20),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ]),
                  // ),
          SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: bannerCardsSpecial6.length,
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
                      stops: const [0.3, 0.7],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: bannerSpecial[index].cardBackground,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
index==0
                           ?Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return videocallSpecial();
                          }))
                           :Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                      return Call();
                      }));


                    },
                    child: Stack(
                      children: [
                        Image.asset(
                          bannerCardsSpecial6[index].image,
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
                                bannerCardsSpecial6[index].text,
                                //'Check Disease',
                                style:TextStyle(
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
          ),
                  const SizedBox(
                    height: 20,
                  ),



                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
