
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewModelllll extends ChangeNotifier {

  List<Map<String, dynamic>> datassss = [];
  List<Map<String, dynamic>> allDatassss = [];
  List<Map<String, dynamic>> selectedDoctorsssss = [];
  List<Map<String, dynamic>> selectedLocationsssss = [];
  String? errorMessagessss;

  Future<void> loadData() async {
    datassss = [];
    errorMessagessss = null;
    notifyListeners();
    try {
      allDatassss= await FirebaseFirestore.instance
          .collection("EarandnoseSpecial")
          .get()
          .then((value) => value.docs.map((e) => e.data()).toList());
      datassss = copyList(allDatassss);
      notifyListeners();
    } catch (e) {
      errorMessagessss = e.toString();
      notifyListeners();
    }
  }

  List<Map<String , dynamic>> copyList(List<Map<String , dynamic>> originalLists){
    List<Map<String , dynamic>> copy = [];
    for(int i = 0; i< originalLists.length ; i++){
      copy.add(originalLists[i]);
    }
    return copy;
  }

  void addDoctorssss(Map<String,dynamic> doctorssss){
    selectedDoctorsssss.add(doctorssss);
    notifyListeners();
  }
  void addLocationssss(Map<String,dynamic> doctorssss){
    selectedLocationsssss.add(doctorssss);
    notifyListeners();
  }

  void removeDoctorssss(Map<String,dynamic> doctorssss){
    for(int i = 0; i<selectedDoctorsssss.length ; i++){
      if(doctorssss["id"] == selectedDoctorsssss[i]["id"]){
        selectedDoctorsssss.removeAt(i);
      }
    }
    notifyListeners();
  }

  void updateSelectedDoctorsssssList(){
    if(selectedDoctorsssss.isNotEmpty){
      datassss = copyList(selectedDoctorsssss);
    }else {
      datassss = copyList(allDatassss);
    }
    notifyListeners();
  }

  bool isDoctorssssSelected(Map<String,dynamic> doctorsss){
    for(int i = 0 ; i < selectedDoctorsssss.length ; i++){
      if(doctorsss["id"] == selectedDoctorsssss[i]["id"]){
        return true;
      }
    }
    return false;
  }

}
