// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields, unnecessary_null_comparison, unused_import, equal_keys_in_map

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_patient/NoteDoctors/constants.dart';
import 'package:online_patient/NoteDoctors/cubits/notes_cubit/notes_cubit.dart';
import 'package:online_patient/NoteDoctors/main.dart';
import 'package:online_patient/NoteDoctors/models/note_model.dart';
import 'package:online_patient/NoteDoctors/simple_bloc_observer.dart';
import 'package:online_patient/NoteDoctors/views/notes_view.dart';
import 'package:online_patient/app/screens/auth/login_screen.dart';
import 'package:online_patient/firestore-data/Labs.dart';
import 'package:online_patient/firestore-data/Pharmacy.dart';
import 'package:online_patient/firestore-data/myAppointmentList.dart';
import 'package:online_patient/firestore-data/searchList.dart';
import 'package:online_patient/firestore-data/userDetails.dart';
import 'package:online_patient/model/DoctorsList.dart';
import 'package:online_patient/model/item.dart';

import 'package:online_patient/screen/Booking/BookingScreen%20Echo.dart';

import 'package:online_patient/screen/Booking/bookingscreenCholestrol.dart';
import 'package:online_patient/screen/Cardiologist%20Special/Cardiologist.dart';
import 'package:online_patient/screen/Dentist%20Special/Dentist.dart';
import 'package:online_patient/screen/DoctorsVideoCall/BookAppointment.dart';
import 'package:online_patient/screen/DoctorsVideoCall/Videocall.dart';
import 'package:online_patient/screen/EyeSpecial/Eye%20Special.dart';
import 'package:online_patient/screen/HomaPage/disease.dart';
import 'package:online_patient/screen/HomaPage/homePage.dart';
import 'package:online_patient/screen/HomaPage/mainPage.dart';
import 'package:online_patient/screen/Lab%20Survice/DetaialsCBC.dart';
import 'package:online_patient/screen/Lab%20Survice/DetailsCreatinine.dart';
import 'package:online_patient/screen/Lab%20Survice/DetailsHeart%20.dart';
import 'package:online_patient/screen/Lab%20Survice/DetailsLiveFunction.dart';
import 'package:online_patient/screen/Lab%20Survice/Detailscholestrol.dart';
import 'package:online_patient/screen/Lab%20Survice/Lab%20survice.dart';
import 'package:online_patient/screen/LoginUser/Login.dart';
import 'package:online_patient/screen/MyAppointmentHistoryList.dart';
import 'package:online_patient/screen/Pharmacy/Mappharmacy.dart';
// import 'package:online_patient/screen/Paediatrician/Paediatrician.dart';
import 'package:online_patient/screen/Rumors%20Center/Details%20Bone.dart';
import 'package:online_patient/screen/Rumors%20Center/Details%20Brain.dart';
import 'package:online_patient/screen/Rumors%20Center/Details%20CT.dart';
import 'package:online_patient/screen/Rumors%20Center/Details%20Echo.dart';
import 'package:online_patient/screen/Rumors%20Center/Details%20Heart.dart';
import 'package:online_patient/screen/Rumors%20Center/Rumors%20Center.dart';
import 'package:online_patient/screen/Special.dart';
import 'package:online_patient/screen/User%20Details%20And%20Update/updateUserDetails.dart';
import 'package:online_patient/screen/doctorProfile.dart';
import 'package:online_patient/screen/doctorsList.dart';
import 'package:online_patient/screen/exploreList.dart';
import 'package:online_patient/screen/firebaseAuth.dart';
import 'package:online_patient/screen/myAppointments.dart';
import 'package:online_patient/screen/orthopedics/orthopedics.dart';
import 'package:online_patient/screen/skip.dart';
import 'package:online_patient/screen/User%20Details%20And%20Update/userProfile.dart';
import 'package:online_patient/screen/LoginUser/Ressetpassword.dart';
import 'package:online_patient/screen/videocall/jion_Screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: "AIzaSyCbw2AOKUq4JfVoZceQsZP27aCa6Q2z2-U",
              appId: "1:474247137471:android:03b91c1ac8235c5df3de0a",
              messagingSenderId: "474247137471",
              projectId: "final-project-b67b9"))
      // WidgetsFlutterBinding.ensureInitialized();
      // SystemChrome.setPreferredOrientations(
      //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      : await Firebase.initializeApp();

  // Doctor.addDoctors(doctors: [
  //   Doctor(Certificates: "1- Certificates:                                  Bachelor of Medicine and Surgery Faculty of Medicine - Kasr Al-Aini.                                          Master of Cardiovascular Diseases.                                   Doctor of Cardiovascular Diseases.                                          Fellow of the Egyptian and European Society of Cardiology.",Experience:"2-Experience                                                                  Consultant Cardiac ultrasound - fifteen years experience.                 Best Cardiology Catheterization Doctor in Egypt.      "                         ,id: "1", name: "Dr.Lemoo",phoneNumber: "01068037451" ,imageUrl: "assets/IMG_20230216_035602_989.png" ,  location: "Maadi", email: 'Lemoo@gmail.com',Special: 'Cardiologist', ),
  //   Doctor(Certificates: "1- Certificates:                                  Bachelor of Medicine and Surgery Faculty of Medicine - Kasr Al-Aini.                                          Master of Cardiovascular Diseases.                                   Doctor of Cardiovascular Diseases.                                          Fellow of the Egyptian and European Society of Cardiology.",Experience:"2-Experience                                                                  Consultant Cardiac ultrasound - fifteen years experience.                 Best Cardiology Catheterization Doctor in Egypt.               "   ,email: "omar@gmail.com", id: "2", name: "Dr.Omar", phoneNumber: "01078037451",imageUrl: "assets/555.jpg" , location: "Giza" ,Special: 'Cardiologist', ),
  //   Doctor(Certificates: "1- Certificates:                                  Bachelor of Medicine and Surgery Faculty of Medicine - Kasr Al-Aini.                                          Master of Cardiovascular Diseases.                                   Doctor of Cardiovascular Diseases.                                          Fellow of the Egyptian and European Society of Cardiology.",Experience:"2-Experience                                                                  Consultant Cardiac ultrasound - fifteen years experience.                 Best Cardiology Catheterization Doctor in Egypt.               "   ,email: "Sohaila@gmail.com", id: "3", name: "Dr.Sohaila", phoneNumber: "01088037451",imageUrl:"assets/IMG_20230216_035602_989.png" , location:  "Cairo",Special: 'Cardiologist', ),
  //   Doctor(Certificates: "1- Certificates:                                  Bachelor of Medicine and Surgery Faculty of Medicine - Kasr Al-Aini.                                          Master of Cardiovascular Diseases.                                   Doctor of Cardiovascular Diseases.                                          Fellow of the Egyptian and European Society of Cardiology.",Experience:"2-Experience                                                                  Consultant Cardiac ultrasound - fifteen years experience.                 Best Cardiology Catheterization Doctor in Egypt.                 "   ,email: "Amr@gmail.com", id: "4", name: "Dr.Amr", phoneNumber: "01098037451",imageUrl: "assets/IMG_20230216_035602_989.png", location:  "Naser City",Special: 'Cardiologist', ),
  //   Doctor(Certificates: "1- Certificates:                                  Bachelor of Medicine and Surgery Faculty of Medicine - Kasr Al-Aini.                                          Master of Cardiovascular Diseases.                                   Doctor of Cardiovascular Diseases.                                          Fellow of the Egyptian and European Society of Cardiology.",Experience:"2-Experience                                                                  Consultant Cardiac ultrasound - fifteen years experience.                 Best Cardiology Catheterization Doctor in Egypt.                 "   ,email: "Kareem@gmail.com", id: '5', name: "Dr.Kareem", phoneNumber: "01061037451",imageUrl: "assets/IMG_20230216_035602_989.png", location:  "Shekh Zayed",Special: 'Cardiologist', ),
  //   Doctor(Certificates: "1- Certificates:                                  Bachelor of Medicine and Surgery Faculty of Medicine - Kasr Al-Aini.                                          Master of Cardiovascular Diseases.                                   Doctor of Cardiovascular Diseases.                                          Fellow of the Egyptian and European Society of Cardiology.",Experience:"2-Experience                                                                  Consultant Cardiac ultrasound - fifteen years experience.                 Best Cardiology Catheterization Doctor in Egypt.              "   ,email: "Abdullah@gmail.com", id: "6", name: "Dr.Abdullah", phoneNumber: "01062037451",imageUrl: "assets/IMG_20230216_035602_989.png" , location:  "Maadi" ,Special: 'Cardiologist',),
  //   Doctor(Certificates: "1- Certificates:                                  Bachelor of Medicine and Surgery Faculty of Medicine - Kasr Al-Aini.                                          Master of Cardiovascular Diseases.                                   Doctor of Cardiovascular Diseases.                                          Fellow of the Egyptian and European Society of Cardiology.",Experience:"2-Experience                                                                   Consultant Cardiac ultrasound - fifteen years experience.                 Best Cardiology Catheterization Doctor in Egypt.              "   ,email: "Abdelrahman@gmail.com", id: "7", name: "Dr.Abdeelrahman", phoneNumber: "01068037451",imageUrl: "assets/IMG_20230216_035602_989.png" , location:  "Giza",Special: 'Cardiologist', ),
  //   Doctor(Certificates: "1- Certificates:                                  Bachelor of Medicine and Surgery Faculty of Medicine - Kasr Al-Aini.                                          Master of Cardiovascular Diseases.                                   Doctor of Cardiovascular Diseases.                                          Fellow of the Egyptian and European Society of Cardiology.",Experience:"2-Experience                                                                    Consultant Cardiac ultrasound - fifteen years experience.                 Best Cardiology Catheterization Doctor in Egypt.              "   ,email: "Ahmed@gmail.com", id: "8", name: "Dr.Ahmed", phoneNumber: "01063037451",imageUrl: "assets/IMG_20230216_035602_989.png" , location:  "Cairo" ,Special: 'Cardiologist',),
  //   Doctor(Certificates: "1- Certificates:                                  Bachelor of Medicine and Surgery Faculty of Medicine - Kasr Al-Aini.                                          Master of Cardiovascular Diseases.                                   Doctor of Cardiovascular Diseases.                                          Fellow of the Egyptian and European Society of Cardiology.",Experience:"2-Experience                                                                   Consultant Cardiac ultrasound - fifteen years experience.                 Best Cardiology Catheterization Doctor in Egypt.               "   ,email: "Mohamed@gmail.com", id: "9", name: "Dr.Mohamed", phoneNumber: "01064037451",imageUrl: "assets/IMG_20230216_035602_989.png" , location:  "Naser City" ,Special: 'Cardiologist',),
  //   Doctor(Certificates: "1- Certificates:                                  Bachelor of Medicine and Surgery Faculty of Medicine - Kasr Al-Aini.                                          Master of Cardiovascular Diseases.                                   Doctor of Cardiovascular Diseases.                                          Fellow of the Egyptian and European Society of Cardiology.",Experience:"2-Experience                                                                     Consultant Cardiac ultrasound - fifteen years experience.                 Best Cardiology Catheterization Doctor in Egypt.               "   ,email: "Ali@gmail.com", id: "10", name: "Dr.Ali", phoneNumber: "01065037451",imageUrl: "assets/IMG_20230216_035602_989.png" , location:  "Shekh Zayed",Special: 'Cardiologist', ),
  //   Doctor(Certificates: "1- Certificates:                                  Bachelor of Medicine and Surgery Faculty of Medicine - Kasr Al-Aini.                                          Master of Cardiovascular Diseases.                                   Doctor of Cardiovascular Diseases.                                          Fellow of the Egyptian and European Society of Cardiology.",Experience:"2-Experience                                                                   Consultant Cardiac ultrasound - fifteen years experience.                 Best Cardiology Catheterization Doctor in Egypt.               "   ,email: "Youssef@gmail.com", id: "11", name: "Dr.Youssef", phoneNumber: "01066037451",imageUrl: "assets/IMG_20230216_035602_989.png" , location:  "Mokhattam",Special: 'Cardiologist', ),
  //   Doctor(Certificates: "1- Certificates:                                  Bachelor of Medicine and Surgery Faculty of Medicine - Kasr Al-Aini.                                          Master of Cardiovascular Diseases.                                   Doctor of Cardiovascular Diseases.                                          Fellow of the Egyptian and European Society of Cardiology.",Experience:"2-Experience                                                                    Consultant Cardiac ultrasound - fifteen years experience.                 Best Cardiology Catheterization Doctor in Egypt.               "   ,email: "Khaled@gmail.com", id: "12", name: "Dr.Khaled", phoneNumber: "01067037451",imageUrl: "assets/IMG_20230216_035602_989.png", location: "6 October" ,Special: 'Cardiologist', ),
  //   Doctor(Certificates: "1- Certificates:                                  Bachelor of Medicine and Surgery Faculty of Medicine - Kasr Al-Aini.                                          Master of Cardiovascular Diseases.                                   Doctor of Cardiovascular Diseases.                                          Fellow of the Egyptian and European Society of Cardiology.",Experience:"2-Experience                                                                    Consultant Cardiac ultrasound - fifteen years experience.                 Best Cardiology Catheterization Doctor in Egypt.                "   ,email: "Hazem@gmail.com", id: "13", name: "Dr.Hazem", phoneNumber: "01068037451",imageUrl: "assets/IMG_20230216_035602_989.png" , location:  "ElhaHam",Special: 'Cardiologist', ),
  //   Doctor(Certificates: "1- Certificates:                                  Bachelor of Medicine and Surgery Faculty of Medicine - Kasr Al-Aini.                                          Master of Cardiovascular Diseases.                                   Doctor of Cardiovascular Diseases.                                          Fellow of the Egyptian and European Society of Cardiology.",Experience:"2-Experience                                                                       Consultant Cardiac ultrasound - fifteen years experience.                 Best Cardiology Catheterization Doctor in Egypt.              "   ,email: "Hisham@gmail.com", id: "14", name: "Dr.Hisham", phoneNumber: "01069037451",imageUrl: "assets/IMG_20230216_035602_989.png", location:  "maadi" ,Special: 'Cardiologist',),
  // ]);

  // Doctor.addDoctorss(doctorss: [
  //   Doctor(email: "Eslam@gmail.com", id: "1", name: "Dr.Eslam", phoneNumber: "01078037451",imageUrl: "assets/555.jpg" , location: "Giza", Experience: '', Certificates: '',Special: 'Dentist', ),
  //   Doctor(email: "Yasser@gmail.com", id: "2", name: "Dr.Yasser", phoneNumber: "01078037451",imageUrl: "assets/555.jpg" , location: "Giza", Experience: '', Certificates: '', Special: 'Dentist', ),
  //   Doctor(email: "shady@gmail.com", id: "3", name: "Dr.shady", phoneNumber: "01088037451",imageUrl:"assets/555.jpg" , location:  "Cairo" , Experience: '', Certificates: '',Special: 'Dentist',),
  //   Doctor(email: "john@gmail.com", id: "4", name: "Dr.john", phoneNumber: "01098037451",imageUrl: "assets/555.jpg", location:  "Naser City", Experience: '', Certificates: '',Special: 'Dentist', ),
  //   Doctor(email: "Afif@gmail.com", id: '5', name: "Dr.Afif", phoneNumber: "01061037451",imageUrl: "assets/555.jpg", location:  "Shekh Zayed" , Experience: '', Certificates: '',Special: 'Dentist',),
  //   Doctor(email: "Al braa@gmail.com", id: "6", name: "Dr.Al braa", phoneNumber: "01062037451",imageUrl: "assets/555.jpg" , location:  "Maadi", Experience: '', Certificates: '',Special: 'Dentist', ),
  //   Doctor(email: "Eslam@gmail.com", id: "7", name: "Dr.Eslam", phoneNumber: "01068037451",imageUrl: "assets/555.jpg" , location:  "Giza", Experience: '', Certificates: '', Special: 'Dentist',),
  //   Doctor(email: "Osama@gmail.com", id: "8", name: "Dr.Osama", phoneNumber: "01063037451",imageUrl: "assets/555.jpg" , location:  "Cairo" , Experience: '', Certificates: '',Special: 'Dentist',),
  //   Doctor(email: "Mido@gmail.com", id: "9", name: "Dr.Mido", phoneNumber: "01064037451",imageUrl: "assets/555.jpg" , location:  "Naser City", Experience: '', Certificates: '', Special: 'Dentist',),
  //   Doctor(email: "Darsh@gmail.com", id: "10", name: "Dr.Darsh", phoneNumber: "01065037451",imageUrl: "assets/555.jpg" , location:  "Shekh Zayed", Experience: '', Certificates: '', Special: 'Dentist',),
  //   Doctor(email: "Magdy@gmail.com", id: "11", name: "Dr.Magdy", phoneNumber: "01066037451",imageUrl: "assets/555.jpg" , location:  "Mokhattam", Experience: '', Certificates: '', Special: 'Dentist',),
  //   Doctor(email: "Bassem@gmail.com", id: "12", name: "Dr.Bassem", phoneNumber: "01067037451",imageUrl: "assets/555.jpg", location: "6 October" , Experience: '', Certificates: '', Special: 'Dentist',),
  //   Doctor(email: "Moamen@gmail.com", id: "13", name: "Dr.Moamen", phoneNumber: "01068037451",imageUrl: "assets/555.jpg" , location:  "ElhaHam", Experience: '', Certificates: '', Special: 'Dentist',),
  //   Doctor(email: "Walid@gmail.com", id: "14", name: "Dr.Walid", phoneNumber: "01069037451",imageUrl: "assets/555.jpg", location:  "maadi", Experience: '', Certificates: '', Special: 'Dentist',),
  //  ],
  // );
  // Doctor.addDoctorsss(doctorsss: [
  //   Doctor(email: "Sameh@gmail.com", id: "1", name: "Dr.Sameh", phoneNumber: "01078037451",imageUrl: "assets/555.jpg" , location: "Giza" , Experience: '', Certificates: '', Special: 'Eye',),
  //   Doctor(email: "Yasser@gmail.com", id: "2", name: "Dr.Yasser", phoneNumber: "01078037451",imageUrl: "assets/555.jpg" , location: "Giza", Experience: '', Certificates: '',  Special: 'Eye',),
  //   Doctor(email: "shady@gmail.com", id: "3", name: "Dr.shady", phoneNumber: "01088037451",imageUrl:"assets/555.jpg" , location:  "Cairo" , Experience: '', Certificates: '',Special: 'Eye',),
  //   Doctor(email: "john@gmail.com", id: "4", name: "Dr.john", phoneNumber: "01098037451",imageUrl: "assets/555.jpg", location:  "Naser City" , Experience: '', Certificates: '',Special: 'Eye',),
  //   Doctor(email: "Afif@gmail.com", id: '5', name: "Dr.Afif", phoneNumber: "01061037451",imageUrl: "assets/555.jpg", location:  "Shekh Zayed" , Experience: '', Certificates: '',Special: 'Eye',),
  //   Doctor(email: "Al braa@gmail.com", id: "6", name: "Dr.Al braa", phoneNumber: "01062037451",imageUrl: "assets/555.jpg" , location:  "Maadi" , Experience: '', Certificates: '',Special: 'Eye',),
  //   Doctor(email: "Eslam@gmail.com", id: "7", name: "Dr.Eslam", phoneNumber: "01068037451",imageUrl: "assets/555.jpg" , location:  "Giza" , Experience: '', Certificates: '',Special: 'Eye',),
  //   Doctor(email: "Osama@gmail.com", id: "8", name: "Dr.Osama", phoneNumber: "01063037451",imageUrl: "assets/555.jpg" , location:  "Cairo" , Experience: '', Certificates: '',Special: 'Eye',),
  //   Doctor(email: "Mido@gmail.com", id: "9", name: "Dr.Mido", phoneNumber: "01064037451",imageUrl: "assets/555.jpg" , location:  "Naser City" , Experience: '', Certificates: '',Special: 'Eye',),
  //   Doctor(email: "Darsh@gmail.com", id: "10", name: "Dr.Darsh", phoneNumber: "01065037451",imageUrl: "assets/555.jpg" , location:  "Shekh Zayed", Experience: '', Certificates: '',Special: 'Eye', ),
  //   Doctor(email: "Magdy@gmail.com", id: "11", name: "Dr.Magdy", phoneNumber: "01066037451",imageUrl: "assets/555.jpg" , location:  "Mokhattam", Experience: '', Certificates: '', Special: 'Eye',),
  //   Doctor(email: "Bassem@gmail.com", id: "12", name: "Dr.Bassem", phoneNumber: "01067037451",imageUrl: "assets/555.jpg", location: "6 October"  , Experience: '', Certificates: '',Special: 'Eye',),
  //   Doctor(email: "Moamen@gmail.com", id: "13", name: "Dr.Moamen", phoneNumber: "01068037451",imageUrl: "assets/555.jpg" , location:  "ElhaHam" , Experience: '', Certificates: '',Special: 'Eye',),
  //   Doctor(email: "Walid@gmail.com", id: "14", name: "Dr.Walid", phoneNumber: "01069037451",imageUrl: "assets/555.jpg", location:  "maadi" , Experience: '', Certificates: '',Special: 'Eye',),
  // ],
  // );

  // Doctor.addDoctorssss(doctorssss: [
  //   Doctor(email: "Sameh@gmail.com", id: "1", name: "Dr.Sameh", phoneNumber: "01078037451",imageUrl: "assets/555.jpg" , location: "Giza" , Experience: '', Certificates: '',Special: 'Paediatrician', ),
  //   Doctor(email: "Yasser@gmail.com", id: "2", name: "Dr.Yasser", phoneNumber: "01078037451",imageUrl: "assets/555.jpg" , location: "Giza" , Experience: '', Certificates: '', Special: 'Paediatrician',),
  //   Doctor(email: "shady@gmail.com", id: "3", name: "Dr.shady", phoneNumber: "01088037451",imageUrl:"assets/555.jpg" , location:  "Cairo" , Experience: '', Certificates: '',Special: 'Paediatrician',),
  //   Doctor(email: "john@gmail.com", id: "4", name: "Dr.john", phoneNumber: "01098037451",imageUrl: "assets/555.jpg", location:  "Naser City", Experience: '', Certificates: '', Special: 'Paediatrician',),
  //   Doctor(email: "Afif@gmail.com", id: '5', name: "Dr.Afif", phoneNumber: "01061037451",imageUrl: "assets/555.jpg", location:  "Shekh Zayed" , Experience: '', Certificates: '',Special: 'Paediatrician',),
  //   Doctor(email: "Al braa@gmail.com", id: "6", name: "Dr.Al braa", phoneNumber: "01062037451",imageUrl: "assets/555.jpg" , location:  "Maadi", Experience: '', Certificates: '',Special: 'Paediatrician', ),
  //   Doctor(email: "Eslam@gmail.com", id: "7", name: "Dr.Eslam", phoneNumber: "01068037451",imageUrl: "assets/555.jpg" , location:  "Giza" , Experience: '', Certificates: '',Special: 'Paediatrician',),
  //   Doctor(email: "Osama@gmail.com", id: "8", name: "Dr.Osama", phoneNumber: "01063037451",imageUrl: "assets/555.jpg" , location:  "Cairo" , Experience: '', Certificates: '',Special: 'Paediatrician',),
  //   Doctor(email: "Mido@gmail.com", id: "9", name: "Dr.Mido", phoneNumber: "01064037451",imageUrl: "assets/555.jpg" , location:  "Naser City" , Experience: '', Certificates: '',Special: 'Paediatrician',),
  //   Doctor(email: "Darsh@gmail.com", id: "10", name: "Dr.Darsh", phoneNumber: "01065037451",imageUrl: "assets/555.jpg" , location:  "Shekh Zayed" , Experience: '', Certificates: '',Special: 'Paediatrician',),
  //   Doctor(email: "Magdy@gmail.com", id: "11", name: "Dr.Magdy", phoneNumber: "01066037451",imageUrl: "assets/555.jpg" , location:  "Mokhattam" , Experience: '', Certificates: '',Special: 'Paediatrician',),
  //   Doctor(email: "Bassem@gmail.com", id: "12", name: "Dr.Bassem", phoneNumber: "01067037451",imageUrl: "assets/555.jpg", location: "6 October" , Experience: '', Certificates: '',Special: 'Paediatrician', ),
  //   Doctor(email: "Moamen@gmail.com", id: "13", name: "Dr.Moamen", phoneNumber: "01068037451",imageUrl: "assets/555.jpg" , location:  "ElhaHam", Experience: '', Certificates: '',Special: 'Paediatrician', ),
  //   Doctor(email: "Walid@gmail.com", id: "14", name: "Dr.Walid", phoneNumber: "01069037451",imageUrl: "assets/555.jpg", location:  "maadi", Experience: '', Certificates: '', Special: 'Paediatrician',),
  // ],
  // );
  // Doctor.addDoctorsssss(doctorsssss: [
  //   Doctor(email: "Sameh@gmail.com", id: "1", name: "Dr.Sameh", phoneNumber: "01078037451",imageUrl: "assets/555.jpg" , location: "Giza"  , Experience: '', Certificates: '',Special: 'orthopedics',),
  //   Doctor(email: "Yasser@gmail.com", id: "2", name: "Dr.Yasser", phoneNumber: "01078037451",imageUrl: "assets/555.jpg" , location: "Giza" , Experience: '', Certificates: '',Special: 'orthopedics', ),
  //   Doctor(email: "shady@gmail.com", id: "3", name: "Dr.shady", phoneNumber: "01088037451",imageUrl:"assets/555.jpg" , location:  "Cairo" , Experience: '', Certificates: '',Special: 'orthopedics',),
  //   Doctor(email: "john@gmail.com", id: "4", name: "Dr.john", phoneNumber: "01098037451",imageUrl: "assets/555.jpg", location:  "Naser City" , Experience: '', Certificates: '',Special: 'orthopedics',),
  //   Doctor(email: "Afif@gmail.com", id: '5', name: "Dr.Afif", phoneNumber: "01061037451",imageUrl: "assets/555.jpg", location:  "Shekh Zayed" , Experience: '', Certificates: '',Special: 'orthopedics',),
  //   Doctor(email: "Al braa@gmail.com", id: "6", name: "Dr.Al braa", phoneNumber: "01062037451",imageUrl: "assets/555.jpg" , location:  "Maadi" , Experience: '', Certificates: '',Special: 'orthopedics',),
  //   Doctor(email: "Eslam@gmail.com", id: "7", name: "Dr.Eslam", phoneNumber: "01068037451",imageUrl: "assets/555.jpg" , location:  "Giza" , Experience: '', Certificates: '',Special: 'orthopedics',),
  //   Doctor(email: "Osama@gmail.com", id: "8", name: "Dr.Osama", phoneNumber: "01063037451",imageUrl: "assets/555.jpg" , location:  "Cairo" , Experience: '', Certificates: '',Special: 'orthopedics',),
  //   Doctor(email: "Mido@gmail.com", id: "9", name: "Dr.Mido", phoneNumber: "01064037451",imageUrl: "assets/555.jpg" , location:  "Naser City" , Experience: '', Certificates: '',Special: 'orthopedics',),
  //   Doctor(email: "Darsh@gmail.com", id: "10", name: "Dr.Darsh", phoneNumber: "01065037451",imageUrl: "assets/555.jpg" , location:  "Shekh Zayed", Experience: '', Certificates: '', Special: 'orthopedics',),
  //   Doctor(email: "Magdy@gmail.com", id: "11", name: "Dr.Magdy", phoneNumber: "01066037451",imageUrl: "assets/555.jpg" , location:  "Mokhattam" , Experience: '', Certificates: '',Special: 'orthopedics',),
  //   Doctor(email: "Bassem@gmail.com", id: "12", name: "Dr.Bassem", phoneNumber: "01067037451",imageUrl: "assets/555.jpg", location: "6 October" , Experience: '', Certificates: '', Special: 'orthopedics',),
  //   Doctor(email: "Moamen@gmail.com", id: "13", name: "Dr.Moamen", phoneNumber: "01068037451",imageUrl: "assets/555.jpg" , location:  "ElhaHam", Experience: '', Certificates: '',Special: 'orthopedics', ),
  //   Doctor(email: "Walid@gmail.com", id: "14", name: "Dr.Walid", phoneNumber: "01069037451",imageUrl: "assets/555.jpg", location:  "maadi" , Experience: '', Certificates: '',Special: 'orthopedics',),
  // ],
  // );
  // // Doctor.addDoctorssssss(doctorssssss: [
  // //   Doctor(email: "Sameh@gmail.com", id: "1", name: "Dr.Sameh", phoneNumber: "01078037451",imageUrl: "assets/555.jpg" , location: "Giza" , Experience: '', Certificates: '', ),
  // //   Doctor(email: "Yasser@gmail.com", id: "2", name: "Dr.Yasser", phoneNumber: "01078037451",imageUrl: "assets/555.jpg" , location: "Giza" , Experience: '', Certificates: '', ),
  // //   Doctor(email: "shady@gmail.com", id: "3", name: "Dr.shady", phoneNumber: "01088037451",imageUrl:"assets/555.jpg" , location:  "Cairo" , Experience: '', Certificates: '',),
  // //   Doctor(email: "john@gmail.com", id: "4", name: "Dr.john", phoneNumber: "01098037451",imageUrl: "assets/555.jpg", location:  "Naser City", Experience: '', Certificates: '', ),
  // //   Doctor(email: "Afif@gmail.com", id: '5', name: "Dr.Afif", phoneNumber: "01061037451",imageUrl: "assets/555.jpg", location:  "Shekh Zayed", Experience: '', Certificates: '', ),
  // //   Doctor(email: "Al braa@gmail.com", id: "6", name: "Dr.Al braa", phoneNumber: "01062037451",imageUrl: "assets/555.jpg" , location:  "Maadi" , Experience: '', Certificates: '',),
  // //   Doctor(email: "Eslam@gmail.com", id: "7", name: "Dr.Eslam", phoneNumber: "01068037451",imageUrl: "assets/555.jpg" , location:  "Giza" , Experience: '', Certificates: '',),
  // //   Doctor(email: "Osama@gmail.com", id: "8", name: "Dr.Osama", phoneNumber: "01063037451",imageUrl: "assets/555.jpg" , location:  "Cairo", Experience: '', Certificates: '', ),
  // //   Doctor(email: "Mido@gmail.com", id: "9", name: "Dr.Mido", phoneNumber: "01064037451",imageUrl: "assets/555.jpg" , location:  "Naser City", Experience: '', Certificates: '', ),
  // //   Doctor(email: "Darsh@gmail.com", id: "10", name: "Dr.Darsh", phoneNumber: "01065037451",imageUrl: "assets/555.jpg" , location:  "Shekh Zayed", Experience: '', Certificates: '', ),
  // //   Doctor(email: "Magdy@gmail.com", id: "11", name: "Dr.Magdy", phoneNumber: "01066037451",imageUrl: "assets/555.jpg" , location:  "Mokhattam" , Experience: '', Certificates: '',),
  // //   Doctor(email: "Bassem@gmail.com", id: "12", name: "Dr.Bassem", phoneNumber: "01067037451",imageUrl: "assets/555.jpg", location: "6 October", Experience: '', Certificates: '',  ),
  // //   Doctor(email: "Moamen@gmail.com", id: "13", name: "Dr.Moamen", phoneNumber: "01068037451",imageUrl: "assets/555.jpg" , location:  "ElhaHam" , Experience: '', Certificates: '',),
  // //   Doctor(email: "Walid@gmail.com", id: "14", name: "Dr.Walid", phoneNumber: "01069037451",imageUrl: "assets/555.jpg", location:  "maadi" , Experience: '', Certificates: '',),
  // // ],
  // // );
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;

  Future<void> _getUser() async {
    user = _auth.currentUser!;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _getUser();

    return BlocProvider(
        create: (context) => NotesCubit(),
        child: MaterialApp(
          theme: ThemeData(brightness: Brightness.light),

          // theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),

          initialRoute: '/',
          //
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(builder: (context) => Skip());
              case '/login':
                return MaterialPageRoute(builder: (context) => FireBaseAuth());
              case '/home':
                return MaterialPageRoute(builder: (context) => MainPage());
              case '/profile':
                return MaterialPageRoute(builder: (context) => UserProfile());
              case '/MyAppointments':
                return MaterialPageRoute(
                    builder: (context) => MyAppointments());
              case '/DoctorProfile':
                return MaterialPageRoute(
                    builder: (context) =>
                        DoctorProfile(doctor: settings.arguments as String));
              case '/BookingScreenCardiologist':
               
              case '/UpdateUserDetails':
                return MaterialPageRoute(
                    builder: (context) => UpdateUserDetails(
                          field: '',
                          label: '',
                        ));
              case '/SearchList':
                return MaterialPageRoute(
                    builder: (context) => SearchList(
                          searchKey: '',
                        ));

              case '/ExploreList':
                return MaterialPageRoute(
                    builder: (context) => ExploreList(
                          type: '',
                        ));
              case '/SignIn':
                return MaterialPageRoute(builder: (context) => SignIn());
              case '/Cardiologist':
                return MaterialPageRoute(builder: (context) => Cardiologist());
              case '/SpecialList':
                return MaterialPageRoute(builder: (context) => SpecialList());
              // case '/PaediatricianSpecial':
              //   return MaterialPageRoute(
              //       builder: (context) => PaediatricianSpecial());
              case '/bookingScreenDentist':
                
              case '/Ressetpassword':
                return MaterialPageRoute(
                    builder: (context) => Ressetpassword());
              case '/pharmacy':
                return MaterialPageRoute(builder: (context) => pharmacy());
              case '/Mappharmacy':
                return MaterialPageRoute(builder: (context) => Mappharmacy());
              case '/Disease':
                return MaterialPageRoute(builder: (context) => Disease());
              case '/Detailscholestrol':
                return MaterialPageRoute(
                    builder: (context) =>
                        Detailscholestrol(type: settings.arguments as String));
              case '/CBCTEST':
                return MaterialPageRoute(builder: (context) => CBCTEST());
              case '/HeartTest':
                return MaterialPageRoute(builder: (context) => HeartTest());
              case '/CreatinineTest':
                return MaterialPageRoute(
                    builder: (context) => CreatinineTest());
              case '/LiveFunctionTest':
                return MaterialPageRoute(
                    builder: (context) => LiveFunctionTest());
              case '/Labs':
                return MaterialPageRoute(builder: (context) => Labs());
              case '/bookingscreenCholestrol':
                return MaterialPageRoute(builder: (context) {
                  final args = settings.arguments as Map<String, dynamic>;
                  return bookingscreenCholestrol(
                    type: args['type'],
                    name: args['name'],
                    id: args['id'],
                  );
                });
              case '/Labsurvice':
                return MaterialPageRoute(builder: (context) => Labsurvice());
              case '/Dentist':
                return MaterialPageRoute(builder: (context) => Dentist());

              case '/EyeSpecial':
                return MaterialPageRoute(builder: (context) => EyeSpecial());

              case '/orthopedics':
                return MaterialPageRoute(builder: (context) => orthopedics());

              case '/videocallSpecial':
                return MaterialPageRoute(
                    builder: (context) => videocallSpecial());

              case '/BookingScreenVideocall':
                return MaterialPageRoute(
                    builder: (context) => BookingScreenVideocall(
                        doctor: '', key: null, name: ''));

              case '/JoinScreen':
                return MaterialPageRoute(builder: (context) => JoinScreen());
              // case '/Ressetpassword':
              //   return MaterialPageRoute(
              //       builder: (context) => Ressetpassword());
              case '/RumorsCenter':
                return MaterialPageRoute(builder: (context) => RumorsCenter());
              case '/HeartRumors':
                return MaterialPageRoute(builder: (context) => HeartRumors());
              case '/BrainRumors':
                return MaterialPageRoute(builder: (context) => BrainRumors());
              case '/EchoRumors':
                return MaterialPageRoute(
                    builder: (context) =>
                        EchoRumors(type1: settings.arguments as String));
              case '/CTRumors':
                return MaterialPageRoute(builder: (context) => CTRumors());
              case '/BoneRumors':
                return MaterialPageRoute(builder: (context) => BoneRumors());
              case '/MyAppointmentHistory':
                return MaterialPageRoute(
                    builder: (context) => MyAppointmentHistory());
              case '/bookingscreenEcho':
                return MaterialPageRoute(builder: (context) {
                  final args = settings.arguments as Map<String, dynamic>;
                  return bookingscreenEcho(
                    type1: args['type1'],
                    name: args['name'],
                    id: args['id'],
                  );
                });
              default:
                return MaterialPageRoute(builder: (context) => SizedBox());
            }
          },
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.

            // '/bookingscreenHeartt': (context) => bookingscreenHeartt(
            //       doctor: 'Heart Rumor',
            //       name: '',
            //     ),
            // '/bookingscreenBrain': (context) => bookingscreenBrain(
            //       doctor: 'Brain Rumor',
            //       name: '',
            //     ),
            // '/bookingscreenEcho': (context) => bookingscreenEcho(
            //       doctor: 'Echo Rumor',
            //       name: '',
            //     ),
            // '/bookingscreenCT': (context) => bookingscreenCT(
            //       doctor: 'CT Scan',
            //       name: '',
            //     ),
            // '/bookingscreenBone': (context) => bookingscreenBone(
            //       doctor: 'Bone Rumor',
            //       name: '',
            //     ),
          },
          debugShowCheckedModeBanner: false,
          //home: FirebaseAuthDemo(),
        ));
  }
}
