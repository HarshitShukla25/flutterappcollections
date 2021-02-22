import 'package:flutter/material.dart';
import 'package:timerapp/notes_app/notes_app.dart';

class NoteEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final bodyController = TextEditingController();
    final priority = ValueNotifier(0);
    return Scaffold(
      appBar: AppBar(
        title: Text('New Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
                ),
              ),
              controller: titleController,
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButtonFormField<int>(
                value: priority.value,
                icon: Text('Priority'),
                items: List.generate(
                    3,
                    (index) => DropdownMenuItem(
                        value: index, child: Text(index.toString()))),
                onChanged: (value) {
                  priority.value = value;
                }),
            TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Let\'s take some notes'),
                controller: bodyController,
                maxLines: null),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final note = Note(
              body: bodyController.text,
              title: titleController.text,
              priority: priority.value,
              date: DateTime.now());
          notes.add(note);
          Navigator.of(context).pop();
        },
        child: Icon(Icons.edit_outlined),
      ),
    );
  }
}
