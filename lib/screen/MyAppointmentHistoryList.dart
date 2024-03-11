// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_patient/firestore-data/appointmentHistoryList.dart';
import 'package:online_patient/firestore-data/appointmentHistoryListEcho.dart';
import 'package:online_patient/firestore-data/appointmentarchiveHistoryList.dart';

class MyAppointmentHistory extends StatefulWidget {
  const MyAppointmentHistory({super.key});

  @override
  _MyAppointmentsState createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointmentHistory> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;

  Future<void> _getUser() async {
    user = _auth.currentUser!;
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              'My Appointment History',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(),
                child: const AppointmentHistoryLabs(),  ),
                Container(
                padding: const EdgeInsets.only(),
                child: const appointmentarchiveHistoryList(),  ),
                Container(
                padding: const EdgeInsets.only(),
                child: const appointmentHistoryListEcho(),  ),
              
            ],
          ),

        )

    );
  }
}
