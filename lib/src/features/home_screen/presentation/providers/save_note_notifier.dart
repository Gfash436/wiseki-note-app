import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wiseki_note_app/src/features/home_screen/domain/models/note_model.dart';

class SavedNotesNotifier extends StateNotifier<List<NoteModel>> {
  SavedNotesNotifier() : super([]) {
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final notesJson = prefs.getString('notes');
    if (notesJson != null) {
      final List<dynamic> notesData = jsonDecode(notesJson);
      state = notesData.map((data) => NoteModel.fromJson(data)).toList();
    }
  }

  Future<void> _saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final notesJson = jsonEncode(state);
    await prefs.setString('notes', notesJson);
  }

  void addSavedNote(NoteModel note) {
    final updatedNotes = [...state, note];
    state = updatedNotes;
    _saveNotes(); // Persist the changes
  }

  removeSavedNote(NoteModel note) {
    final updatedNotes = state.where((n) => n != note).toList();
    state = updatedNotes;
    _saveNotes(); // Persist the changes
  }
}
