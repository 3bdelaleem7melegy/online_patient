import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:online_patient/screen/Booking/bookingscreen%20Heart.dart';

class HeartTest extends StatelessWidget {
  const HeartTest({super.key});

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
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Heart Test",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        centerTitle: true,
      ),
  body: Column(
        
        children: [
          Container(
            child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),

           
  Container(padding:const EdgeInsets.only(left: 20) ,child:Image.asset("assets/Labs3.jpg",),)  ,   
      const SizedBox(height: 20,),
          ],
            ),
          ),
          Container(child: const Text("Details:                                                                           Electrocardiogram: Checking your heart rate and knowing the amount of electrical activity passing through your heart muscles allows doctors to detect health problems in the structure of the heart and in its rhythm. Echocardiography: Doctors use ultrasound waves to examine the functions, structure, and shape of the heart. This helps detect heart diseases at the earliest possible stage.",style: TextStyle(fontSize: 19)),),
        
        const SizedBox(height: 30,),
      
        Container(child: Title(color: Colors.black, child: const Text("Active:24h",style: TextStyle(fontSize: 25),)),),
                
        const SizedBox(height: 20,),
        ElevatedButton(
                      onPressed: () async {
                        // Navigator.push(context,MaterialPageRoute(builder: (context) => bookingscreenHeart(  name: FirebaseAuth.instance.currentUser!.displayName??"", doctor: 'Heart Test ',) ,));
                      }, child: const Text("Book Appointment"),)
        ],
        
      ),
    );
  }
}
