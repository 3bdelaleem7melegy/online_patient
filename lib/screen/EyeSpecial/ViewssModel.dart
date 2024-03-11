
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewModelll extends ChangeNotifier {

  List<Map<String, dynamic>> datass = [];
  List<Map<String, dynamic>> allDatass = [];
  List<Map<String, dynamic>> selectedDoctorsss = [];
  List<Map<String, dynamic>> selectedLocationsss = [];
  String? errorMessagess;

  Future<void> loadData() async {
    datass = [];
    errorMessagess = null;
    notifyListeners();
    try {
      allDatass= await FirebaseFirestore.instance
          .collection("EyeSpecial")
          .get()
          .then((value) => value.docs.map((e) => e.data()).toList());
      datass = copyList(allDatass);
      notifyListeners();
    } catch (e) {
      errorMessagess = e.toString();
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

  void addDoctorss(Map<String,dynamic> doctorss){
    selectedDoctorsss.add(doctorss);
    notifyListeners();
  }
  void addLocationss(Map<String,dynamic> doctorss){
    selectedLocationsss.add(doctorss);
    notifyListeners();
  }

  void removeDoctorss(Map<String,dynamic> doctorss){
    for(int i = 0; i<selectedDoctorsss.length ; i++){
      if(doctorss["id"] == selectedDoctorsss[i]["id"]){
        selectedDoctorsss.removeAt(i);
      }
    }
    notifyListeners();
  }

  void updateSelectedDoctorsssList(){
    if(selectedDoctorsss.isNotEmpty){
      datass = copyList(selectedDoctorsss);
    }else {
      datass = copyList(allDatass);
    }
    notifyListeners();
  }

  bool isDoctorssSelected(Map<String,dynamic> doctorss){
    for(int i = 0 ; i < selectedDoctorsss.length ; i++){
      if(doctorss["id"] == selectedDoctorsss[i]["id"]){
        return true;
      }
    }
    return false;
  }

}
