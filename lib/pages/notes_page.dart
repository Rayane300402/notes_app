// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  TextEditingController textController = TextEditingController();

  // create
  void createNote(){
    showDialog(
        context: context,
        builder:(context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          content: TextField(
            controller: textController,
          ),
          actions: [
            // create a confirm button

          ],
        )
    );
  }

  // read

  // update

  // delete

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes', style: TextStyle(color: Colors.white),), backgroundColor: Colors.blue, centerTitle: true,),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Colors.blue,
        shape: const  CircleBorder(),
        child: const  Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
