import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wiseki_note_app/src/constants/app_text_style/source_serif.dart';
import 'package:wiseki_note_app/src/constants/colors.dart';

class CustomButton extends ConsumerWidget {
  const CustomButton({
    Key? key,
    this.title,
    this.titleColor,
    this.buttonColor,
    this.height,
    this.width,
    this.borderColor,
    required this.onPressed,
    this.iconVisibility,
    this.titleStyle,
    this.borderRadius,
    this.style,
    this.icon,
    this.child,
    this.elevation,
    this.overlayColor,
  }) : super(key: key);

  final String? title;
  final IconData? icon;
  final Color? titleColor;
  final TextStyle? titleStyle;
  final Color? buttonColor;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Function()? onPressed;
  final bool? iconVisibility;
  final double? borderRadius;
  final Widget? child;
  final ButtonStyle? style;
  final MaterialStateProperty<double?>? elevation;
  final MaterialStateProperty<Color?>? overlayColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: width ?? double.maxFinite,
      height: height ?? 40,
      child: ElevatedButton(
        style: style ??
            ButtonStyle(
              elevation: elevation ?? MaterialStateProperty.all(0.5),
              overlayColor: overlayColor,
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
                      side: BorderSide(color: borderColor ?? kPrimary))),
              backgroundColor:
                  MaterialStateProperty.all<Color>(buttonColor ?? kPrimary),
            ),
        onPressed: onPressed,
        child: child ??
            Text(
              title ?? 'Continue',
              style: titleStyle ??
                  AppStyleSourceSerif4.kFontW7
                      .copyWith(color: titleColor ?? kWhite, fontSize: 14),
            ),
      ),
    );
  }
}
