// ignore_for_file: unnecessary_null_comparison, file_names, unnecessary_import, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, non_constant_identifier_names, use_build_context_synchronously, avoid_unnecessary_containers, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_patient/app/models/Rumor.dart';
import 'package:online_patient/app/screens/auth/login_screen.dart';
import 'package:online_patient/screen/myAppointments.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class bookingscreenEcho extends StatefulWidget {
   final String type1;
  final String name;
  final String id;




  const bookingscreenEcho({required this.type1, required this.name, required this.id});
  @override
  _bookState createState() => _bookState();
}

class _bookState extends State<bookingscreenEcho> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _doctorController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();
  String timeText = 'Select Time';
  late String dateUTC;
  late String date_Time;

  FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;

  Future<void> _getUser() async {
    user = _auth.currentUser!;
  }

  Future<void> selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    ).then(
          (date) {
        setState(
              () {
            selectedDate = date!;
            String formattedDate =
            DateFormat('dd-MM-yyyy').format(selectedDate);
            _dateController.text = formattedDate;
            dateUTC = DateFormat('yyyy-MM-dd').format(selectedDate);
          },
        );
      },
    );
  }

  Future<void> selectTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
    );

    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    String formattedTime = localizations.formatTimeOfDay(selectedTime!,
        alwaysUse24HourFormat: false);

    if (formattedTime != null) {
      setState(() {
        timeText = formattedTime;
        _timeController.text = timeText;
      });
    }
    date_Time = selectedTime.toString().substring(10, 15);
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text(
        "OK",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyAppointments(),
          ),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Done!",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
        "Appointment is registered.",
        style: TextStyle(),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getUser();
    selectTime(context);
    _doctorController.text = widget.type1;
    _nameController.text = widget.name;
    _idController.text = widget.id;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Appointment booking',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          // onNotification: (OverscrollIndicatorNotification overscroll) {
          //   overscroll.disallowIndicator();
          //   return;
          // },
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                child: const Image(
                  image: AssetImage('assets/Echo Rumour.jpg'),
                  height: 250,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.only(top: 0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'Enter Patient Details',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(

                        controller: _nameController,
                        focusNode: f1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Patient Name';
                          }
                          return null;
                        },
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 10),
                          border: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          hintText: 'Patient Name*',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onFieldSubmitted: (String value) {
                          f1.unfocus();
                          FocusScope.of(context).requestFocus(f2);
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        focusNode: f2,
                        controller: _idController,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 10),
                          border: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          hintText: 'Mobile*',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Phone number';
                          } else if (value.length < 10) {
                            return 'Please Enter correct Phone number';
                          }
                          return null;
                        },
                        onFieldSubmitted: (String value) {
                          f2.unfocus();
                          FocusScope.of(context).requestFocus(f3);
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // TextFormField(
                      //   focusNode: f3,
                      //   controller: _descriptionController,
                      //   keyboardType: TextInputType.multiline,
                      //   maxLines: null,
                      //   style: const TextStyle(
                      //       fontSize: 18, fontWeight: FontWeight.bold),
                      //   decoration: InputDecoration(
                      //     contentPadding: const EdgeInsets.only(
                      //         left: 20, top: 10, bottom: 10),
                      //     border: const OutlineInputBorder(
                      //       borderRadius:
                      //       BorderRadius.all(Radius.circular(90.0)),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //     filled: true,
                      //     fillColor: Colors.grey[350],
                      //     hintText: 'Description',
                      //     hintStyle: const TextStyle(
                      //       color: Colors.black26,
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.w800,
                      //     ),
                      //   ),
                      //   onFieldSubmitted: (String value) {
                      //     f3.unfocus();
                      //     FocusScope.of(context).requestFocus(f4);
                      //   },
                      //   textInputAction: TextInputAction.next,
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      TextFormField(
                        controller: _doctorController,
                        validator: (value) {
                          if (value!.isEmpty) return 'Please enter Doctor name';
                          return null;
                        },
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 10),
                          border: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          hintText: 'Doctor Name*',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFormField(
                              focusNode: f4,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  left: 20,
                                  top: 10,
                                  bottom: 10,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(90.0)),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.grey[350],
                                hintText: 'Select Date*',
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              controller: _dateController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter the Date';
                                }
                                return null;
                              },
                              onFieldSubmitted: (String value) {
                                f4.unfocus();
                                FocusScope.of(context).requestFocus(f5);
                              },
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: ClipOval(
                                child: Material(
                                  color: Colors.indigo, // button color
                                  child: InkWell(
                                    // inkwell color
                                    child: const SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Icon(
                                        Icons.date_range_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap: () {
                                      selectDate(context);
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFormField(
                              focusNode: f5,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  left: 20,
                                  top: 10,
                                  bottom: 10,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(90.0)),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.grey[350],
                                hintText: 'Select Time*',
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              controller: _timeController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter the Time';
                                }
                                return null;
                              },
                              onFieldSubmitted: (String value) {
                                f5.unfocus();
                              },
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: ClipOval(
                                child: Material(
                                  color: Colors.indigo, // button color
                                  child: InkWell(
                                    // inkwell color
                                    child: const SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Icon(
                                        Icons.timer_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap: () {
                                      selectTime(context);
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.indigo,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print(_nameController.text);
                              print(_dateController.text);
                              print(widget.type1);
                              showAlertDialog(context);
                              _createAppointment();
                            }
                          },
                          child: const Text(
                            "Book Appointment",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createAppointment() async {
    print(dateUTC + ' ' + date_Time + ':00');
    FirebaseFirestore.instance
        .collection('Echo Rumor')
        .doc(user.email)
        .collection('all')
        .doc()
        .set({
      'name': _nameController.text,
      'phone': _idController.text,
      'description': _descriptionController.text,
      'doctor': _doctorController.text,
      'date': DateTime.parse('$dateUTC $date_Time:00'),
    }, SetOptions(merge: true));
     FirebaseFirestore.instance
        .collection('Echo Rumor')
        .doc(user.email)
        .collection('pending')
        .doc()
        .set({
      'name': _nameController.text,
      'phone': _idController.text,
      'description': _descriptionController.text,
      'doctor': _doctorController.text,
      'date': DateTime.parse('$dateUTC $date_Time:00'),
    }, SetOptions(merge: true));

      final model = Rumor(
      id: DateTime.now().toString(),
      type1: widget.type1,
      date: DateTime.parse('$dateUTC $date_Time:00').toString(),
      patient: patient!,
      description: _descriptionController.text.trim(),
    );
    try {
  await FirebaseFirestore.instance
      .collection('Rumor')
      .doc(model.id)
      .set(model.toFireStore(), SetOptions(merge: true));
} on Exception catch (e) {
  log(e.toString());
}
  }
}
