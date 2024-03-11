import 'package:flutter/material.dart';
// import 'package:online_patient/screen/Booking/BookingScreen%20Bone.dart';

class BoneRumors extends StatelessWidget {
  const BoneRumors({super.key});

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
          "Bone Rumor",
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


                Container(child:Image.asset("assets/Bone Rumor.jpg",))  ,
                const SizedBox(height: 20,),
              ],
            ),
          ),
          Container(child: const Text("Details:                                                                          Bone tumors develop when cells within a bone divide uncontrollably, forming a lump or mass of abnormal tissue.                                                     Most bone tumors are benign (not cancerous). Benign tumors are usually not life-threatening and, in most cases, will not spread to other parts of the body. Depending upon the type of tumor, treatment options are wide-ranging — from simple observation to surgery to remove the tumor.",style: TextStyle(fontSize: 19)),),

          const SizedBox(height: 30,),

          Container(child: Title(color: Colors.black, child: const Text("Active:24h",style: TextStyle(fontSize: 25),)),),

          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () async {
              // Navigator.push(context,MaterialPageRoute(builder: (context) => bookingscreenBone(  name: FirebaseAuth.instance.currentUser!.displayName??"", doctor: 'Bone Rumor ',) ,));
            }, child: const Text("Book Appointment"),)
        ],

      ),
    );
  }
}
