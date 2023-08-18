import 'package:flutter/material.dart';
import 'package:wiseki_note_app/src/constants/app_text_style/inter.dart';
import 'package:wiseki_note_app/src/constants/app_text_style/source_serif.dart';
import 'package:wiseki_note_app/src/constants/colors.dart';

class NoteTile extends StatelessWidget {
  final String noteTitle;
  final String noteBody;
  final String dateTime;
  final bool isFavorite;
  final void Function()? favoriteNote;
  final void Function()? deleteNote;
  final Color tileColor;
  const NoteTile({
    required this.noteTitle,
    required this.noteBody,
    required this.dateTime,
    required this.tileColor,
    required this.isFavorite,
    this.favoriteNote,
    this.deleteNote,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Container(
        width: 377,
        height: 164,
        padding: const EdgeInsets.fromLTRB(21, 17, 12, 8),
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(noteTitle,
                    style: AppStyleSourceSerif4.kFontW7.copyWith(fontSize: 16)),
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
                              Image.asset('assets/icons/favorite.png'),
                              const SizedBox(width: 20),
                              Text(
                                'Favorite',
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
                              Image.asset('assets/icons/delete.png'),
                              const SizedBox(width: 20),
                              Text(
                                'Delete',
                                style: AppStyleInter.kFontW5
                                    .copyWith(color: kPrimary, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                      onSelected: (String value) {
                        if (value == 'screen1') {
                          favoriteNote?.call();
                        } else if (value == 'screen2') {
                          deleteNote?.call();
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              width: 342,
              child: Text(
                  noteBody.length >= 100
                      ? '${noteBody.substring(0, 100)}......'
                      : noteBody,
                  style: AppStyleSourceSerif4.kFontW3.copyWith(fontSize: 14)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: favoriteNote,
                  child: isFavorite
                      ? const Icon(Icons.favorite, color: kRed)
                      : Container(),
                ),
                const SizedBox(width: 10),
                Text(dateTime,
                    style: AppStyleSourceSerif4.kFontW3.copyWith(fontSize: 10)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
