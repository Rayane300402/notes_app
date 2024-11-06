import 'package:flutter/material.dart';
import 'package:notes_app/models/note_db.dart';
import 'package:notes_app/pages/notes_page.dart';
import 'package:provider/provider.dart';

void main() async{
  // initialize db
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(
      ChangeNotifierProvider(
          create: (_) => NoteDatabase(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
    );
  }
}

