import 'package:flutter/material.dart';
// import 'package:online_patient/screen/Booking/BookingScreen%20CT.dart';

class CTRumors extends StatelessWidget {
  const CTRumors({super.key});

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
          "CT Scan",
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


                Container(child:Image.asset("assets/CT scan.jpg",))  ,
                const SizedBox(height: 20,),
              ],
            ),
          ),
          Container(child: const Text("Details:                                                                         A computerized tomography (CT) scan combines a series of X-ray images taken from different angles around your body and uses computer processing to create cross-sectional images (slices) of the bones, blood vessels and soft tissues inside your body. CT scan images provide more-detailed information than plain X-rays do.",style: TextStyle(fontSize: 19)),),

          const SizedBox(height: 30,),

          Container(child: Title(color: Colors.black, child: const Text("Active:24h",style: TextStyle(fontSize: 25),)),),

          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () async {
              // Navigator.push(context,MaterialPageRoute(builder: (context) => bookingscreenCT(  name: FirebaseAuth.instance.currentUser!.displayName??"", doctor: 'CT Scan ',) ,));
            }, child: const Text("Book Appointment"),)
        ],

      ),
    );
  }
}
