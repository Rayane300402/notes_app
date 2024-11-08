import 'package:flutter/material.dart';
import 'package:notes_app/components/drawer_tile.dart';
import 'package:notes_app/pages/notes_page.dart';
import 'package:notes_app/pages/settings.dart';

class CustomDrawer extends StatelessWidget {
  final bool isNotesPage;
  CustomDrawer({super.key, required this.isNotesPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // header
          Theme(
              data: Theme.of(context).copyWith(
                dividerTheme: const DividerThemeData(color: Colors.transparent),
              ),
              child: DrawerHeader(
                child: Icon(
                    Icons.notes,
                    size: 48,
                    color: Theme.of(context).colorScheme.inversePrimary
                ),
              )),
          
          //notes tile
          DrawerTile(text: "Notes", icon: Icons.home, onTap: ()
          {

            Navigator.pop(context);
            if(!isNotesPage){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotesPage()));
            }
          }),
          DrawerTile(text: "Settings", icon: Icons.settings, onTap: (){

            Navigator.pop(context);

            if(isNotesPage){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
            }

          }),
        ],
      ),
    );
  }
}
