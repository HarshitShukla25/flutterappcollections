import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timerapp/notes_app/note_entry_page.dart';

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primarySwatch: Colors.green),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notes App'),
        ),
        body: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var note in notes)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.yellowAccent.shade400,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(note.title),
                            Text('❗' * note.priority),
                          ],
                        ),
                        Text(note.body),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Text(convertToDate(note.date))],
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NoteEntryPage()),
            );
          },
          child: Icon(Icons.edit_outlined),
        ),
      ),
    );
  }
}

class Note {
  final String title;
  final String body;
  final int priority;
  final DateTime date;
  //1 is least imp 3 is very important.
  Note({this.title, this.body, this.date, this.priority});

  @override
  String toString() {
    return 'Note(title: $title, body: $body, priority: $priority, date: $date)';
  }
}

final exampleNote = Note(
    title: 'Creating a Notes App',
    body: 'We need to be able to create, update, delete and read',
    date: DateTime(2020, 11, 7),
    priority: 1);
final notes = [exampleNote, exampleNote];

final dateFormat = DateFormat().add_yMMMd();
String convertToDate(DateTime date) {
  return dateFormat.format(date);
}
