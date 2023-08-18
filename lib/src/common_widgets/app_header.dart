import 'package:flutter/material.dart';
import 'package:wiseki_note_app/src/constants/app_text_style/inter.dart';
import 'package:wiseki_note_app/src/constants/colors.dart';

class AppHeader extends StatelessWidget {
  final String? heading;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onTapPrefix;
  const AppHeader({
    this.heading,
    this.suffixIcon,
    this.prefixIcon,
    this.onTapPrefix,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            onTapPrefix?.call();
          },
          child: prefixIcon ??
              const Icon(
                Icons.keyboard_arrow_left,
                color: kPrimary,
                size: 40,
              ),
        ),
        Text(
          heading ?? '',
          style: AppStyleInter.kFontW6.copyWith(fontSize: 20),
        ),
        suffixIcon ?? const SizedBox(width: 25),
      ],
    );
  }
}
