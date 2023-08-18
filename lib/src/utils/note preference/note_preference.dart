// ignore_for_file: unused_field

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class NotePreferences {
  static const _keySavedNotes = 'savedNotes';

  static late SharedPreferences _preferences;

  // Initialize SharedPreference
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future<void> setSavedNotes(List<Map<String, String>> notes) async {
    final notesJson = jsonEncode(notes);
    await _preferences.setString(_keySavedNotes, notesJson);
  }

  static Future<List<Map<String, String>>> getSavedNotes() async {
    final notesJson = _preferences.getString(_keySavedNotes);
    if (notesJson != null) {
      return (jsonDecode(notesJson) as List)
          .map((note) => Map<String, String>.from(note))
          .toList();
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
