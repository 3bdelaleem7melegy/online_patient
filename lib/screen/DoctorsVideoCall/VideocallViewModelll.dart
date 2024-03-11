
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewModellllll extends ChangeNotifier {

  List<Map<String, dynamic>> datasssss = [];
  List<Map<String, dynamic>> allDatasssss = [];
  List<Map<String, dynamic>> selectedDoctorssssss = [];
  List<Map<String, dynamic>> selectedLocationssssss = [];
  String? errorMessagesssss;

  Future<void> loadData() async {
    datasssss = [];
    errorMessagesssss = null;
    notifyListeners();
    try {
      allDatasssss= await FirebaseFirestore.instance
          .collection("VideoCall Special")
          .get()
          .then((value) => value.docs.map((e) => e.data()).toList());
      datasssss = copyList(allDatasssss);
      notifyListeners();
    } catch (e) {
      errorMessagesssss = e.toString();
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

  void addDoctorsssss(Map<String,dynamic> doctorsssss){
    selectedDoctorssssss.add(doctorsssss);
    notifyListeners();
  }
  void addLocationsssss(Map<String,dynamic> doctorsssss){
    selectedLocationssssss.add(doctorsssss);
    notifyListeners();
  }

  void removeDoctorsssss(Map<String,dynamic> doctorsssss){
    for(int i = 0; i<selectedDoctorssssss.length ; i++){
      if(doctorsssss["id"] == selectedDoctorssssss[i]["id"]){
        selectedDoctorssssss.removeAt(i);
      }
    }
    notifyListeners();
  }

  void updateSelectedDoctorssssssList(){
    if(selectedDoctorssssss.isNotEmpty){
      datasssss = copyList(selectedDoctorssssss);
    }else {
      datasssss = copyList(allDatasssss);
    }
    notifyListeners();
  }

  bool isDoctorsssssSelected(Map<String,dynamic> doctorssss){
    for(int i = 0 ; i < selectedDoctorssssss.length ; i++){
      if(doctorssss["id"] == selectedDoctorssssss[i]["id"]){
        return true;
      }
    }
    return false;
  }

}
