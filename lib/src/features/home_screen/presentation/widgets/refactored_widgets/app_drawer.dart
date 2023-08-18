import 'package:flutter/material.dart';
import 'package:wiseki_note_app/src/constants/routers.dart';
import 'package:wiseki_note_app/src/features/home_screen/presentation/controllers/auth_controllers.dart';
import 'package:wiseki_note_app/src/features/home_screen/presentation/widgets/add_new_note.dart';
import 'package:wiseki_note_app/src/features/home_screen/presentation/widgets/refactored_widgets/drawer_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 227,
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text(''),
          ),
          DrawerItem(
            icon: 'assets/icons/all_notes.png',
            title: 'All Note',
            onTap: () {},
          ),
          DrawerItem(
            icon: 'assets/icons/notebook.png',
            title: 'Notebook',
            onTap: () {
              PageNavigator(ctx: context)
                  .nextPage(page: AddNewNote(NoteController()));
            },
          ),
          DrawerItem(
            icon: 'assets/icons/favorite.png',
            title: 'Favorite',
            onTap: () {},
          ),
          DrawerItem(
            icon: 'assets/icons/delete.png',
            title: 'Deleted',
            onTap: () {},
          ),
          DrawerItem(
            icon: 'assets/icons/settings.png',
            title: 'Settings',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
