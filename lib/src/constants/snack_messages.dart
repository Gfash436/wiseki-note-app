import 'package:flutter/material.dart';
import 'package:wiseki_note_app/src/constants/app_text_style/poppins.dart';
import 'package:wiseki_note_app/src/constants/colors.dart';
import 'package:wiseki_note_app/src/constants/custom_snack_bar.dart';

void successMessage({
  required BuildContext context,
  required String message,
}) {
  showCustomSnackBar(
    context,
    Container(
      height: 60,
      margin: const EdgeInsets.only(
        left: 20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      decoration: const BoxDecoration(
          color: kGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          )),
      child: Scaffold(
        backgroundColor: kGrey,
        body: Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              const Icon(
                Icons.check_circle_rounded,
                color: klightGreen,
                size: 30,
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Text(message,
                      style: AppStylePoppins.kFontW5
                          .copyWith(fontSize: 14, color: kBlack)))
            ],
          ),
        ),
      ),
    ),
    displayDuration: const Duration(seconds: 5),
    dismissDirection: DismissDirection.up,
    curve: Curves.easeIn,
    reverseCurve: Curves.easeOut,
  );
}

void errorMessage({
  required BuildContext context,
  required String message,
}) {
  showCustomSnackBar(
    context,
    Container(
      height: 60,
      margin: const EdgeInsets.only(
        left: 20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      decoration: const BoxDecoration(
          color: kGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          )),
      child: Scaffold(
        backgroundColor: kGrey,
        body: Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              const Icon(
                Icons.cancel_rounded,
                color: kRed,
                size: 30,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  style: AppStylePoppins.kFontW5
                      .copyWith(fontSize: 14, color: kBlack),
                ),
              )
            ],
          ),
        ),
      ),
    ),
    displayDuration: const Duration(seconds: 5),
    dismissDirection: DismissDirection.horizontal,
    curve: Curves.easeIn,
    reverseCurve: Curves.easeOut,
  );
}
