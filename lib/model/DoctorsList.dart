import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  String id;
  String name;
  String email;
  String phoneNumber;
  String imageUrl;
  String location;
  String Certificates;
  String Experience;
  String Special;
  String price;



  Doctor(
      {
        required this.email,
      required this.id,
      required this.name,
      required this.phoneNumber,
      required this.imageUrl,
      required this.location, required this.Experience, required this.Certificates,required this.Special,required this.price  });

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "imageUrl" : imageUrl,
      "location" :location,
      "Experience":Experience,
      "Certificates":Certificates,
      "Special":Special,
      "price":price,

    };
  }

  static void addDoctors({required List<Doctor> doctors}) async {
    for (int i = 0; i < doctors.length; i++) {
      await FirebaseFirestore.instance
          .collection("Cardiologist")
          .doc(doctors[i].id)
          .set(doctors[i].toFireStore());
    }
  }

  static void addDoctorss({required List<Doctor> doctorss})async {
    for (int i = 0; i < doctorss.length; i++) {
      await FirebaseFirestore.instance
          .collection("Dentist")
          .doc(doctorss[i].id)
          .set(doctorss[i].toFireStore());
  }}

  static void addDoctorsss({required List<Doctor> doctorsss}) async {
    for (int i = 0; i < doctorsss.length; i++) {
      await FirebaseFirestore.instance
          .collection("EyeSpecial")
          .doc(doctorsss[i].id)
          .set(doctorsss[i].toFireStore());
    }
  }

  static void addDoctorssss({required List<Doctor> doctorssss})async {
    for (int i = 0; i < doctorssss.length; i++) {
      await FirebaseFirestore.instance
          .collection("PaediatricianSpecial")
          .doc(doctorssss[i].id)
          .set(doctorssss[i].toFireStore());
    }
  }

  static void addDoctorsssss({required List<Doctor> doctorsssss})async {
    for (int i = 0; i < doctorsssss.length; i++) {
      await FirebaseFirestore.instance
          .collection("EarandnoseSpecial")
          .doc(doctorsssss[i].id)
          .set(doctorsssss[i].toFireStore());
    }
  }

  static void addDoctorssssss({required List<Doctor> doctorssssss}) async{
    for (int i = 0; i < doctorssssss.length; i++) {
      await FirebaseFirestore.instance
          .collection("VideoCall Special")
          .doc(doctorssssss[i].id)
          .set(doctorssssss[i].toFireStore());
    }
  }
}
