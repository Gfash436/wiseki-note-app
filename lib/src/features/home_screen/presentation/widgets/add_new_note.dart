// ignore_for_file: must_be_immutable, use_build_context_synchronously, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:wiseki_note_app/src/common_widgets/app_header.dart';
import 'package:wiseki_note_app/src/constants/app_text_style/inter.dart';
import 'package:wiseki_note_app/src/constants/app_text_style/source_serif.dart';
import 'package:wiseki_note_app/src/constants/colors.dart';
import 'package:wiseki_note_app/src/constants/snack_messages.dart';
import 'package:wiseki_note_app/src/features/home_screen/domain/models/note_model.dart';
import 'package:wiseki_note_app/src/features/home_screen/presentation/controllers/auth_controllers.dart';
import 'package:wiseki_note_app/src/features/home_screen/presentation/providers/note_providers.dart';

class AddNewNote extends ConsumerStatefulWidget {
  NoteController noteController;
  AddNewNote(this.noteController, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends ConsumerState<AddNewNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(28, 32, 28, 0),
        child: SafeArea(
          child: Column(children: [
            AppHeader(
                heading: 'Add New Note',
                onTapPrefix: () {
                  Navigator.pop(context);
                },
                suffixIcon: InkWell(
                  onTap: () async {
                    if (widget.noteController.titleController.text.isNotEmpty ||
                        widget.noteController.noteController.text.isNotEmpty) {
                      // Get the current date and time
                      final now = DateTime.now();
                      final formattedDateTime =
                          DateFormat('hh:mm a | dd-MM-yyyy').format(now);

                      // Add new saved note
                      ref.read(savedNotesProvider.notifier).addSavedNote(
                          NoteModel(
                              title: widget.noteController.titleController.text,
                              content:
                                  widget.noteController.noteController.text,
                              dateTime: formattedDateTime));

                      // Clear the text fields
                      widget.noteController.titleController.clear();
                      widget.noteController.noteController.clear();

                      // Close the PopupMenuButton
                      Navigator.pop(context);
                    } else {
                      errorMessage(
                          context: context,
                          message:
                              'Note fields can not be empty. Please, add note.');
                    }
                  },
                  child: Image.asset(
                    'assets/icons/save_note.png',
                    fit: BoxFit.fill,
                    height: 15,
                    width: 15,
                  ),
                )),
            const SizedBox(height: 64),
            SizedBox(
              height: 60,
              child: TextField(
                controller: widget.noteController.titleController,
                decoration: InputDecoration(
                  fillColor: kAsh,
                  filled: true,
                  hintText: 'Enter note title',
                  hintStyle: AppStyleSourceSerif4.kFontW7
                      .copyWith(fontSize: 24, color: kBlack),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.5, color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 0.5, color: Colors.transparent)),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: kRed, width: 0.5)),
                  focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: kRed, width: 0.5)),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              height: 283,
              decoration: BoxDecoration(
                  color: kAsh, borderRadius: BorderRadius.circular(3)),
              child: Column(
                children: [
                  TextField(
                    controller: widget.noteController.noteController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: kAsh,
                      filled: true,
                      hintText: 'Write note...',
                      hintStyle: AppStyleSourceSerif4.kFontW7
                          .copyWith(fontSize: 24, color: kBlack),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.transparent),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.5, color: Colors.transparent)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kRed, width: 0.5)),
                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kRed, width: 0.5)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PopupMenuButton<String>(
                        offset: const Offset(-10, 40),
                        icon: const Icon(Icons.more_horiz),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          PopupMenuItem(
                            height: 60,
                            value: 'screen1',
                            child: Row(
                              children: [
                                Image.asset('assets/icons/save_note.png'),
                                const SizedBox(width: 20),
                                Text(
                                  'Save',
                                  style: AppStyleInter.kFontW5
                                      .copyWith(color: kPrimary, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'screen2',
                            child: Row(
                              children: [
                                Image.asset('assets/icons/pin_note.png'),
                                const SizedBox(width: 20),
                                Text(
                                  'Pin Note',
                                  style: AppStyleInter.kFontW5
                                      .copyWith(color: kPrimary, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                        onSelected: (String value) async {
                          if (value == 'screen1') {
                            if (widget.noteController.titleController.text
                                    .isNotEmpty ||
                                widget.noteController.noteController.text
                                    .isNotEmpty) {
                              // Get the current date and time
                              final now = DateTime.now();
                              final formattedDateTime =
                                  DateFormat('hh:mm a | dd-MM-yyyy')
                                      .format(now);

                              // Add new saved noted
                              ref
                                  .read(savedNotesProvider.notifier)
                                  .addSavedNote(NoteModel(
                                      title: widget
                                          .noteController.titleController.text,
                                      content: widget
                                          .noteController.noteController.text,
                                      dateTime: formattedDateTime));

                              // Clear the text fields
                              widget.noteController.titleController.clear();
                              widget.noteController.noteController.clear();

                              // Close the PopupMenuButton
                              Navigator.pop(context);
                            } else {
                              errorMessage(
                                  context: context,
                                  message:
                                      'Note fields can not be empty. Please, add note.');
                            }
                          } else if (value == 'screen2') {
                            if (widget.noteController.titleController.text
                                    .isNotEmpty ||
                                widget.noteController.noteController.text
                                    .isNotEmpty) {
                              // Get the current date and time
                              final now = DateTime.now();
                              final formattedDateTime =
                                  DateFormat('hh:mm a | dd-MM-yyyy')
                                      .format(now);

                              // Add new pinned note
                              ref
                                  .read(pinnedNotesProvider.notifier)
                                  .addPinnedNote(NoteModel(
                                      title: widget
                                          .noteController.titleController.text,
                                      content: widget
                                          .noteController.noteController.text,
                                      dateTime: formattedDateTime));

                              // Clear the text fields
                              widget.noteController.titleController.clear();
                              widget.noteController.noteController.clear();

                              // Close the PopupMenuButton
                              Navigator.pop(context);
                            } else {
                              errorMessage(
                                  context: context,
                                  message:
                                      'Note fields can not be empty. Please, add note.');
                            }
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
