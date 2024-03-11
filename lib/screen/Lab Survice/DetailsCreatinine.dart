import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:online_patient/screen/Booking/bookingscreen%20Creatinine.dart';

class CreatinineTest extends StatelessWidget {
  const CreatinineTest({super.key});

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
          "Creatinine Test",
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

           
  Container(padding:const EdgeInsets.only(left: 20) ,child:Image.asset("assets/Labs4.jpg",),)  ,   
      const SizedBox(height: 20,),
          ],
            ),
          ),
          Container(child: const Text("Details:                                                                            Kidney analysis and function tests are conducted to find out whether the kidneys are working within the normal range or not. These tests show the level of blood urea, creatinine, uric acid, and other minerals in the body. The values ​​of the test results are compared to the normal values ​​of these tests.Liver function tests are blood tests used to help find the cause of symptoms and monitor the status of liver disease or damage. The tests measure levels of certain enzymes and proteins in the blood.",style: TextStyle(fontSize: 19)),),
        
        const SizedBox(height: 30,),
                Container(child: Title(color: Colors.black, child: const Text("Active:24h",style: TextStyle(fontSize: 25),)),),
        const SizedBox(height: 20,),

ElevatedButton(
                      onPressed: () async {
                        // Navigator.push(context,MaterialPageRoute(builder: (context) => bookingscreenCreatinine(  name: FirebaseAuth.instance.currentUser!.displayName??"", doctor: 'Creatinine Test',) ,));
                      }, child: const Text("Book Appointment"),)        ],
        
      ),
    );
  }
}
