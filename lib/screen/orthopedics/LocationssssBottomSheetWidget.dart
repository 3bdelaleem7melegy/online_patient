import 'package:flutter/material.dart';

import 'package:online_patient/screen/orthopedics/Viewssssmodel.dart';

class LocationssssBottomSheetWidget extends StatefulWidget {
  ViewModelllll viewModelllll;
  LocationssssBottomSheetWidget({required this.viewModelllll , super.key});

  @override
  State<LocationssssBottomSheetWidget> createState() => _LocationsBottomSheetWidgetState();
}

class _LocationsBottomSheetWidgetState extends State<LocationssssBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(child: Text(
                          widget.viewModelllll.allDatassss[index]["location"]
                      )),
                      Checkbox(

                        value: widget.viewModelllll.isDoctorssssSelected(widget.viewModelllll.allDatassss[index]),
                        onChanged: (value) {
                          if(value ?? false){
                            widget.viewModelllll.addDoctorssss(widget.viewModelllll.allDatassss[index]);
                          }else {
                            widget.viewModelllll.removeDoctorssss(widget.viewModelllll.allDatassss[index]);
                          }
                          setState(() {

                          });
                        },
                      ),
                    ],
                  ),
                ),
                itemCount: widget.viewModelllll.allDatassss.length,
              )
          ),
          ElevatedButton(
              onPressed: (){
                widget.viewModelllll.updateSelectedDoctorsssssList();
              }, child: const Text("Done"))
        ],
      ),
    );
  }
}
