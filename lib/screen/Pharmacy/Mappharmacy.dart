// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables, file_names, avoid_print, sort_child_properties_last

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mappharmacy extends StatefulWidget {
  const Mappharmacy({super.key});

  @override
  State<Mappharmacy> createState() => _MappharmacyState();
}

class _MappharmacyState extends State<Mappharmacy> {
  // Completer _controller = Completer();
  var myMarker = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            // leading:  IconButton(
            //           color: Colors.black,
            //           onPressed: () {Navigator.pushNamed(context, '/Detailspharmacy');},
            //           icon: Icon(Icons.arrow_back),
            //         ),
          backgroundColor: Colors.blue[300],
          title: Text(
            "Map Pharmacy",
            style: TextStyle(fontSize: 25,color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            GoogleMap(
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: LatLng(30.03257912125153, 31.405029660646186),
                  zoom: 15),
              onMapCreated: (googleMapController) {
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(30.03257912125153, 31.405029660646186),
                    infoWindow: InfoWindow(
                        title: 'El Ezaby Pharmacy',
                        snippet: 'Marketing center',
                        onTap: () {
                          print('Done');
                        }),
                  ));
                });
              },
              markers: myMarker,
            ),

            // Container(
            //   child: Image.asset("assets/download.jpg"),
            //   alignment: Alignment.topCenter,
            // ),
            Container(
              child: Text(
                "Welcome",
                style: TextStyle(fontSize: 25),
              ),
              alignment: Alignment.bottomCenter,
            )
          ],
        ));
  }
}
