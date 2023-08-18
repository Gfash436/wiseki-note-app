import 'package:flutter/material.dart';
import 'package:wiseki_note_app/src/constants/app_text_style/inter.dart';
import 'package:wiseki_note_app/src/constants/colors.dart';

class DrawerItem extends StatelessWidget {
  final String icon;
  final String title;
  final void Function()? onTap;

  const DrawerItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(36, 37.2, 0, 0),
      child: InkWell(
        onTap: onTap,
        child: Row(children: [
          Image.asset(icon),
          const SizedBox(width: 13.55),
          Text(
            title,
            style:
                AppStyleInter.kFontW5.copyWith(fontSize: 14, color: kPrimary),
          ),
        ]),
      ),
    );
  }
}
