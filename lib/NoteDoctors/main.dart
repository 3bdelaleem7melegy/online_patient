// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_map/NoteDoctors/constants.dart';
// import 'package:google_map/NoteDoctors/models/note_model.dart';
// import 'package:google_map/NoteDoctors/simple_bloc_observer.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'cubits/notes_cubit/notes_cubit.dart';
// import 'views/notes_view.dart';
//
// void main() async {
//   await Hive.initFlutter();
//
//   Bloc.observer = SimpleBlocObserver();
//   Hive.registerAdapter(NoteModelAdapter());
//   await Hive.openBox<NoteModel>(kNotesBox);
//
//   runApp(const NotesApp());
// }
//
// class NotesApp extends StatelessWidget {
//   const NotesApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//        create: (context) => NotesCubit(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
//         home: const NotesView(),
//       ),
//     );
//   }
// }
