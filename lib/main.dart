import 'package:flutter/material.dart';
import 'package:notes_app/models/note_db.dart';
import 'package:notes_app/pages/notes_page.dart';
import 'package:notes_app/theme/themeProvider.dart';
import 'package:provider/provider.dart';

void main() async{
  // initialize db
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(
     MultiProvider(
         providers: [
           ChangeNotifierProvider(create: (_) => NoteDatabase()),
           ChangeNotifierProvider(create: (create) => ThemeProvider())
         ],
       child: const MyApp(),
     )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const NotesPage(),
    );
  }
}

