import 'package:flutter/material.dart';
import 'package:online_patient/screen/DoctorsVideoCall/VideocallViewModelll.dart';


class VideoLocationssssBottomSheetWidget extends StatefulWidget {
  ViewModellllll viewModellllll;
  VideoLocationssssBottomSheetWidget({required this.viewModellllll , super.key});

  @override
  State<VideoLocationssssBottomSheetWidget> createState() => _LocationsBottomSheetWidgetState();
}

class _LocationsBottomSheetWidgetState extends State<VideoLocationssssBottomSheetWidget> {
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
                          widget.viewModellllll.allDatasssss[index]["location"]
                      )),
                      Checkbox(

                        value: widget.viewModellllll.isDoctorsssssSelected(widget.viewModellllll.allDatasssss[index]),
                        onChanged: (value) {
                          if(value ?? false){
                            widget.viewModellllll.addDoctorsssss(widget.viewModellllll.allDatasssss[index]);
                          }else {
                            widget.viewModellllll.removeDoctorsssss(widget.viewModellllll.allDatasssss[index]);
                          }
                          setState(() {

                          });
                        },
                      ),
                    ],
                  ),
                ),
                itemCount: widget.viewModellllll.allDatasssss.length,
              )
          ),
          ElevatedButton(
              onPressed: (){
                widget.viewModellllll.updateSelectedDoctorssssssList();
              }, child: const Text("Done"))
        ],
      ),
    );
  }
}
