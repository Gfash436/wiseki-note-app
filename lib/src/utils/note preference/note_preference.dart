import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wiseki_note_app/src/features/home_screen/domain/models/note_model.dart';

class NotePreferences {
  static const _keySavedNotes = 'savedNotes';

  static late SharedPreferences _preferences;

  // Initialize SharedPreference
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future<void> setSavedNotes(List<NoteModel> notes) async {
    final notesJson = notes.map((note) => note.toJson()).toList();
    final notesString = jsonEncode(notesJson);
    await _preferences.setString(_keySavedNotes, notesString);
  }

  static Future<List<NoteModel>> getSavedNotes() async {
    final notesJson = _preferences.getString(_keySavedNotes);
    if (notesJson != null) {
      final notesList = (jsonDecode(notesJson) as List)
          .map((note) => NoteModel.fromJson(note))
          .toList();
      return notesList;
    }
    return [];
  }

  static Future<void> removeSavedNoteByIndex(int index) async {
    final savedNotes = await getSavedNotes();
    if (index >= 0 && index < savedNotes.length) {
      savedNotes.removeAt(index);
      await setSavedNotes(savedNotes);
    }
  }
}
