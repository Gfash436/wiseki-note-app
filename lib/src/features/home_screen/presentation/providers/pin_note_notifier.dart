import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wiseki_note_app/src/features/home_screen/domain/models/note_model.dart';

class PinNotesNotifier extends StateNotifier<List<NoteModel>> {
  PinNotesNotifier() : super([]) {
    _loadPinnedNotes();
  }

  Future<void> _loadPinnedNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final notesJson = prefs.getString('notes');
    if (notesJson != null) {
      final List<dynamic> notesData = jsonDecode(notesJson);
      state = notesData.map((data) {
        final note = NoteModel.fromJson(data);
        // Handle the case where 'isFavorite' key is missing
        return note.copyWith(isFavorite: data['isFavorite'] ?? false);
      }).toList();
    }
  }

  Future<void> _pinNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final pinNotesJson = jsonEncode(state);
    await prefs.setString('pinNote', pinNotesJson);
  }

  void toggleFavorite(NoteModel note) {
    final updatedNotes = state.map((n) {
      if (n == note) {
        return n.copyWith(
            isFavorite: n.isFavorite == null ? true : !n.isFavorite!);
      }
      return n;
    }).toList();
    state = updatedNotes;
    _pinNotes(); // Persist the changes
  }

  void addPinnedNote(NoteModel note) {
    final updatedNotes = [...state, note];
    state = updatedNotes;
    _pinNotes(); // Persist the changes
  }

  removePinnedNote(NoteModel note) {
    final updatedNotes = state.where((n) => n != note).toList();
    state = updatedNotes;
    _pinNotes(); // Persist the changes
  }
}
