// ignore_for_file: file_names, prefer_const_constructors, sort_child_properties_last, unused_import, unused_local_variable


import 'package:flutter/material.dart';
import 'package:online_patient/model/item.dart';
import 'package:online_patient/screen/Pharmacy/Detailspharmacy.dart';

class pharmacy extends StatelessWidget {
  const pharmacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        // leading:  IconButton(
        //               color: Colors.black,
        //               onPressed: () {Navigator.pushNamed(context, '/home');},
        //               icon: Icon(Icons.arrow_back),
        //             ),
              backgroundColor: Colors.white,
              title: const Text(
                "Pharmacy",
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
    
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                // childAspectRatio: 1 / 1,
                crossAxisSpacing: 50,
                mainAxisSpacing: 20),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailspharmacy(
                          productts: items[index],
                        ),
                      ));
                },
                child: GridTile(
                  child: Image.asset(
                    items[index].imgg,
                  ),
                  footer: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: GridTileBar(
                      trailing: IconButton(
                        icon: Icon(
                          Icons.add,
                        ),
                        onPressed: () {},
                        color: Colors.black,
                      ),
                      leading: Text(
                        "For More Details,Click on the post",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
