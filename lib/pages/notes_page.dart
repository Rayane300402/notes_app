// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/components/drawer.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/note_db.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readNotes();
  }

  // create
  void createNote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Add Note'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              content: TextField(
                controller: textController,
              ),
              actions: [
                // create a confirm button
                MaterialButton(
                    onPressed: () {
                      context.read<NoteDatabase>().addNote(textController.text);
                      textController.clear();
                      Navigator.pop(context);
                    },
                  child: const Text("Create") ,
                )
              ],
            ));
  }

  // read
  void readNotes(){
    context.read<NoteDatabase>().fetchNotes();
  }

  // update
  void updateNote(Note note){
    textController.text = note.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Update Note"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          content: TextField(
            controller: textController,
          ),
          actions: [
            // create a confirm button
            MaterialButton(
              onPressed: () {
                context.read<NoteDatabase>().updateNote(note.id,textController.text);
                textController.clear();
                Navigator.pop(context);
              },
              child: const Text("Create") ,
            )
          ],
        ));
  }

  // delete
  void deleteNote(int id){
  context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {

    final noteDatabase = context.watch<NoteDatabase>();

    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface ,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:  Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        shape: const CircleBorder(),
        child:  Icon(Icons.add, color: Theme.of(context).colorScheme.inversePrimary,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:25.0),
            child: Text(
              "Notes",
              style: GoogleFonts.dmSerifText(
                fontSize:  48,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index){
                // get individual note
                final note = currentNotes[index];
            
                return ListTile(
                  title: Text(note.text),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // edit button
                      IconButton(onPressed: () => updateNote(note) , icon: Icon(Icons.edit,   color: Theme.of(context).colorScheme.inversePrimary)),
            
                      // delete button
                      IconButton(onPressed: () => deleteNote(note.id) , icon: Icon(Icons.delete,   color: Theme.of(context).colorScheme.inversePrimary)),
                    ],
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
