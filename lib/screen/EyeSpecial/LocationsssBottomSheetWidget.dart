import 'package:flutter/material.dart';
import 'package:online_patient/screen/EyeSpecial/ViewssModel.dart';

class LocationssBottomSheetWidget extends StatefulWidget {
  ViewModelll viewModelll;
  LocationssBottomSheetWidget({required this.viewModelll , super.key});

  @override
  State<LocationssBottomSheetWidget> createState() => _LocationsBottomSheetWidgetState();
}

class _LocationsBottomSheetWidgetState extends State<LocationssBottomSheetWidget> {
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
                          widget.viewModelll.allDatass[index]["location"]
                      )),
                      Checkbox(

                        value: widget.viewModelll.isDoctorssSelected(widget.viewModelll.allDatass[index]),
                        onChanged: (value) {
                          if(value ?? false){
                            widget.viewModelll.addDoctorss(widget.viewModelll.allDatass[index]);
                          }else {
                            widget.viewModelll.removeDoctorss(widget.viewModelll.allDatass[index]);
                          }
                          setState(() {

                          });
                        },
                      ),
                    ],
                  ),
                ),
                itemCount: widget.viewModelll.allDatass.length,
              )
          ),
          ElevatedButton(
              onPressed: (){
                widget.viewModelll.updateSelectedDoctorsssList();
              }, child: const Text("Done"))
        ],
      ),
    );
  }
}
