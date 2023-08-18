import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wiseki_note_app/src/features/home_screen/domain/models/note_model.dart';
import 'package:wiseki_note_app/src/utils/note%20preference/note_preference.dart';

class SavedNotesNotifier extends StateNotifier<List<NoteModel>> {
  SavedNotesNotifier() : super([]);

  // Future<void> initSavedNotes() async {
  //   final savedNotes = await NotePreferences.getSavedNotes();
  //   state = savedNotes;
  // }

  void addSavedNote(NoteModel note) async {
    state = [...state, note];
    // await NotePreferences.setSavedNotes(state);
  }

  void removeSavedNote(NoteModel note) async {
    state = state.where((_note) => _note != note).toList();
  }
}
