import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wiseki_note_app/src/features/home_screen/domain/models/note_model.dart';
import 'package:wiseki_note_app/src/utils/note%20preference/note_preference.dart';

class SavedNotesNotifier extends StateNotifier<List<NoteModel>> {
  SavedNotesNotifier() : super([]);

  addSavedNote(NoteModel note) async {
    final updatedNotes = [...state, note];
    state = updatedNotes;
    await NotePreferences.setSavedNotes(updatedNotes);
  }

  removeSavedNote(NoteModel note) async {
    final updatedNotes = state.where((_note) => _note != note).toList();
    state = updatedNotes;
    await NotePreferences.setSavedNotes(updatedNotes);
  }
}
