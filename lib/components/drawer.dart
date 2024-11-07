import 'package:flutter/material.dart';
import 'package:notes_app/components/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

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
                    Icons.note,
                    size: 48,
                    color: Theme.of(context).colorScheme.inversePrimary
                ),
              )),
          
          //notes tile
          DrawerTile(text: "Notes", icon: Icons.home, onTap: () => Navigator.pop(context)),
          DrawerTile(text: "Settings", icon: Icons.settings, onTap: (){}),
        ],
      ),
    );
  }
}
