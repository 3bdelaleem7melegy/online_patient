// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, file_names

import 'package:flutter/material.dart';
import 'package:online_patient/model/item.dart';

class Detailspharmacy extends StatefulWidget {
  Item productts;
  Detailspharmacy({required this.productts});

  @override
  State<Detailspharmacy> createState() => _DetailspharmacyState();
}

class _DetailspharmacyState extends State<Detailspharmacy> {
  bool isshowmore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading:  IconButton(
                      color: Colors.black,
                      onPressed: () {Navigator.pushNamed(context, '/pharmacy');},
                      icon: Icon(Icons.arrow_back),
                    ),
              backgroundColor: Colors.white,
              title: const Text(
                "Details pharmacy",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              centerTitle: true,
              
            ),
            
            
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40),
        // scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Image.asset(widget.productts.imgg),
            
            SizedBox(
              height: 10,
            ),
            
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Rate this post:",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.edit_location,
                      size: 22,
                      color: Colors.black,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/Mappharmacy');
                        },
                        child: Text(
                          widget.productts.location,
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Details :${widget.productts.Text}",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.start,
                maxLines: isshowmore ? 2 : null,
                overflow: TextOverflow.fade,
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    isshowmore = !isshowmore;
                  });
                },
                child: Text(
                  isshowmore ? "Show More" : "Show Less",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}
