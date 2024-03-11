import 'package:flutter/material.dart';
import 'package:online_patient/screen/Cardiologist%20Special/ViewModel.dart';

class LocationsBottomSheetWidget extends StatefulWidget {
  ViewModel viewModel;
  LocationsBottomSheetWidget({required this.viewModel , super.key});

  @override
  State<LocationsBottomSheetWidget> createState() => _LocationsBottomSheetWidgetState();
}

class _LocationsBottomSheetWidgetState extends State<LocationsBottomSheetWidget> {
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
                          widget.viewModel.allData[index]["location"]
                      )),
                      Checkbox(

                        value: widget.viewModel.isDoctorSelected(widget.viewModel.allData[index]),
                        onChanged: (value) {
                          if(value ?? false){
                            widget.viewModel.addDoctor(widget.viewModel.allData[index]);
                          }else {
                            widget.viewModel.removeDoctor(widget.viewModel.allData[index]);
                          }
                          setState(() {

                          });
                        },
                      ),
                    ],
                  ),
                ),
                itemCount: widget.viewModel.allData.length,
              )
          ),
          ElevatedButton(
              onPressed: (){
                widget.viewModel.updateSelectedDoctorsList();
              }, child: const Text("Done"))
        ],
      ),
    );
  }
}
