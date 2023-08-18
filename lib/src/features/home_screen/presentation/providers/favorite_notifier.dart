import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteNotifier extends StateNotifier<Widget?> {
  FavoriteNotifier() : super(null);

  void favoriteNote(Widget favNote) {
    state = favNote;
  }
}
