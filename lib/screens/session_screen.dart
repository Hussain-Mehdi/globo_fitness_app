import 'package:flutter/material.dart';

import '../data/session.dart';
import '../data/sp_helper.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  final TextEditingController descriptionTxt = TextEditingController();
  final TextEditingController durationTxt = TextEditingController();
  SPHelper sphelper = SPHelper();

  List<Session> sessions = [];

  @override
  void initState() {
    sphelper.init().then((value) => {updateScreen()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Session"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSessionDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: getContent(),
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Insert Traning Session"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: descriptionTxt,
                    decoration: const InputDecoration(
                      hintText: "Description",
                    ),
                  ),
                  TextField(
                    controller: durationTxt,
                    decoration: const InputDecoration(
                      hintText: "Duration",
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    descriptionTxt.text = '';
                    durationTxt.text = '';
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    saveSession();
                    setState(() {});
                  },
                  child: const Text("Save"))
            ],
          );
        });
  }

  Future saveSession() async {
    DateTime time = DateTime.now();
    String today = '${time.year}-${time.month}-${time.day}';
    int id = sphelper.getCounter() + 1;
    Session newSession = Session(id, today.toString(), descriptionTxt.text,
        int.tryParse(durationTxt.text) ?? 0);
    sphelper.writeSession(newSession).then((_) {
      updateScreen();
      sphelper.setCounter();
    });
    descriptionTxt.text = '';
    durationTxt.text = '';
    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    sessions.forEach((session) {
      tiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          sphelper.deleteSession(session.id);
        },
        child: ListTile(
          title: Text(session.desciption),
          subtitle: Text(
              '${session.date}  duration: ${session.duration.toString()} min'),
        ),
      ));
    });
    return tiles;
  }

  void updateScreen() {
    sessions = sphelper.getSessions();
    setState(() {});
  }
}
