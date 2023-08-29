import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteNotifier extends StateNotifier<Set<int>> {
  FavoriteNotifier() : super(Set<int>());

  void toggleFavorite(int index) {
    state.contains(index) ? state.remove(index) : state.add(index);
  }

  bool isFavorite(int index) {
    return state.contains(index);
  }
}
