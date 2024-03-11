import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_patient/screen/videocall/api.dart';
import 'meeting_screen.dart';

class JoinScreen extends StatelessWidget {
  final _meetingIdController = TextEditingController();

  JoinScreen({super.key});

  void onCreateButtonPressed(BuildContext context) async {
    // call api to create meeting and then navigate to MeetingScreen with meetingId,token
    await createMeeting().then((meetingId) {
      if (!context.mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MeetingScreen(
            meetingId: meetingId,
            token: token,
          ),
        ),
      );
    });
  }

  void onJoinButtonPressed(BuildContext context) {
    String meetingId = _meetingIdController.text;
    var re = RegExp("\\w{4}\\-\\w{4}\\-\\w{4}");
    // check meeting id is not null or invaild
    // if meeting id is vaild then navigate to MeetingScreen with meetingId,token
    if (meetingId.isNotEmpty && re.hasMatch(meetingId)) {
      _meetingIdController.clear();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MeetingScreen(
            meetingId: meetingId,
            token: token,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter valid meeting id"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Meeting',style: TextStyle(fontSize: 30,color: Colors.black),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [

            Container(
              child: ElevatedButton(
                onPressed: () => onCreateButtonPressed(context),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.indigo[900], elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
                child:  Text('Create Meeting',style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
    ),

              ),







            Container(
              margin: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Meeting Id',
                  border: OutlineInputBorder(),
                ),
                controller: _meetingIdController,
              ),
            ),
            ElevatedButton(
              onPressed: () => onJoinButtonPressed(context),
    style: ElevatedButton.styleFrom(
    foregroundColor: Colors.black, backgroundColor: Colors.indigo[900], elevation: 2,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(32.0),
    ),
    ),
              child:  Text('Join Meeting',style: GoogleFonts.lato(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.bold,
    )),
    ),

          ],
        ),
      ),
    );
  }
}