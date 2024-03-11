import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:online_patient/screen/Booking/bookingscreen%20LiveFunction.dart';

class LiveFunctionTest extends StatelessWidget {
  const LiveFunctionTest({super.key});

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
          "Live Function Test",
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

           
  Container(padding:const EdgeInsets.only(left: 20) ,child:Image.asset("assets/Labs5.jpg",),)  ,   
      const SizedBox(height: 20,),
          ],
            ),
          ),
          Container(child: const Text("Details:                                                                            Some of these tests measure how well the liver is performing its usual functions of producing protein and getting rid of bilirubin, a waste product of the blood. Other liver function tests measure enzymes secreted by liver cells in response to damage or disease",style: TextStyle(fontSize: 19)),),
        
        const SizedBox(height: 30,),
  Container(child: Title(color: Colors.black, child: const Text("Active:24h",style: TextStyle(fontSize: 25),)),),
        const SizedBox(height: 20,),

ElevatedButton(
                      onPressed: () async {
                        // Navigator.push(context,MaterialPageRoute(builder: (context) => bookingscreenLiveFunction(  name: FirebaseAuth.instance.currentUser!.displayName??"", doctor: 'Live Function Test',) ,));
                      }, child: const Text("Book Appointment"),)         ],
        
      ),
    );
  }
}
