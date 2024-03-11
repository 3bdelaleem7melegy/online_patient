import 'package:flutter/material.dart';
// import 'package:online_patient/screen/Booking/BookingScreen%20Brain.dart';

class BrainRumors extends StatelessWidget {
  const BrainRumors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, '/RumorsCenter');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Brain Rumor",
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


                Container(child:Image.asset("assets/Brain Rumor.jpg",))  ,
                const SizedBox(height: 20,),
              ],
            ),
          ),
          Container(child: const Text("Details:                                                                          A brain tumor is a growth of cells in the brain or near it. Brain tumors can happen in the brain tissue. Brain tumors also can happen near the brain tissue. Nearby locations include nerves, the pituitary gland, the pineal gland, and the membranes that cover the surface of the brain.",style: TextStyle(fontSize: 19)),),

          const SizedBox(height: 30,),

          Container(child: Title(color: Colors.black, child: const Text("Active:24h",style: TextStyle(fontSize: 25),)),),

          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () async {
              // Navigator.push(context,MaterialPageRoute(builder: (context) => bookingscreenBrain(  name: FirebaseAuth.instance.currentUser!.displayName??"", doctor: 'Brain Rumor ',) ,));
            }, child: const Text("Book Appointment"),)
        ],

      ),
    );
  }
}
