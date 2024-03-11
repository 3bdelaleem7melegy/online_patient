
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier {

  List<Map<String, dynamic>> data = [];
  List<Map<String, dynamic>> allData = [];
  List<Map<String, dynamic>> selectedDoctors = [];
  List<Map<String, dynamic>> selectedLocations = [];
  String? errorMessage;

  Future<void> loadData() async {
    data = [];
    errorMessage = null;
    notifyListeners();
    try {
      allData = await FirebaseFirestore.instance
          .collection("Cardiologist")
          .get()
          .then((value) => value.docs.map((e) => e.data()).toList());
      data = copyList(allData);
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  List<Map<String , dynamic>> copyList(List<Map<String , dynamic>> originalList){
    List<Map<String , dynamic>> copy = [];
    for(int i = 0; i< originalList.length ; i++){
      copy.add(originalList[i]);
    }
    return copy;
  }

  void addDoctor(Map<String,dynamic> doctor){
    selectedDoctors.add(doctor);
    notifyListeners();
  }
  void addLocation(Map<String,dynamic> doctor){
    selectedLocations.add(doctor);
    notifyListeners();
  }

  void removeDoctor(Map<String,dynamic> doctor){
    for(int i = 0; i<selectedDoctors.length ; i++){
      if(doctor["id"] == selectedDoctors[i]["id"]){
        selectedDoctors.removeAt(i);
      }
    }
    notifyListeners();
  }

  void updateSelectedDoctorsList(){
    if(selectedDoctors.isNotEmpty){
      data = copyList(selectedDoctors);
    }else {
      data = copyList(allData);
    }
    notifyListeners();
  }

  bool isDoctorSelected(Map<String,dynamic> doctor){
    for(int i = 0 ; i < selectedDoctors.length ; i++){
      if(doctor["id"] == selectedDoctors[i]["id"]){
        return true;
      }
    }
    return false;
  }

}
