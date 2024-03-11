
import 'package:online_patient/app/models/doctor_model.dart';
import 'package:online_patient/app/models/patient_model.dart';

class Analysis {
  final String? id;
  final String date;
  final String description;
  // final Doctor doctor;
  final Patient patient;
  final String type;

  Analysis({
     this.id,
    required this.type,
    required this.date,
    required this.patient,
    // required this.doctor,
    required this.description,
  });

  factory Analysis.formJson(Map<String, dynamic> json) {
    return Analysis(
      id: json['id'],
      type: json['type'],
      date: json['date']??'',
      description: json['description']??'',
      patient: Patient.formJson(json['patient']),
      // doctor: Doctor.formJson(json['doctor']),
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "date": date,
      "type": type,
      "description": description,
      // "doctor": doctor.toFireStore(),
      "patient": patient.toFireStore(),
    };
  }
}
