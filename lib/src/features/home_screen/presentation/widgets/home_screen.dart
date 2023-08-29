import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wiseki_note_app/src/common_widgets/app_header.dart';
import 'package:wiseki_note_app/src/constants/app_text_style/inter.dart';
import 'package:wiseki_note_app/src/constants/app_text_style/source_serif.dart';
import 'package:wiseki_note_app/src/constants/colors.dart';
import 'package:wiseki_note_app/src/constants/routers.dart';
import 'package:wiseki_note_app/src/features/home_screen/domain/models/note_model.dart';
import 'package:wiseki_note_app/src/features/home_screen/presentation/controllers/auth_controllers.dart';
import 'package:wiseki_note_app/src/features/home_screen/presentation/providers/note_providers.dart';
import 'package:wiseki_note_app/src/features/home_screen/presentation/widgets/add_new_note.dart';
import 'package:wiseki_note_app/src/features/home_screen/presentation/widgets/refactored_widgets/app_drawer.dart';
import 'package:wiseki_note_app/src/features/home_screen/presentation/widgets/refactored_widgets/delete_note_dialog.dart';
import 'package:wiseki_note_app/src/features/home_screen/presentation/widgets/refactored_widgets/note_tile.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _isSearching = false;
  String _searchQuery = '';

  // Function to generate a random color
  Color _getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final savedNotes = ref.watch(savedNotesProvider);
    final pinnedNotes = ref.watch(pinnedNotesProvider);
    List<NoteModel> filteredNotes = _searchQuery.isEmpty
        ? savedNotes
        : savedNotes
            .where((note) =>
                note.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                note.content.toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList();
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          // ref.refresh(savedNotesProvider);
          // ref.refresh(pinnedNotesProvider);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 32, 28, 0),
          child: SafeArea(
            child: Column(
              children: [
                AppHeader(
                  heading: 'All Notes',
                  onTapPrefix: () {
                    _openDrawer();
                  },
                  prefixIcon: Image.asset('assets/icons/note_menu.png'),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _isSearching = !_isSearching;
                      });
                    },
                    child: const Icon(
                      Icons.search,
                      color: kPrimary,
                    ),
                  ),
                ),
                if (_isSearching) ...[
                  const SizedBox(height: 16),
                  TextField(
                    onChanged: (searchQuery) {
                      setState(() {
                        _searchQuery = searchQuery;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search notes...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isSearching = false;
                            _searchQuery = '';
                          });
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 39),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'PINNED NOTES',
                      style: AppStyleInter.kFontW4
                          .copyWith(fontSize: 16, color: kPrimary),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                      'assets/icons/edit_note.png')),
                              InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                      'assets/icons/note_grid.png')),
                              InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                      'assets/icons/note_filter.png'))
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 250,
                          child: Divider(
                            color: kPrimary,
                            thickness: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Expanded(
                  child: SizedBox(
                    height: 400,
                    child: pinnedNotes.isNotEmpty
                        ? ListView.builder(
                            itemCount: pinnedNotes.length,
                            itemBuilder: (context, index) {
                              final note = pinnedNotes[index];
                              final isFavorite = index ==
                                  ref
                                      .watch(favoriteNoteProvider.notifier)
                                      .state;
                              Color randomColor = _getRandomColor();
                              return NoteTile(
                                noteTitle: note.title,
                                noteBody: note.content,
                                dateTime: note.dateTime,
                                tileColor: randomColor,
                                favoriteNote: () {
                                  ref
                                      .read(favoriteNoteProvider.notifier)
                                      .state = index;
                                },
                                favoriteIcon:
                                    isFavorite ? Icons.favorite : null,
                                deleteNote: () {
                                  deleteNoteDialog(
                                    context: context,
                                    deleteNote: ref
                                        .read(pinnedNotesProvider.notifier)
                                        .removePinnedNote(note),
                                  );
                                },
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              'List is empty',
                              style: AppStyleSourceSerif4.kFontW7
                                  .copyWith(color: kPrimary, fontSize: 25),
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'OTHER NOTES',
                      style: AppStyleInter.kFontW4
                          .copyWith(fontSize: 16, color: kPrimary),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 250,
                          child: Divider(
                            color: kPrimary,
                            thickness: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: savedNotes.isNotEmpty
                        ? ListView.builder(
                            itemCount: savedNotes.length,
                            itemBuilder: (context, index) {
                              final note = savedNotes[index];

                              Color randomColor = _getRandomColor();
                              return NoteTile(
                                noteTitle: note.title,
                                noteBody: note.content,
                                dateTime: note.dateTime,
                                tileColor: randomColor,
                                deleteNote: () {
                                  ref
                                      .read(savedNotesProvider.notifier)
                                      .removeSavedNote(note);
                                  // deleteNoteDialog(
                                  //     context: context,
                                  //     deleteNote: () {
                                  //       ref
                                  //           .read(savedNotesProvider.notifier)
                                  //           .removeSavedNote(note);
                                  //     });
                                  // Navigator.pop(context);
                                },
                                // isFavorite: index ==
                                //     ref
                                //         .watch(favoriteNoteProvider.notifier)
                                //         .state,
                                // favoriteNote: () {
                                //   ref
                                //       .read(favoriteNoteProvider.notifier)
                                //       .state = index;
                                // },
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              'List is empty',
                              style: AppStyleSourceSerif4.kFontW7
                                  .copyWith(color: kPrimary, fontSize: 25),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 58,
        height: 58,
        child: FloatingActionButton(
          onPressed: () {
            PageNavigator(ctx: context)
                .nextPage(page: AddNewNote(NoteController()));
          },
          backgroundColor: kPrimary,
          child: const SizedBox(width: 45, height: 45, child: Icon(Icons.add)),
        ),
      ),
    );
  }
}
