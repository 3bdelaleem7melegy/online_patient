import 'package:flutter/material.dart';
// import 'package:online_patient/screen/Booking/bookingScreen%20Heartt.dart';

class HeartRumors extends StatelessWidget {
  const HeartRumors({super.key});

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
          "Heart Rumor",
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


                Container(child:Image.asset("assets/Heart Rumor.jpg",))  ,
                const SizedBox(height: 20,),
              ],
            ),
          ),
          Container(child: const Text("Details:                                                                          Cardiac tumors are growths that can develop in many different parts of your heart. Primary heart tumors begin in your heart and may be cancerous or noncancerous. Metastatic heart tumors develop when cancer spreads to your heart from elsewhere in your body. Your outlook depends on the type of tumor, its size and its location within your heart.",style: TextStyle(fontSize: 19)),),

          const SizedBox(height: 30,),

          Container(child: Title(color: Colors.black, child: const Text("Active:24h",style: TextStyle(fontSize: 25),)),),

          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () async {
              // Navigator.push(context,MaterialPageRoute(builder: (context) => bookingscreenHeartt(  name: FirebaseAuth.instance.currentUser!.displayName??"", doctor: 'Heart Rumor ',) ,));
            }, child: const Text("Book Appointment"),)
        ],

      ),
    );
  }
}
