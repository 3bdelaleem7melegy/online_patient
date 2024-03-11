// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:online_patient/app/screens/doctor/Special_List.dart';
import 'package:online_patient/model/bannerModel.dart';


class SpecialList extends StatefulWidget {
  const SpecialList({super.key});

  @override
  State<SpecialList> createState() => _OrthopaedicState();
}

class _OrthopaedicState extends State<SpecialList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: Text(
          "Specialists",
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      // body: Column(
      //   children: [
      //     Container(
      //       padding: EdgeInsets.all(10),
      //       child: SingleChildScrollView(
      //         scrollDirection: Axis.horizontal,
      //         child: Row(
      //           children: [
      //             Container(
      //               padding: EdgeInsets.only(top: 70),
      //               child: Column(
      //                 children: [
      //                   ElevatedButton(
      //                       onPressed: () {
      //                         Navigator.pushNamed(context, '/Cardiologist');
      //                       },
      //                       child: Icon(Icons.heart_broken, size: 120)),
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
      //               width: 70,
      //             ),
      //             Container(
      //               padding: EdgeInsets.only(top: 70),

      //               child: Column(
      //                 children: [
      //                   ElevatedButton(
      //                       onPressed: () {
      //                         Navigator.pushNamed(context, '/Dentist');
      //                       },
      //                       child:
      //                       Icon(Icons.earbuds_battery_outlined, size: 120)),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     "Dentist",
      //                     style: TextStyle(fontSize: 20),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Container(
      //       child: SingleChildScrollView(
      //         scrollDirection: Axis.horizontal,

      //         child: Row(

      //           children: [
      //             Container(
      //               padding: EdgeInsets.all(10),

      //               child: Column(
      //                 children: [
      //                   ElevatedButton(
      //                       onPressed: () {
      //                         Navigator.pushNamed(context, '/EyeSpecial');
      //                       },
      //                       child: Icon(Icons.heart_broken, size: 120)),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     "Eye Special",
      //                     style: TextStyle(fontSize: 20),
      //                   )
      //                 ],
      //               ),
      //             ),
      //             SizedBox(
      //               width: 70,
      //             ),
      //             Container(
      //               child: Column(
      //                 children: [
      //                   ElevatedButton(
      //                       onPressed: () {
      //                         Navigator.pushNamed(context, '/PaediatricianSpecial');
      //                       },
      //                       child:
      //                       Icon(Icons.baby_changing_station, size: 120)),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     "Paediatrician",
      //                     style: TextStyle(fontSize: 20),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Container(
      //       child: SingleChildScrollView(
      //         scrollDirection: Axis.horizontal,

      //         child: Row(

      //           children: [
      //             Container(
      //               padding: EdgeInsets.all( 10),
      //               child: Column(
      //                 children: [

      //                   ElevatedButton(

      //                       onPressed: () {
      //                         Navigator.pushNamed(context, '/Earandnosedoctors');
      //                       },
      //                       child: Icon(Icons.noise_aware, size: 120)),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     "Ear, nose doctors",
      //                     style: TextStyle(fontSize: 20),
      //                   )
      //                 ],
      //               ),
      //             ),
      //             SizedBox(
      //               width: 70,
      //             ),
      //             Container(
      //               child: Column(
      //                 children: [
      //                   ElevatedButton(
      //                       onPressed: () {
      //                         Navigator.pushNamed(context, '/PaediatricianSpecial');
      //                       },
      //                       child:
      //                       Icon(Icons.no_backpack, size: 120)),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     "Oncologists",
      //                     style: TextStyle(fontSize: 20),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ));

      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [

      //      SizedBox(
      //       height: 150,
      //       width: MediaQuery.of(context).size.width,
      //       child: CarouselSlider.builder(
      //         itemCount: bannerCardsSpecial1.length,
      //         itemBuilder: (context, index, realIndex) {
      //           return Container(

      //             //alignment:  Alignment.centerLeft,
      //             //width: MediaQuery.of(context).size.width,
      //             height: 140,
      //             margin: EdgeInsets.only(left: 0, right: 0, bottom: 20 ,top: 10),
      //             padding: EdgeInsets.only(left: 0),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               gradient: LinearGradient(
      //                 stops: const [0.3, 0.7],
      //                 begin: Alignment.centerLeft,
      //                 end: Alignment.centerRight,
      //                 colors: bannerCardsSpecial1[index].cardBackground,
      //               ),
      //             ),
      //             child: GestureDetector(
      //               onTap: () {
      //                 if (index == 0) {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(builder: (BuildContext context) {
      //                       return Cardiologist();
      //                     }),
      //                   );
      //                 }
      //               },
      //               child: Stack(
      //                 children: [
      //                   Image.asset(
      //                     bannerCardsSpecial[index].image,
      //                     //'assets/414.jpg',
      //                     fit: BoxFit.fitHeight,
      //                   ),
      //                   Container(
      //                     padding: EdgeInsets.only(top: 7, right: 5),
      //                     alignment: Alignment.topRight,
      //                     child: Row(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       mainAxisAlignment: MainAxisAlignment.end,
      //                       children: [
      //                         Text(
      //                           bannerCardsSpecial[index].text,
      //                           //'Check Disease',
      //                           style:TextStyle(
      //                             color: Colors.lightBlue[900],
      //                             fontWeight: FontWeight.bold,
      //                             fontSize: 15,
      //                           ),
      //                         ),
      //                         Icon(
      //                           Icons.chevron_right_rounded,
      //                           color: Colors.lightBlue[900],
      //                           size: 20,
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           );
      //         },
      //         options: CarouselOptions(
      //           autoPlay: true,
      //           enlargeCenterPage: true,
      //           enableInfiniteScroll: false,
      //           scrollPhysics: ClampingScrollPhysics(),
      //         ),
      //       ),
      //     ),
      //       // SizedBox(height: 10,),
      //       SizedBox(
      //         height: 150,
      //         width: MediaQuery.of(context).size.width,
      //         child: CarouselSlider.builder(
      //           itemCount: bannerCardsSpecial2.length,
      //           itemBuilder: (context, index, realIndex) {
      //             return Container(

      //               //alignment:  Alignment.centerLeft,
      //               //width: MediaQuery.of(context).size.width,
      //               height: 140,
      //               margin: EdgeInsets.only(left: 0, right: 0, bottom: 20 ,top: 10),
      //               padding: EdgeInsets.only(left: 0),
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 gradient: LinearGradient(
      //                   stops: const [0.3, 0.7],
      //                   begin: Alignment.centerLeft,
      //                   end: Alignment.centerRight,
      //                   colors: bannerCardsSpecial1[index].cardBackground,
      //                 ),
      //               ),
      //               child: GestureDetector(
      //                 onTap: () {
      //                   if (index == 0) {
      //                     Navigator.push(
      //                       context,
      //                       MaterialPageRoute(builder: (BuildContext context) {
      //                         return Dentist();
      //                       }),
      //                     );
      //                   }
      //                 },
      //                 child: Stack(
      //                   children: [
      //                     Image.asset(
      //                       bannerCardsSpecial2[index].image,
      //                       //'assets/414.jpg',
      //                       fit: BoxFit.fitHeight,
      //                     ),
      //                     Container(
      //                       padding: EdgeInsets.only(top: 7, right: 5),
      //                       alignment: Alignment.topRight,
      //                       child: Row(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         mainAxisAlignment: MainAxisAlignment.end,
      //                         children: [
      //                           Text(
      //                             bannerCardsSpecial2[index].text,
      //                             //'Check Disease',
      //                             style:TextStyle(
      //                               color: Colors.lightBlue[900],
      //                               fontWeight: FontWeight.bold,
      //                               fontSize: 15,
      //                             ),
      //                           ),
      //                           Icon(
      //                             Icons.chevron_right_rounded,
      //                             color: Colors.lightBlue[900],
      //                             size: 20,
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           },
      //           options: CarouselOptions(
      //             autoPlay: true,
      //             enlargeCenterPage: true,
      //             enableInfiniteScroll: false,
      //             scrollPhysics: ClampingScrollPhysics(),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 150,
      //         width: MediaQuery.of(context).size.width,
      //         child: CarouselSlider.builder(
      //           itemCount: bannerCardsSpecial3.length,
      //           itemBuilder: (context, index, realIndex) {
      //             return Container(

      //               //alignment:  Alignment.centerLeft,
      //               //width: MediaQuery.of(context).size.width,
      //               height: 140,
      //               margin: EdgeInsets.only(left: 0, right: 0, bottom: 20 ,top: 10),
      //               padding: EdgeInsets.only(left: 0),
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 gradient: LinearGradient(
      //                   stops: const [0.3, 0.7],
      //                   begin: Alignment.centerLeft,
      //                   end: Alignment.centerRight,
      //                   colors: bannerCardsSpecial1[index].cardBackground,
      //                 ),
      //               ),
      //               child: GestureDetector(
      //                 onTap: () {
      //                   if (index == 0) {
      //                     Navigator.push(
      //                       context,
      //                       MaterialPageRoute(builder: (BuildContext context) {
      //                         return EyeSpecial();
      //                       }),
      //                     );
      //                   }
      //                 },
      //                 child: Stack(
      //                   children: [
      //                     Image.asset(
      //                       bannerCardsSpecial3[index].image,
      //                       //'assets/414.jpg',
      //                       fit: BoxFit.fitHeight,
      //                     ),
      //                     Container(
      //                       padding: EdgeInsets.only(top: 7, right: 5),
      //                       alignment: Alignment.topRight,
      //                       child: Row(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         mainAxisAlignment: MainAxisAlignment.end,
      //                         children: [
      //                           Text(
      //                             bannerCardsSpecial3[index].text,
      //                             //'Check Disease',
      //                             style:TextStyle(
      //                               color: Colors.lightBlue[900],
      //                               fontWeight: FontWeight.bold,
      //                               fontSize: 15,
      //                             ),
      //                           ),
      //                           Icon(
      //                             Icons.chevron_right_rounded,
      //                             color: Colors.lightBlue[900],
      //                             size: 20,
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           },
      //           options: CarouselOptions(
      //             autoPlay: true,
      //             enlargeCenterPage: true,
      //             enableInfiniteScroll: false,
      //             scrollPhysics: ClampingScrollPhysics(),
      //           ),
      //         ),
      //       ),

      //       SizedBox(
      //         height: 150,
      //         width: MediaQuery.of(context).size.width,
      //         child: CarouselSlider.builder(
      //           itemCount: bannerCardsSpecial4.length,
      //           itemBuilder: (context, index, realIndex) {
      //             return Container(

      //               //alignment:  Alignment.centerLeft,
      //               //width: MediaQuery.of(context).size.width,
      //               height: 140,
      //               margin: EdgeInsets.only(left: 0, right: 0, bottom: 20 ,top: 10),
      //               padding: EdgeInsets.only(left: 0),
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 gradient: LinearGradient(
      //                   stops: const [0.3, 0.7],
      //                   begin: Alignment.centerLeft,
      //                   end: Alignment.centerRight,
      //                   colors: bannerCardsSpecial1[index].cardBackground,
      //                 ),
      //               ),
      //               child: GestureDetector(
      //                 onTap: () {
      //                   if (index == 0) {
      //                     Navigator.push(
      //                       context,
      //                       MaterialPageRoute(builder: (BuildContext context) {
      //                         return PaediatricianSpecial();
      //                       }),
      //                     );
      //                   }
      //                 },
      //                 child: Stack(
      //                   children: [
      //                     Image.asset(
      //                       bannerCardsSpecial4[index].image,
      //                       //'assets/414.jpg',
      //                       fit: BoxFit.fitHeight,
      //                     ),
      //                     Container(
      //                       padding: EdgeInsets.only(top: 7, right: 5),
      //                       alignment: Alignment.topRight,
      //                       child: Row(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         mainAxisAlignment: MainAxisAlignment.end,
      //                         children: [
      //                           Text(
      //                             bannerCardsSpecial4[index].text,
      //                             //'Check Disease',
      //                             style:TextStyle(
      //                               color: Colors.lightBlue[900],
      //                               fontWeight: FontWeight.bold,
      //                               fontSize: 15,
      //                             ),
      //                           ),
      //                           Icon(
      //                             Icons.chevron_right_rounded,
      //                             color: Colors.lightBlue[900],
      //                             size: 20,
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           },
      //           options: CarouselOptions(
      //             autoPlay: true,
      //             enlargeCenterPage: true,
      //             enableInfiniteScroll: false,
      //             scrollPhysics: ClampingScrollPhysics(),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 150,
      //         width: MediaQuery.of(context).size.width,
      //         child: CarouselSlider.builder(
      //           itemCount: bannerCardsSpecial5.length,
      //           itemBuilder: (context, index, realIndex) {
      //             return Container(

      //               //alignment:  Alignment.centerLeft,
      //               //width: MediaQuery.of(context).size.width,
      //               height: 140,
      //               margin: EdgeInsets.only(left: 0, right: 0, bottom: 20 ,top: 10),
      //               padding: EdgeInsets.only(left: 0),
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 gradient: LinearGradient(
      //                   stops: const [0.3, 0.7],
      //                   begin: Alignment.centerLeft,
      //                   end: Alignment.centerRight,
      //                   colors: bannerCardsSpecial1[index].cardBackground,
      //                 ),
      //               ),
      //               child: GestureDetector(
      //                 onTap: () {
      //                   if (index == 0) {
      //                     Navigator.push(
      //                       context,
      //                       MaterialPageRoute(builder: (BuildContext context) {
      //                         return orthopedics ();
      //                       }),
      //                     );
      //                   }
      //                 },
      //                 child: Stack(
      //                   children: [
      //                     Image.asset(
      //                       bannerCardsSpecial5[index].image,
      //                       //'assets/414.jpg',
      //                       fit: BoxFit.fitHeight,
      //                     ),
      //                     Container(
      //                       padding: EdgeInsets.only(top: 7, right: 5),
      //                       alignment: Alignment.topRight,
      //                       child: Row(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         mainAxisAlignment: MainAxisAlignment.end,
      //                         children: [
      //                           Text(
      //                             bannerCardsSpecial5[index].text,
      //                             //'Check Disease',
      //                             style:TextStyle(
      //                               color: Colors.lightBlue[900],
      //                               fontWeight: FontWeight.bold,
      //                               fontSize: 15,
      //                             ),
      //                           ),
      //                           Icon(
      //                             Icons.chevron_right_rounded,
      //                             color: Colors.lightBlue[900],
      //                             size: 20,
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           },
      //           options: CarouselOptions(
      //             autoPlay: true,
      //             enlargeCenterPage: true,
      //             enableInfiniteScroll: false,
      //             scrollPhysics: ClampingScrollPhysics(),
      //           ),
      //         ),
      //       ),
      //   ],
      //   ),
      // ),
      body: ListView.builder(
        itemCount: bannerSpecial1.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, i) =>  Container(
                //alignment:  Alignment.centerLeft,
                //width: MediaQuery.of(context).size.width,
                height: 140,
                margin: EdgeInsets.only(left: 0, right: 0, bottom: 20, top: 10),
                padding: EdgeInsets.only(left: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    stops: const [0.3, 0.7],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: bannerSpecial1[i].cardBackground,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return SpecailList(specailList:  bannerSpecial1[i].text);
                        }),
                      );
                    
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        bannerSpecial1[i].image,
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
                              bannerSpecial1[i].text,
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
              ),
            
  
        
      ),
    );
  }
}
