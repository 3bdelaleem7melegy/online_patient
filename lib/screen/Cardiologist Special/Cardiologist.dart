// ignore_for_file: file_names, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_patient/firestore-data/searchList.dart';
// import 'package:online_patient/screen/Booking/bookingScreen%20Cardiologist%20.dart';
// import 'package:online_patient/screen/Booking/bookingScreen%20Dentist.dart';
import 'package:online_patient/screen/Cardiologist%20Special/DoctorBottomSheetWidget.dart';
import 'package:online_patient/screen/Cardiologist%20Special/LocationsBottomSheetWidget.dart';
import 'package:online_patient/screen/Cardiologist%20Special/ViewModel.dart';

import 'package:provider/provider.dart';

class Cardiologist extends StatefulWidget {
  const Cardiologist({super.key});

  @override
  State<Cardiologist> createState() => _CardiologistState();
}

class _CardiologistState extends State<Cardiologist> {
  List<int>? filterIndex;
  final TextEditingController _doctorName = TextEditingController();

  ViewModel viewModel = ViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Cardiologist',
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ),
          body: Consumer<ViewModel>(
            builder: (context, value, child) {
              if (value.errorMessage != null) {
                return Text(value.errorMessage!);
              } else if (value.data.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    // the search bar widget
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextFormField(
                        textInputAction: TextInputAction.search,
                        controller: _doctorName,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 10),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'Search doctor',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                          suffixIcon: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[900]?.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              iconSize: 20,
                              splashRadius: 20,
                              color: Colors.white,
                              icon: const Icon(Icons.search),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                        onFieldSubmitted: (String value) {
                          setState(
                            () {
                              value.isEmpty
                                  ? Container()
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SearchList(searchKey: value),
                                      ));
                            },
                          );
                        },
                      ),
                    ),
                    // the filter buttons list
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              showDoctorsModalBottomSheet(value);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Doctors",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                          )),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              showLocationsModalBottomSheet(viewModel);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Locations",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => BookingScreenDentist(
                            //         doctor: viewModel.data[index]["name"],
                            //         key: null,
                            //         name: FirebaseAuth.instance.currentUser!
                            //                 .displayName ??
                            //             "",
                            //         image: viewModel.data[index]["imageUrl"],
                            //         id: FirebaseAuth
                            //                 .instance.currentUser!.uid ??
                            //             "",
                            //         Special: viewModel.data[index]["Special"],
                            //       ),
                            //     ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue[700],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(children: [
                              Container(
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(value.data[index]["imageUrl"]),
                                  radius: 50,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  Container(
                                    child: Text(
                                      value.data[index]["name"],
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      value.data[index]["location"],
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      value.data[index]["Price"],
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                            //
                          ),
                        ),
                        itemCount: value.data.length,
                      ),
                    ),
                  ],
                );
              }
            },
          )),
    );
  }

  showDoctorsModalBottomSheet(ViewModel viewModel) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (context) => DoctorBottomSheetWidget(viewModel: viewModel));
  }

  showLocationsModalBottomSheet(ViewModel viewModel) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (context) => LocationsBottomSheetWidget(viewModel: viewModel));
  }
}
