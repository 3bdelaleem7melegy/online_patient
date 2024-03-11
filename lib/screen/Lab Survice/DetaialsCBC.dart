import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:online_patient/screen/Booking/bookingscreenCBC.dart';

class CBCTEST extends StatelessWidget {
  const CBCTEST({super.key});

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
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "CBC Test",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body:Column(
        
        children: [
          Container(
            child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),

           
  Container(padding:const EdgeInsets.only(left: 20) ,child:Image.asset("assets/Labs2.jpg",),)  ,   
      const SizedBox(height: 20,),
          ],
            ),
          ),
          Container(child: const Text("Details:                                                                            A complete blood count (complete blood count) is a type of blood test. This test is used to examine the general health condition and detect a large number of medical conditions such as anemia, infection, and leukemia. A complete blood count test measures the following: The number of red blood cells that carry oxygen.",style: TextStyle(fontSize: 19)),),
        
        const SizedBox(height: 30,),
        Container(child: Title(color: Colors.black, child: const Text("Active:24h",style: TextStyle(fontSize: 25),)),),
                
        const SizedBox(height: 20,),
        ElevatedButton(
                      onPressed: () async {
                        // Navigator.push(context,MaterialPageRoute(builder: (context) => bookingscreenCBC(  name: FirebaseAuth.instance.currentUser!.displayName??"", doctor: 'CBC Test', id: FirebaseAuth.instance.currentUser!.uid??"",) ,));
                      }, child: const Text("Book Appointment"),)
        ],
        
      ),
    );
  }
}
