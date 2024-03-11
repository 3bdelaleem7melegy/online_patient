import 'package:online_patient/app/models/doctor_model.dart';
import 'package:online_patient/app/models/patient_model.dart';

class Appointment {
  final String? id;
  final String date;
  final Doctor doctor;
  final Patient patient;

  Appointment({
     this.id,
    required this.date,
    required this.patient,
    required this.doctor,
  });

  factory Appointment.formJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      date: json['date'],
     patient: Patient.formJson(json['patient']),
      doctor: Doctor.formJson(json['doctor']),
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "date": date,
      "doctor": doctor.toFireStore(),
      "patient": patient.toFireStore(),
    };
  }
}
