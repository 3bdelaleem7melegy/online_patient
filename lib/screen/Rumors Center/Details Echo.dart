import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_patient/screen/Booking/BookingScreen%20Echo.dart';

class EchoRumors extends StatelessWidget {
  const EchoRumors({super.key, required this.type1});
  final String type1;

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
        title:  Text(
          type1,
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
                Container(
                    child: Image.asset(
                  "assets/Echo Rumour.jpg",
                )),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            child: const Text(
                "Details:                                                                          Echo rays on the heart are a type of ultrasound examination, which means using a device to send high-frequency sound waves that cause echoes when they bounce in different parts of the body. This echo is captured by the device and converted into an animated image on the screen during the examination.",
                style: TextStyle(fontSize: 19)),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: Title(
                color: Colors.black,
                child: const Text(
                  "Active:24h",
                  style: TextStyle(fontSize: 25),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => bookingscreenEcho(
                        name: FirebaseAuth.instance.currentUser!.displayName ??
                            "",
                        type1: type1,
                        id: FirebaseAuth.instance.currentUser!.uid??""),
                  ));
            },
            child: const Text("Book Appointment"),
          )
        ],
      ),
    );
  }
}
