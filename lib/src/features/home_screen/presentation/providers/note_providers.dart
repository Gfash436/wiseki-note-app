import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wiseki_note_app/src/features/home_screen/presentation/providers/save_note_notifier.dart';
import 'package:wiseki_note_app/src/features/home_screen/domain/models/note_model.dart';

final savedNotesProvider =
    StateNotifierProvider<SavedNotesNotifier, List<NoteModel>>(
  (ref) => SavedNotesNotifier(),
);

final pinnedNotesProvider =
    StateNotifierProvider<SavedNotesNotifier, List<NoteModel>>(
  (ref) => SavedNotesNotifier(),
);

final favoriteNoteProvider = StateProvider.autoDispose<int>((ref) => -1);
