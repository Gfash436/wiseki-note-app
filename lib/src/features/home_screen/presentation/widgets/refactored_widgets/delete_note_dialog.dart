import 'package:flutter/material.dart';
import 'package:wiseki_note_app/src/common_widgets/custom_button.dart';
import 'package:wiseki_note_app/src/constants/app_text_style/source_serif.dart';
import 'package:wiseki_note_app/src/constants/colors.dart';

deleteNoteDialog({required BuildContext context, void Function()? deleteNote}) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        title: Column(
          children: [
            const Icon(
              Icons.delete,
              size: 80,
              color: kRed,
            ),
            const SizedBox(height: 20),
            Text(
              'Are you sure you want to delete this note?',
              style: AppStyleSourceSerif4.kFontW6
                  .copyWith(fontSize: 16, color: kBlack),
            ),
            const SizedBox(height: 30),
            CustomButton(
              onPressed: () {
                deleteNote?.call();
              },
              title: 'Delete Note',
              buttonColor: kRed,
              borderColor: kRed,
            ),
            const SizedBox(height: 10),
            CustomButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              title: 'Close',
              buttonColor: kGrey,
              borderColor: kGrey,
            )
          ],
        ),
      );
    },
  );
}
