// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:online_patient/firestore-data/myAppointmentListEcho.dart';

import 'package:online_patient/firestore-data/myAppointmentList.dart';
import 'package:online_patient/firestore-data/myAppointmentsArchiveList.dart';

class MyAppointments extends StatefulWidget {
  const MyAppointments({super.key});

  @override
  _MyAppointmentsState createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
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
              'My Appointments',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(),
                child: const MyAppointmentListLabs(),
              ),
              Container(
                padding: const EdgeInsets.only(),
                child: const myAppointmentsArchiveList(),
              ),
             Container(
                padding: const EdgeInsets.only(),
                child: const myAppointmentListEcho(),
              ),
             
             
            ],
          ),
        )
    );
  }
}
