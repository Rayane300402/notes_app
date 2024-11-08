import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import 'note_settings.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? update;
  final void Function()? delete;
  const NoteTile({super.key, required this.text, required this.update, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8)
      ),
      margin: const EdgeInsets.only(bottom: 10, left: 25, right: 25),
      child: ListTile(
        title: Text(
            text,
          style: TextStyle(
              fontSize:  16,
              color: Theme.of(context).colorScheme.inversePrimary
          ),
        ),

        trailing: Builder(
          builder: (context) => IconButton(
              icon: Icon(Icons.more_vert, color: Theme.of(context).colorScheme.inversePrimary,),
              onPressed: () => showPopover(
                  context: context,
                  width: 100,
                  height: 100,
                  backgroundColor:  Theme.of(context).colorScheme.surface ,
                  bodyBuilder: (context) => NoteSettings(
                    onDeleteTap: delete,
                    onEditTap: update,
                  ),
              ),
            )

        )
      ),
    );
  }
}
